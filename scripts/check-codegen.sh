#!/bin/sh
# Fails when committed generated files are stale. Generated code is committed
# so reviewers see it and the app builds without a generator step; this keeps
# the two in sync.
set -e
dart run slang >/dev/null
dart run build_runner build --delete-conflicting-outputs >/dev/null
if ! git diff --exit-code --stat -- '*.g.dart' '*.freezed.dart' '*.config.dart' 'lib/core/i18n/strings.g.dart'; then
  echo "check-codegen: generated files are stale. Run 'make gen' and commit the result."
  exit 1
fi
echo "check-codegen: ok"
