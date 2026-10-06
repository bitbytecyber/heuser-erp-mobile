#!/bin/sh
# Line-coverage gate on the parts that carry logic: lib/core/ and every
# feature's domain/. Presentation is covered by widget and golden tests, not by
# this number. Requires coverage/lcov.info from `flutter test --coverage`.
set -e
MIN=${MIN_COVERAGE:-80}
LCOV=coverage/lcov.info
if [ ! -f "$LCOV" ]; then
  echo "coverage-gate: $LCOV missing (run flutter test --coverage)"
  exit 1
fi
awk -v min="$MIN" '
  /^SF:/ {
    f = $0
    gated = (f ~ /lib[\\\/]core[\\\/]/ || f ~ /lib[\\\/]features[\\\/][^\\\/]+[\\\/]domain[\\\/]/)
    if (f ~ /\.(g|freezed|config)\.dart$/ || f ~ /strings\.g\.dart$/) gated = 0
  }
  gated && /^LF:/ { lf += substr($0, 4) }
  gated && /^LH:/ { lh += substr($0, 4) }
  END {
    if (lf == 0) { print "coverage-gate: nothing gated yet"; exit 0 }
    pct = lh * 100 / lf
    printf "coverage-gate: %.1f%% of gated lines (%d/%d), minimum %s%%\n", pct, lh, lf, min
    if (pct + 0 < min + 0) exit 1
  }' "$LCOV"
