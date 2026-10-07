import 'package:flutter/foundation.dart' show immutable;

/// Where a notification's `link` points inside the app.
sealed class AppLink {
  const AppLink();

  /// Parses a web-portal link. The backend sends absolute links built from
  /// `FRONTEND_ORIGIN` (`intake/services/notify.py` `_applicant`):
  /// `https://…/apply/applications/42`, possibly with `?tab=…`. The short
  /// `/apply/42` shape and `/apply` / `/apply/applications` (the list) are
  /// accepted too. Unknown links return `null` (opened nowhere).
  static AppLink? parse(String link) {
    final trimmed = link.trim();
    if (trimmed.isEmpty) return null;
    final uri = Uri.tryParse(trimmed);
    if (uri == null) return null;
    final seg = uri.pathSegments.where((s) => s.isNotEmpty).toList();
    // The origin may carry a path prefix: look for the `apply` segment.
    final at = seg.indexOf('apply');
    if (at < 0) return null;
    var rest = seg.sublist(at + 1);
    if (rest.isNotEmpty && rest.first == 'applications') {
      rest = rest.sublist(1);
    }
    final id = rest.isEmpty ? null : int.tryParse(rest.first);
    return id != null ? ApplicationLink(id) : const ApplicationsLink();
  }
}

/// The applications list.
@immutable
final class ApplicationsLink extends AppLink {
  /// Creates the link.
  const ApplicationsLink();

  @override
  bool operator ==(Object other) => other is ApplicationsLink;

  @override
  int get hashCode => 0;
}

/// One application.
@immutable
final class ApplicationLink extends AppLink {
  /// Creates the link.
  const ApplicationLink(this.id);

  /// Application id.
  final int id;

  @override
  bool operator ==(Object other) => other is ApplicationLink && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
