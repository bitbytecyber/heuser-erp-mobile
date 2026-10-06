import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;

Widget _page(Widget child) => Padding(
  padding: HSpace.page,
  child: SingleChildScrollView(child: child),
);

@wb.UseCase(name: 'Stepper', type: HStepper)
Widget stepper(BuildContext context) {
  final current = context.knobs.int.slider(
    label: 'Current',
    initialValue: 1,
    max: 2,
  );
  return _page(
    HStepper(
      steps: const ['You & family', 'Your studies', 'Check & send'],
      current: current,
      completed: current,
      onStepTap: (_) {},
    ),
  );
}

@wb.UseCase(name: 'Tabs', type: HTabs)
Widget tabs(BuildContext context) => _page(const _TabsDemo());

class _TabsDemo extends StatefulWidget {
  const _TabsDemo();
  @override
  State<_TabsDemo> createState() => _TabsDemoState();
}

class _TabsDemoState extends State<_TabsDemo> {
  int _i = 0;
  @override
  Widget build(BuildContext context) => HTabs(
    tabs: const [
      HTab('To do', badgeCount: 2),
      HTab('Documents'),
      HTab('Application'),
      HTab('History'),
    ],
    index: _i,
    onChanged: (i) => setState(() => _i = i),
  );
}

@wb.UseCase(name: 'Nav bar', type: HNavBar)
Widget navBar(BuildContext context) => const _NavDemo();

class _NavDemo extends StatefulWidget {
  const _NavDemo();
  @override
  State<_NavDemo> createState() => _NavDemoState();
}

class _NavDemoState extends State<_NavDemo> {
  int _i = 0;
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      HNavBar(
        items: const [
          HNavItem(icon: HIcons.home, label: 'Applications'),
          HNavItem(icon: HIcons.bell, label: 'Notifications', badgeCount: 3),
          HNavItem(icon: HIcons.person, label: 'Profile'),
        ],
        index: _i,
        onChanged: (i) => setState(() => _i = i),
      ),
    ],
  );
}

@wb.UseCase(name: 'App bar', type: HAppBar)
Widget appBar(BuildContext context) => Column(
  children: [
    HAppBar(
      title: context.knobs.string(label: 'Title', initialValue: 'Step 1 of 3'),
      subtitle: context.knobs.stringOrNull(label: 'Subtitle'),
      showBack: true,
      onBack: () {},
      actions: [HButton.ghost(label: 'Finish later', onPressed: () {})],
    ),
  ],
);
