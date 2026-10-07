import 'package:flutter/foundation.dart' show immutable;

/// Where a notification's `link` points inside the app.
sealed class AppLink {
  const AppLink();

  /// Parses a web-portal link (`/apply/42`, `https://…/apply/42?tab=docs`,
  /// `/apply`). Unknown links return `null` (opened nowhere).
  static AppLink? parse(String link) {
    if (link.trim().isEmpty) return null;
    final uri = Uri.tryParse(link.trim());
    if (uri == null) return null;
    final seg = uri.pathSegments.where((s) => s.isNotEmpty).toList();
    if (seg.isEmpty || seg.first != 'apply') return null;
    if (seg.length >= 2) {
      final id = int.tryParse(seg[1]);
      if (id != null) return ApplicationLink(id);
    }
    return const ApplicationsLink();
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
