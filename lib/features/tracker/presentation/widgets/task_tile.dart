import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';

/// How a task reads.
enum TaskState {
  /// Something for the family to do.
  todo,

  /// Done or nothing needed.
  done,

  /// Not yet possible.
  locked,
}

/// One task of the "To do" tab (`Task` in `tracker.tsx`): an icon that turns
/// into a check or a lock, a title and line, an optional action and body.
/// The icon's meaning is spoken: a screen reader hears "Done, Interview,
/// Booked for …" as one item, then the action separately.
class TaskTile extends StatelessWidget {
  /// Creates the tile.
  const TaskTile({
    required this.state,
    required this.icon,
    required this.title,
    required this.sub,
    this.action,
    this.children = const [],
    super.key,
  });

  /// State.
  final TaskState state;

  /// Glyph while to-do.
  final IconData icon;

  /// Title.
  final String title;

  /// Line under the title.
  final String sub;

  /// Trailing action.
  final Widget? action;

  /// Body (hidden while locked).
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final c = context.h.colors;
    final words = Translations.of(context).tracker.taskState;
    final stateLabel = switch (state) {
      TaskState.todo => words.todo,
      TaskState.done => words.done,
      TaskState.locked => words.locked,
    };
    final (bg, tone, glyph) = switch (state) {
      TaskState.todo => (c.brandSoft, HTextTone.brand, icon),
      TaskState.done => (c.successSoft, HTextTone.success, HIcons.check),
      TaskState.locked => (c.surfaceAlt, HTextTone.tertiary, HIcons.lock),
    };
    return HCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MergeSemantics(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Semantics(
                        label: stateLabel,
                        child: ExcludeSemantics(
                          child: Container(
                            width: HSpace.x10,
                            height: HSpace.x10,
                            decoration: BoxDecoration(
                              color: bg,
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: HIcon(glyph, tone: tone)),
                          ),
                        ),
                      ),
                      HSpace.hgap3,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HText(
                              title,
                              style: HTextStyle.titleMd,
                              tone: state == TaskState.locked
                                  ? HTextTone.secondary
                                  : HTextTone.primary,
                            ),
                            HSpace.gap1,
                            HText(
                              sub,
                              style: HTextStyle.bodySm,
                              tone: HTextTone.secondary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (action != null) ...[HSpace.hgap2, action!],
            ],
          ),
          if (children.isNotEmpty && state != TaskState.locked) ...[
            HSpace.gap3,
            ...children,
          ],
        ],
      ),
    );
  }
}
