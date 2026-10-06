#!/bin/sh
# Push a Shorebird OTA patch from a developer machine.
#
#   scripts/shorebird-patch.sh android staging 1.2.0+48            # dry run (default)
#   scripts/shorebird-patch.sh ios prod 1.2.0+47 --publish
#   scripts/shorebird-patch.sh ios prod 1.2.0+47 --publish --track staging
#
# A patch must be built with the SAME defines as its release, and the only
# source for those is env/<flavor>.json: the same file codemagic.yaml uses.
set -e
PLATFORM="$1"; FLAVOR="$2"; RELEASE_VERSION="$3"
shift 3 2>/dev/null || true
if [ -z "$PLATFORM" ] || [ -z "$FLAVOR" ] || [ -z "$RELEASE_VERSION" ]; then
  echo "usage: $0 <android|ios> <dev|staging|prod> <release-version> [--publish] [extra shorebird args]" >&2
  echo "  find release versions with: shorebird releases list --flavor <flavor>" >&2
  exit 2
fi
if [ ! -f "env/$FLAVOR.json" ]; then
  echo "no env/$FLAVOR.json" >&2
  exit 2
fi
FLUTTER_VERSION=$(tr -d '[:space:]' < .fvmrc)

# A patch ships the working tree with no review and no store gate: refuse a
# dirty or stale tree.
if [ -n "$(git status --porcelain)" ]; then
  echo "refusing to patch: working tree is dirty. Commit or stash first." >&2
  git status --short >&2
  exit 1
fi
git fetch --quiet origin || echo "warning: could not reach origin; staleness unverified" >&2
UPSTREAM=$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || echo origin/main)
if git rev-parse --verify --quiet "$UPSTREAM" >/dev/null; then
  BEHIND=$(git rev-list --count "HEAD..$UPSTREAM")
  if [ "$BEHIND" != "0" ]; then
    echo "refusing to patch: $BEHIND commit(s) behind $UPSTREAM. Run git pull first." >&2
    exit 1
  fi
fi

case "$PLATFORM" in
  android)
    if [ ! -f android/key.properties ]; then
      echo "refusing to patch: android/key.properties is missing (RELEASE.md, Local signing)." >&2
      exit 1
    fi
    ;;
  ios) ;;
  *) echo "unknown platform: $PLATFORM (expected android or ios)" >&2; exit 2;;
esac

MODE="--dry-run"
EXTRA=""
for arg in "$@"; do
  if [ "$arg" = "--publish" ]; then MODE=""; else EXTRA="$EXTRA $arg"; fi
done
if [ -z "$MODE" ]; then
  echo "PUBLISHING a $PLATFORM/$FLAVOR patch to release $RELEASE_VERSION. Users get this."
  printf "Type the release version to confirm: "
  read -r confirm
  if [ "$confirm" != "$RELEASE_VERSION" ]; then
    echo "aborted." >&2
    exit 1
  fi
fi

set -x
exec shorebird patch "$PLATFORM" --flavor "$FLAVOR" -t "lib/main_$FLAVOR.dart" \
  --release-version="$RELEASE_VERSION" --flutter-version="$FLUTTER_VERSION" \
  --dart-define-from-file="env/$FLAVOR.json" $MODE $EXTRA
