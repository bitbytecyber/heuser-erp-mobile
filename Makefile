# Developer entry points. Every target is what CI runs (codemagic.yaml), so a
# green `make check` locally means a green pipeline.
FLAVOR ?= dev
DEFINES = --dart-define-from-file=env/$(FLAVOR).json

.PHONY: setup gen gen-watch i18n run check format analyze test goldens update-goldens widgetbook clean

setup:            ## first clone: hooks + pub get everywhere
	git config core.hooksPath .githooks
	flutter pub get
	cd packages/heuser_ds && flutter pub get
	cd apps/widgetbook && flutter pub get

gen:              ## all codegen (freezed, json, injectable, go_router, slang)
	dart run slang
	dart run build_runner build --delete-conflicting-outputs
	cd apps/widgetbook && dart run build_runner build --delete-conflicting-outputs

gen-watch:
	dart run build_runner watch --delete-conflicting-outputs

i18n:
	dart run slang

run:              ## make run FLAVOR=staging
	flutter run --flavor $(FLAVOR) -t lib/main_$(FLAVOR).dart $(DEFINES)

format:
	dart format lib test packages/heuser_ds/lib packages/heuser_ds/test apps/widgetbook/lib

analyze:
	flutter analyze --fatal-infos --fatal-warnings
	cd packages/heuser_ds && flutter analyze --fatal-infos --fatal-warnings
	cd apps/widgetbook && flutter analyze --fatal-infos --fatal-warnings

test:
	flutter test --coverage
	cd packages/heuser_ds && flutter test

goldens:          ## DS goldens (compare)
	cd packages/heuser_ds && flutter test --tags golden

update-goldens:   ## regenerate DS goldens after an intentional visual change
	cd packages/heuser_ds && flutter test --tags golden --update-goldens

check: format analyze test ## the full local gate
	sh scripts/check-codegen.sh
	sh scripts/check-imports.sh
	sh scripts/check-ds-goldens.sh
	sh scripts/coverage-gate.sh

widgetbook:
	cd apps/widgetbook && flutter run -d chrome

clean:
	flutter clean && cd packages/heuser_ds && flutter clean && cd ../../apps/widgetbook && flutter clean
