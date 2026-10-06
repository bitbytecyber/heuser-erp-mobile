import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;

Widget _page(Widget child) => Padding(
  padding: HSpace.page,
  child: SingleChildScrollView(child: child),
);

@wb.UseCase(name: 'Variants', type: HButton)
Widget buttonVariants(BuildContext context) {
  final label = context.knobs.string(label: 'Label', initialValue: 'Continue');
  final loading = context.knobs.boolean(label: 'Loading');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final size = context.knobs.object.dropdown(
    label: 'Size',
    options: HButtonSize.values,
    labelBuilder: (s) => s.name,
    initialOption: HButtonSize.md,
  );
  return _page(
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final v in HButtonVariant.values) ...[
          HButton(
            label: '$label · ${v.name}',
            variant: v,
            size: size,
            loading: loading,
            icon: HIcons.check,
            onPressed: enabled ? () {} : null,
          ),
          HSpace.gap3,
        ],
      ],
    ),
  );
}

@wb.UseCase(name: 'Variants', type: HIconButton)
Widget iconButtonVariants(BuildContext context) {
  final badge = context.knobs.boolean(label: 'Badge');
  return _page(
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (final v in HIconButtonVariant.values)
          HIconButton(
            icon: HIcons.bell,
            semanticsLabel: v.name,
            variant: v,
            badge: badge,
            onPressed: () {},
          ),
      ],
    ),
  );
}

@wb.UseCase(name: 'Pressable', type: HPressable)
Widget pressable(BuildContext context) {
  return _page(
    HPressable(
      onPressed: () {},
      builder: (context, state) => HCard(
        child: HText(
          'pressed=${state.pressed} hovered=${state.hovered} focused=${state.focused}',
        ),
      ),
    ),
  );
}
