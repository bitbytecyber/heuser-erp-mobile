import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// One JSON document per key, under the app-support directory (not backed
/// up, survives restarts, wiped on uninstall). Reads and writes never
/// throw: a corrupt or missing file reads as `null`.
class JsonFileCache {
  /// Creates a cache in [folder] (relative to app support). [root] lets
  /// tests point at a temporary directory instead of the platform channel.
  JsonFileCache(this.folder, {Future<Directory> Function()? root})
    : _root = root ?? getApplicationSupportDirectory;

  /// Sub-folder name.
  final String folder;
  final Future<Directory> Function() _root;

  Future<File> _file(String key) async {
    final dir = Directory('${(await _root()).path}/$folder');
    if (!dir.existsSync()) await dir.create(recursive: true);
    final safe = key.replaceAll(RegExp('[^A-Za-z0-9_.-]'), '_');
    return File('${dir.path}/$safe.json');
  }

  /// The decoded object, or `null`.
  Future<Map<String, dynamic>?> read(String key) async {
    try {
      final f = await _file(key);
      if (!f.existsSync()) return null;
      final json = jsonDecode(await f.readAsString());
      return json is Map ? Map<String, dynamic>.from(json) : null;
    } on Object catch (e) {
      debugPrint('JsonFileCache($folder): read $key failed: $e');
      return null;
    }
  }

  /// Writes [value] atomically (temp file + rename).
  Future<void> write(String key, Map<String, dynamic> value) async {
    try {
      final f = await _file(key);
      final tmp = File('${f.path}.tmp');
      await tmp.writeAsString(jsonEncode(value), flush: true);
      await tmp.rename(f.path);
    } on Object catch (e) {
      debugPrint('JsonFileCache($folder): write $key failed: $e');
    }
  }

  /// Deletes the entry, if present.
  Future<void> remove(String key) async {
    try {
      final f = await _file(key);
      if (f.existsSync()) await f.delete();
    } on Object catch (e) {
      debugPrint('JsonFileCache($folder): remove $key failed: $e');
    }
  }

  /// Deletes every entry in the folder (sign-out).
  Future<void> clearAll() async {
    try {
      final dir = Directory('${(await _root()).path}/$folder');
      if (dir.existsSync()) await dir.delete(recursive: true);
    } on Object catch (e) {
      debugPrint('JsonFileCache($folder): clear failed: $e');
    }
  }
}
