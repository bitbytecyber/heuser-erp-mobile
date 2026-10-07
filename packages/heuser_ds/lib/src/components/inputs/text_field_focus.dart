import 'package:flutter/widgets.dart';

/// "Next" on the keyboard: moves focus from [current] to the next *text
/// field* in reading order. Flutter's default stops on the next focusable
/// control, which is usually the field's own show/hide button, and the
/// keyboard closes. With no field after it, [current] simply unfocuses.
void focusNextTextField(FocusNode current) {
  final scope = current.nearestScope;
  if (scope == null) return;
  final ordered = _ReadingOrder().of(scope, current);
  for (final node in ordered.skip(ordered.indexOf(current) + 1)) {
    final field = node.context?.findAncestorStateOfType<EditableTextState>();
    if (field != null) {
      node.requestFocus();
      return;
    }
  }
  current.unfocus();
}

/// Reading order of a scope's focusable nodes (the sort is protected API).
class _ReadingOrder extends ReadingOrderTraversalPolicy {
  List<FocusNode> of(FocusScopeNode scope, FocusNode current) =>
      sortDescendants(scope.traversalDescendants, current).toList();
}
