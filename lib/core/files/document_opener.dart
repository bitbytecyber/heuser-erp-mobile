import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

/// Writes downloaded bytes to the app's temporary folder and opens them in
/// the system viewer. Returns `false` when nothing could open the file.
class DocumentOpener {
  /// Creates the opener. [tempDir] lets tests avoid the platform channel.
  DocumentOpener({Future<Directory> Function()? tempDir})
    : _tempDir = tempDir ?? getTemporaryDirectory;

  final Future<Directory> Function() _tempDir;

  /// Saves [bytes] as [fileName] and opens it.
  Future<bool> open(Uint8List bytes, String fileName) async {
    try {
      final dir = await _tempDir();
      final safe = fileName.replaceAll(RegExp('[^A-Za-z0-9_.-]'), '_');
      final file = File('${dir.path}/$safe');
      await file.writeAsBytes(bytes, flush: true);
      final r = await OpenFilex.open(file.path, type: 'application/pdf');
      return r.type == ResultType.done;
    } on Object catch (e) {
      debugPrint('DocumentOpener: $e');
      return false;
    }
  }
}
