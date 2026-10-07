import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';
import 'package:heuser_erp_mobile/core/files/file_pick_service.dart';
import 'package:heuser_erp_mobile/core/i18n/strings.g.dart';

/// "Add a file": camera, photo library or a document.
abstract final class FileSourceSheet {
  /// Shows the chooser; resolves with the source or `null`.
  static Future<FileSource?> show(BuildContext context) {
    final t = Translations.of(context).documents;
    return HBottomSheet.show<FileSource>(
      context,
      builder: (ctx) => HBottomSheet(
        title: t.pickTitle,
        padding: const EdgeInsets.fromLTRB(HSpace.x2, 0, HSpace.x2, HSpace.x4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HListTile(
              icon: HIcons.camera,
              title: t.camera,
              onTap: () => Navigator.of(ctx).pop(FileSource.camera),
            ),
            HListTile(
              icon: HIcons.gallery,
              title: t.gallery,
              onTap: () => Navigator.of(ctx).pop(FileSource.gallery),
            ),
            HListTile(
              icon: HIcons.file,
              tone: HTone.neutral,
              title: t.pickFile,
              onTap: () => Navigator.of(ctx).pop(FileSource.document),
            ),
          ],
        ),
      ),
    );
  }
}
