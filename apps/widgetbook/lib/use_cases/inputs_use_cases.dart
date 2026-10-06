import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;

Widget _page(Widget child) => Padding(
  padding: HSpace.page,
  child: SingleChildScrollView(child: child),
);

@wb.UseCase(name: 'States', type: HTextField)
Widget textField(BuildContext context) {
  final error = context.knobs.stringOrNull(label: 'Error');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  return _page(
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HTextField(
          label: 'Email',
          hint: 'you@example.com',
          leadingIcon: HIcons.mail,
          error: error,
          enabled: enabled,
          required: true,
        ),
        HSpace.gap3,
        HTextField(label: 'Password', obscureText: true, enabled: enabled),
        HSpace.gap3,
        HTextField(
          label: 'CNIC / B-Form',
          inputFormatters: [HMasks.cnic()],
          helper: '13 digits',
          enabled: enabled,
        ),
        HSpace.gap3,
        HTextField(
          label: 'Personal statement',
          maxLines: 5,
          maxLength: 300,
          enabled: enabled,
        ),
      ],
    ),
  );
}

@wb.UseCase(name: 'Frame states', type: HFieldFrame)
Widget fieldFrame(BuildContext context) => _page(
  const Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      HFieldFrame(label: 'Idle', child: HText('Value')),
      HSpace.gap3,
      HFieldFrame(label: 'Focused', focused: true, child: HText('Value')),
      HSpace.gap3,
      HFieldFrame(label: 'Error', error: 'Required', child: HText('Value')),
    ],
  ),
);

@wb.UseCase(name: 'Select', type: HSelect)
Widget select(BuildContext context) => _page(const _SelectDemo());

class _SelectDemo extends StatefulWidget {
  const _SelectDemo();
  @override
  State<_SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState extends State<_SelectDemo> {
  String? _value;
  @override
  Widget build(BuildContext context) => HSelect<String>(
    label: 'Relation',
    options: const [
      HSelectOption(value: 'father', label: 'Father'),
      HSelectOption(value: 'mother', label: 'Mother'),
      HSelectOption(value: 'guardian', label: 'Guardian'),
    ],
    value: _value,
    onChanged: (v) => setState(() => _value = v),
  );
}

@wb.UseCase(name: 'Search select (paged)', type: HSearchSelect)
Widget searchSelect(BuildContext context) => _page(const _SearchDemo());

class _SearchDemo extends StatefulWidget {
  const _SearchDemo();
  @override
  State<_SearchDemo> createState() => _SearchDemoState();
}

class _SearchDemoState extends State<_SearchDemo> {
  String? _value;
  Future<List<String>> _fetch(String q, int offset) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return [
      for (var i = offset; i < offset + 30; i++)
        'School ${i + 1}${q.isEmpty ? '' : ' ($q)'}',
    ];
  }

  @override
  Widget build(BuildContext context) => HSearchSelect<String>(
    label: 'School',
    fetchPage: _fetch,
    labelOf: (s) => s,
    subtitleOf: (s) => 'Karachi',
    value: _value,
    onChanged: (v) => setState(() => _value = v),
    onOther: () {},
  );
}

@wb.UseCase(name: 'Date picker', type: HDatePicker)
Widget datePicker(BuildContext context) => _page(const _DateDemo());

class _DateDemo extends StatefulWidget {
  const _DateDemo();
  @override
  State<_DateDemo> createState() => _DateDemoState();
}

class _DateDemoState extends State<_DateDemo> {
  DateTime? _value;
  @override
  Widget build(BuildContext context) => HDatePicker(
    label: 'Date of birth',
    value: _value,
    lastDate: DateTime.now(),
    onChanged: (v) => setState(() => _value = v),
  );
}

@wb.UseCase(name: 'OTP field', type: HOtpField)
Widget otpField(BuildContext context) {
  final alphanumeric = context.knobs.boolean(label: 'Alphanumeric (8)');
  return _page(
    HOtpField(
      key: ValueKey(alphanumeric),
      length: alphanumeric ? 8 : 6,
      groupSize: alphanumeric ? 4 : null,
      alphanumeric: alphanumeric,
      onCompleted: (_) {},
    ),
  );
}

@wb.UseCase(name: 'Toggles', type: HCheckbox)
Widget toggles(BuildContext context) => _page(const _TogglesDemo());

class _TogglesDemo extends StatefulWidget {
  const _TogglesDemo();
  @override
  State<_TogglesDemo> createState() => _TogglesDemoState();
}

class _TogglesDemoState extends State<_TogglesDemo> {
  bool _check = false;
  bool _switch = true;
  String _radio = 'as';
  String _seg = 'online';
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      HCheckbox(
        value: _check,
        onChanged: (v) => setState(() => _check = v),
        label: 'I confirm the information is true',
      ),
      HSpace.gap4,
      HSwitch(
        value: _switch,
        onChanged: (v) => setState(() => _switch = v),
        label: 'Private candidate',
      ),
      HSpace.gap4,
      HRadio<String>(
        value: 'as',
        groupValue: _radio,
        onChanged: (v) => setState(() => _radio = v),
        label: 'AS Level',
      ),
      HSpace.gap2,
      HRadio<String>(
        value: 'a2',
        groupValue: _radio,
        onChanged: (v) => setState(() => _radio = v),
        label: 'A2 Level',
      ),
      HSpace.gap4,
      HSegmented<String>(
        segments: const [
          HSegment(value: 'online', label: 'Online'),
          HSegment(value: 'bank', label: 'Bank'),
        ],
        value: _seg,
        onChanged: (v) => setState(() => _seg = v),
      ),
      HSpace.gap4,
      Wrap(
        spacing: HSpace.x2,
        children: [
          HChip(
            'Maths',
            selected: _check,
            onTap: () => setState(() => _check = !_check),
          ),
          HChip('Physics', onDelete: () {}),
        ],
      ),
    ],
  );
}

@wb.UseCase(name: 'File tile', type: HFilePickerTile)
Widget fileTile(BuildContext context) {
  final state = context.knobs.object.dropdown(
    label: 'State',
    options: HFileState.values,
    labelBuilder: (s) => s.name,
  );
  return _page(
    HFilePickerTile(
      title: 'Passport-style photo',
      hint: 'JPG or PNG',
      state: state,
      fileName: state == HFileState.missing ? null : 'photo.jpg',
      progress: 0.4,
      rejectReason: 'Face not fully visible',
      onPick: () {},
      onLater: () {},
      onRemove: () {},
      onOpen: () {},
    ),
  );
}
