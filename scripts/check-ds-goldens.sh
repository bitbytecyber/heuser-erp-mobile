#!/bin/sh
# Every exported component in the design system must have a golden test, so a
# theme or preset change cannot silently restyle a component nobody looked at.
set -e
missing=""
for f in $(find packages/heuser_ds/lib/src/components -name 'h_*.dart' 2>/dev/null); do
  name=$(basename "$f" .dart)
  case "$name" in *_masks|*_internal|*_style|*_variant) continue;; esac
  if [ ! -f "packages/heuser_ds/test/goldens/${name}_golden_test.dart" ]; then
    missing="$missing\n  $f -> packages/heuser_ds/test/goldens/${name}_golden_test.dart"
  fi
done
if [ -n "$missing" ]; then
  printf 'check-ds-goldens: components without a golden test:%b\n' "$missing"
  exit 1
fi
echo "check-ds-goldens: ok"
