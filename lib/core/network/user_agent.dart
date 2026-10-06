import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Builds the `User-Agent` sent on every API call, so the admin sessions
/// screen can tell an Android applicant from an iOS one and see who is on an
/// old build. Format (parsed by `people/services/user_agent.py`):
///
/// ```text
/// HeuserApp/1.2.0 (48) Android/14 (SM-G990B) Dart/3.13
/// HeuserApp/1.2.0 (48) iOS/18.7 (iPhone15,3) Dart/3.13
/// ```
///
/// Every field is sanitised and length-capped; the device *model* is used,
/// never the user-chosen device name.
abstract final class HeuserUserAgent {
  /// Product token.
  static const String product = 'HeuserApp';

  static String? _cached;

  /// The agent string, or `null` when it could not be built (callers then
  /// leave Dio's default alone). Never throws.
  static Future<String?> resolve() async {
    if (_cached != null) return _cached;
    try {
      final package = await PackageInfo.fromPlatform();
      final version = _sanitize(package.version, 24);
      final build = _sanitize(package.buildNumber, 12);
      final parts = <String>[
        if (build.isEmpty)
          '$product/$version'
        else
          '$product/$version ($build)',
      ];
      final platform = await _platformToken();
      if (platform != null) parts.add(platform);
      parts.add('Dart/${_sanitize(_dartMajorMinor(), 12)}');
      return _cached = parts.join(' ');
    } on Object catch (error) {
      debugPrint('HeuserUserAgent: falling back to the default agent ($error)');
      return null;
    }
  }

  static Future<String?> _platformToken() async {
    final info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final a = await info.androidInfo;
      return _join(
        'Android',
        _sanitize(a.version.release, 16),
        _sanitize(a.model, 32),
      );
    }
    if (Platform.isIOS) {
      final i = await info.iosInfo;
      return _join(
        'iOS',
        _sanitize(i.systemVersion, 16),
        _sanitize(i.utsname.machine, 32),
      );
    }
    return null;
  }

  static String _join(String platform, String release, String model) {
    final head = release.isEmpty ? platform : '$platform/$release';
    return model.isEmpty ? head : '$head ($model)';
  }

  static String _dartMajorMinor() =>
      RegExp(r'^(\d+\.\d+)').firstMatch(Platform.version)?.group(1) ??
      'unknown';

  static String _sanitize(String? value, int maxLength) {
    if (value == null) return '';
    final cleaned = value
        .replaceAll(RegExp(r'[^\x20-\x7E]'), '')
        .replaceAll(RegExp('[()/;,]'), '')
        .trim();
    return cleaned.length <= maxLength
        ? cleaned
        : cleaned.substring(0, maxLength);
  }
}
