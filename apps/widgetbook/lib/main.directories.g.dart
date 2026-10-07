// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:heuser_widgetbook/use_cases/buttons_use_cases.dart'
    as _heuser_widgetbook_use_cases_buttons_use_cases;
import 'package:heuser_widgetbook/use_cases/data_use_cases.dart'
    as _heuser_widgetbook_use_cases_data_use_cases;
import 'package:heuser_widgetbook/use_cases/feedback_use_cases.dart'
    as _heuser_widgetbook_use_cases_feedback_use_cases;
import 'package:heuser_widgetbook/use_cases/inputs_use_cases.dart'
    as _heuser_widgetbook_use_cases_inputs_use_cases;
import 'package:heuser_widgetbook/use_cases/navigation_use_cases.dart'
    as _heuser_widgetbook_use_cases_navigation_use_cases;
import 'package:heuser_widgetbook/use_cases/surfaces_use_cases.dart'
    as _heuser_widgetbook_use_cases_surfaces_use_cases;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'components',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'buttons',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'HButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Variants',
                builder: _heuser_widgetbook_use_cases_buttons_use_cases
                    .buttonVariants,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HIconButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Variants',
                builder: _heuser_widgetbook_use_cases_buttons_use_cases
                    .iconButtonVariants,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HPressable',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Pressable',
                builder:
                    _heuser_widgetbook_use_cases_buttons_use_cases.pressable,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'data',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'HAvatar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Avatar',
                builder: _heuser_widgetbook_use_cases_data_use_cases.avatar,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HKeyValue',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Key-value and fees',
                builder: _heuser_widgetbook_use_cases_data_use_cases.keyValue,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HListTile',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'List tiles',
                builder: _heuser_widgetbook_use_cases_data_use_cases.listTiles,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HStageBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Stage bar',
                builder: _heuser_widgetbook_use_cases_data_use_cases.stageBar,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HTimeline',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Timeline',
                builder: _heuser_widgetbook_use_cases_data_use_cases.timeline,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'feedback',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'HEmptyState',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Empty state',
                builder:
                    _heuser_widgetbook_use_cases_feedback_use_cases.emptyState,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HProgressBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Progress and countdown',
                builder:
                    _heuser_widgetbook_use_cases_feedback_use_cases.progress,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HRefreshable',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Pull to refresh',
                builder:
                    _heuser_widgetbook_use_cases_feedback_use_cases.refreshable,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HSkeleton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Skeleton',
                builder:
                    _heuser_widgetbook_use_cases_feedback_use_cases.skeleton,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HSplashReveal',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Splash reveal',
                builder: _heuser_widgetbook_use_cases_feedback_use_cases
                    .splashReveal,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HStatusPill',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Pills and badges',
                builder: _heuser_widgetbook_use_cases_feedback_use_cases.pills,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'inputs',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'HCheckbox',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Toggles',
                builder: _heuser_widgetbook_use_cases_inputs_use_cases.toggles,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HDatePicker',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Date picker',
                builder:
                    _heuser_widgetbook_use_cases_inputs_use_cases.datePicker,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HFieldFrame',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Frame states',
                builder:
                    _heuser_widgetbook_use_cases_inputs_use_cases.fieldFrame,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HFilePickerTile',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'File tile',
                builder: _heuser_widgetbook_use_cases_inputs_use_cases.fileTile,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HOtpField',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'OTP field',
                builder: _heuser_widgetbook_use_cases_inputs_use_cases.otpField,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HSearchSelect',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Search select (paged)',
                builder:
                    _heuser_widgetbook_use_cases_inputs_use_cases.searchSelect,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HSelect',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Select',
                builder: _heuser_widgetbook_use_cases_inputs_use_cases.select,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HTextField',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'States',
                builder:
                    _heuser_widgetbook_use_cases_inputs_use_cases.textField,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'navigation',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'HAppBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'App bar',
                builder:
                    _heuser_widgetbook_use_cases_navigation_use_cases.appBar,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HNavBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Nav bar',
                builder:
                    _heuser_widgetbook_use_cases_navigation_use_cases.navBar,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HStepper',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Stepper',
                builder:
                    _heuser_widgetbook_use_cases_navigation_use_cases.stepper,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HTabs',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Tabs',
                builder: _heuser_widgetbook_use_cases_navigation_use_cases.tabs,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'surfaces',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'HBottomSheet',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Sheet, dialog, toast',
                builder:
                    _heuser_widgetbook_use_cases_surfaces_use_cases.overlays,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HCard',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Cards',
                builder: _heuser_widgetbook_use_cases_surfaces_use_cases.cards,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'HScaffold',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Scaffold',
                builder:
                    _heuser_widgetbook_use_cases_surfaces_use_cases.scaffold,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'foundation',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'HText',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Type scale',
            builder: _heuser_widgetbook_use_cases_data_use_cases.typeScale,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'tokens',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'HColorScheme',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Colour roles',
            builder: _heuser_widgetbook_use_cases_data_use_cases.colours,
          ),
        ],
      ),
    ],
  ),
];
