#!/bin/sh
# Theme rule (.claude/rules/theme-rules.md): Material/Cupertino are an invisible
# engine confined to the design system. Screens, blocs and app code never import
# them, so nothing outside heuser_ds can look like stock Material.
#
# Allowed:
#   packages/heuser_ds/lib/src/theme/bridge/**
#   packages/heuser_ds/lib/src/components/**
#   packages/heuser_ds/lib/src/foundation/**
#   lib/app/app.dart
set -e
violations=$(grep -rlE "package:flutter/(material|cupertino)\.dart|package:material_ui/|package:cupertino_ui/" \
  lib apps/widgetbook/lib packages/heuser_ds/lib 2>/dev/null \
  | grep -vE '^packages/heuser_ds/lib/src/(theme/bridge|components|foundation)/' \
  | grep -vE '^lib/app/app\.dart$' || true)
if [ -n "$violations" ]; then
  echo "check-imports: Material/Cupertino imported outside the design system:"
  printf '  %s\n' $violations
  echo "Use heuser_ds components and context.h tokens instead."
  exit 1
fi
echo "check-imports: ok"
