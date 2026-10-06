import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart' show IconData;

/// Curated icon set. Only the rounded Material glyphs are used, so every icon
/// in the app shares one weight and corner language. App code imports
/// `HIcons`, never `Icons`, which keeps Material out of feature code and makes
/// a future icon-font swap a one-file change.
abstract final class HIcons {
  // navigation
  /// Home / applications.
  static const IconData home = Icons.home_rounded;

  /// Notifications bell.
  static const IconData bell = Icons.notifications_rounded;

  /// Profile.
  static const IconData person = Icons.person_rounded;

  /// Back chevron.
  static const IconData back = Icons.arrow_back_ios_new_rounded;

  /// Forward chevron.
  static const IconData chevronRight = Icons.chevron_right_rounded;

  /// Expand.
  static const IconData chevronDown = Icons.expand_more_rounded;

  /// Close.
  static const IconData close = Icons.close_rounded;

  /// More / overflow.
  static const IconData more = Icons.more_horiz_rounded;

  /// Settings.
  static const IconData settings = Icons.settings_rounded;

  /// Search.
  static const IconData search = Icons.search_rounded;

  /// Filter.
  static const IconData filter = Icons.tune_rounded;

  // status
  /// Done.
  static const IconData check = Icons.check_rounded;

  /// Done (filled circle).
  static const IconData checkCircle = Icons.check_circle_rounded;

  /// Pending.
  static const IconData clock = Icons.schedule_rounded;

  /// Attention.
  static const IconData warning = Icons.warning_amber_rounded;

  /// Error.
  static const IconData error = Icons.error_rounded;

  /// Info.
  static const IconData info = Icons.info_rounded;

  /// Locked.
  static const IconData lock = Icons.lock_rounded;

  /// Help.
  static const IconData help = Icons.help_outline_rounded;

  /// Hourglass.
  static const IconData hourglass = Icons.hourglass_top_rounded;

  // actions
  /// Add.
  static const IconData add = Icons.add_rounded;

  /// Edit.
  static const IconData edit = Icons.edit_rounded;

  /// Delete.
  static const IconData delete = Icons.delete_outline_rounded;

  /// Upload.
  static const IconData upload = Icons.upload_rounded;

  /// Download.
  static const IconData download = Icons.download_rounded;

  /// Share.
  static const IconData share = Icons.ios_share_rounded;

  /// Copy.
  static const IconData copy = Icons.content_copy_rounded;

  /// Refresh.
  static const IconData refresh = Icons.refresh_rounded;

  /// Send.
  static const IconData send = Icons.send_rounded;

  /// Logout.
  static const IconData logout = Icons.logout_rounded;

  /// Visibility on.
  static const IconData eye = Icons.visibility_rounded;

  /// Visibility off.
  static const IconData eyeOff = Icons.visibility_off_rounded;

  /// Camera.
  static const IconData camera = Icons.photo_camera_rounded;

  /// Gallery.
  static const IconData gallery = Icons.photo_library_rounded;

  /// File / document.
  static const IconData file = Icons.description_rounded;

  /// PDF.
  static const IconData pdf = Icons.picture_as_pdf_rounded;

  /// Attachment.
  static const IconData attach = Icons.attach_file_rounded;

  // domain
  /// Calendar / interview.
  static const IconData calendar = Icons.event_rounded;

  /// Sports trial.
  static const IconData sports = Icons.sports_soccer_rounded;

  /// Offer / letter.
  static const IconData offer = Icons.workspace_premium_rounded;

  /// Payment.
  static const IconData payment = Icons.receipt_long_rounded;

  /// School.
  static const IconData school = Icons.school_rounded;

  /// Family.
  static const IconData family = Icons.family_restroom_rounded;

  /// Subjects / studies.
  static const IconData studies = Icons.menu_book_rounded;

  /// Statement / review.
  static const IconData review = Icons.fact_check_rounded;

  /// Email.
  static const IconData mail = Icons.mail_rounded;

  /// Phone.
  static const IconData phone = Icons.phone_rounded;

  /// Location.
  static const IconData location = Icons.location_on_rounded;

  /// Palette / appearance.
  static const IconData palette = Icons.palette_rounded;

  /// Dark mode.
  static const IconData darkMode = Icons.dark_mode_rounded;

  /// Light mode.
  static const IconData lightMode = Icons.light_mode_rounded;

  /// Fingerprint.
  static const IconData fingerprint = Icons.fingerprint_rounded;

  /// Offline.
  static const IconData offline = Icons.wifi_off_rounded;

  /// Timeline dot.
  static const IconData dot = Icons.circle;

  /// Shield / security.
  static const IconData shield = Icons.shield_rounded;

  /// Sparkle / new.
  static const IconData sparkle = Icons.auto_awesome_rounded;
}
