import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// Where a file comes from.
enum FileSource {
  /// The camera.
  camera,

  /// The photo library.
  gallery,

  /// Any document (PDF or image).
  document,
}

/// A file chosen by the user, ready to upload.
@immutable
class PickedFile {
  /// Creates the record.
  const PickedFile({required this.path, required this.name});

  /// Local path.
  final String path;

  /// File name sent in the multipart part.
  final String name;
}

/// Picks images (compressed to ≤ 1600 px, JPEG 85) or documents. Returns
/// `null` when the user cancels; never throws.
class FilePickService {
  /// Creates the service.
  FilePickService({ImagePicker? imagePicker})
    : _images = imagePicker ?? ImagePicker();

  final ImagePicker _images;

  /// Longest side after compression.
  static const maxSide = 1600;

  /// Picks from [source].
  Future<PickedFile?> pick(FileSource source) async {
    try {
      switch (source) {
        case FileSource.camera:
        case FileSource.gallery:
          final x = await _images.pickImage(
            source: source == FileSource.camera
                ? ImageSource.camera
                : ImageSource.gallery,
            maxWidth: maxSide.toDouble(),
            maxHeight: maxSide.toDouble(),
            imageQuality: 90,
          );
          if (x == null) return null;
          return await _compress(x.path, x.name);
        case FileSource.document:
          final picked = await FilePicker.pickFiles(
            type: FileType.custom,
            allowedExtensions: const [
              'pdf',
              'jpg',
              'jpeg',
              'png',
              'webp',
              'heic',
            ],
          );
          final f = picked.firstOrNull;
          final path = f?.path;
          if (f == null || path == null) return null;
          final lower = f.name.toLowerCase();
          if (lower.endsWith('.pdf')) {
            return PickedFile(path: path, name: f.name);
          }
          return await _compress(path, f.name);
      }
    } on Object catch (e) {
      debugPrint('FilePickService: $e');
      return null;
    }
  }

  Future<PickedFile> _compress(String path, String name) async {
    try {
      final dir = await getTemporaryDirectory();
      final base = name.replaceAll(RegExp(r'\.[^.]+$'), '');
      final target =
          '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_$base.jpg';
      final out = await FlutterImageCompress.compressAndGetFile(
        path,
        target,
        minWidth: maxSide,
        minHeight: maxSide,
        quality: 85,
      );
      if (out == null) return PickedFile(path: path, name: name);
      return PickedFile(path: out.path, name: '$base.jpg');
    } on Object catch (e) {
      debugPrint('FilePickService: compress failed, sending original: $e');
      return PickedFile(path: path, name: name);
    }
  }
}
