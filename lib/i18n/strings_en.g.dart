///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$app$en app = Translations$app$en._(_root);
	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$errors$en errors = Translations$errors$en._(_root);
	late final Translations$appearance$en appearance = Translations$appearance$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
	late final Translations$shell$en shell = Translations$shell$en._(_root);
	late final Translations$profile$en profile = Translations$profile$en._(_root);
	late final Translations$applications$en applications = Translations$applications$en._(_root);
	late final Translations$notifications$en notifications = Translations$notifications$en._(_root);
}

// Path: app
class Translations$app$en {
	Translations$app$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Heuser'
	String get name => 'Heuser';

	/// en: 'Where learning knows no limits'
	String get tagline => 'Where learning knows no limits';
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Try again'
	String get retry => 'Try again';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Loading…'
	String get loading => 'Loading…';

	/// en: 'You're offline. We'll retry when you're back.'
	String get offline => 'You\'re offline. We\'ll retry when you\'re back.';

	/// en: 'Something went wrong. Please try again.'
	String get somethingWentWrong => 'Something went wrong. Please try again.';

	/// en: 'Sign out'
	String get signOut => 'Sign out';
}

// Path: errors
class Translations$errors$en {
	Translations$errors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No internet connection. Check your connection and try again.'
	String get noConnection => 'No internet connection. Check your connection and try again.';

	/// en: 'We can't reach the college right now. Please try again shortly.'
	String get unreachable => 'We can\'t reach the college right now. Please try again shortly.';

	/// en: 'That took too long. Please try again.'
	String get timeout => 'That took too long. Please try again.';

	/// en: 'Your session has ended. Please sign in again.'
	String get sessionExpired => 'Your session has ended. Please sign in again.';

	/// en: 'You don't have access to that.'
	String get forbidden => 'You don\'t have access to that.';

	/// en: 'We couldn't find that.'
	String get notFound => 'We couldn\'t find that.';

	/// en: 'Please check the details and try again.'
	String get invalid => 'Please check the details and try again.';

	/// en: 'That didn't go through. Please try again.'
	String get conflict => 'That didn\'t go through. Please try again.';

	/// en: 'Too many attempts. Please wait a minute and try again.'
	String get rateLimited => 'Too many attempts. Please wait a minute and try again.';

	/// en: 'Admissions are closed right now. Please check back later.'
	String get moduleDisabled => 'Admissions are closed right now. Please check back later.';

	/// en: 'The college's server had a problem. Please try again.'
	String get server => 'The college\'s server had a problem. Please try again.';
}

// Path: appearance
class Translations$appearance$en {
	Translations$appearance$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Appearance'
	String get title => 'Appearance';

	/// en: 'Colour mode'
	String get modeTitle => 'Colour mode';

	/// en: 'System'
	String get modeSystem => 'System';

	/// en: 'Light'
	String get modeLight => 'Light';

	/// en: 'Dark'
	String get modeDark => 'Dark';

	/// en: 'Theme'
	String get presetTitle => 'Theme';

	/// en: 'Pick the palette you like. The college can change the default at any time.'
	String get presetHint => 'Pick the palette you like. The college can change the default at any time.';

	/// en: 'Your college has chosen the theme for everyone.'
	String get presetLocked => 'Your college has chosen the theme for everyone.';

	/// en: 'Set by college'
	String get setByAdmin => 'Set by college';

	/// en: 'Use the college default'
	String get resetPreset => 'Use the college default';
}

// Path: auth
class Translations$auth$en {
	Translations$auth$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your next step toward excellence'
	String get welcomeTitle => 'Your next step toward excellence';

	/// en: 'Apply to {name}, track your application and stay in touch with admissions.'
	String get welcomeBody => 'Apply to {name}, track your application and stay in touch with admissions.';

	/// en: 'Sign in'
	String get signIn => 'Sign in';

	/// en: 'Create account'
	String get createAccount => 'Create account';

	/// en: 'Continue with Google'
	String get continueWithGoogle => 'Continue with Google';

	/// en: 'Continue with Apple'
	String get continueWithApple => 'Continue with Apple';

	/// en: 'or'
	String get or => 'or';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'you@example.com'
	String get emailHint => 'you@example.com';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'At least 8 characters'
	String get passwordHint => 'At least 8 characters';

	/// en: 'Confirm password'
	String get confirmPassword => 'Confirm password';

	/// en: 'First name'
	String get firstName => 'First name';

	/// en: 'Last name'
	String get lastName => 'Last name';

	/// en: 'CNIC / B-Form'
	String get cnic => 'CNIC / B-Form';

	/// en: '13 digits, optional for now'
	String get cnicHelper => '13 digits, optional for now';

	/// en: 'Mobile number'
	String get phone => 'Mobile number';

	/// en: 'Forgot password?'
	String get forgotPassword => 'Forgot password?';

	/// en: 'Email me a sign-in code instead'
	String get signInWithCode => 'Email me a sign-in code instead';

	/// en: 'New to {name}?'
	String get noAccount => 'New to {name}?';

	/// en: 'Already have an account?'
	String get haveAccount => 'Already have an account?';

	/// en: 'By continuing you agree to the admissions terms of {name}.'
	String get termsNote => 'By continuing you agree to the admissions terms of {name}.';

	/// en: 'You were signed out because your session ended.'
	String get signedOutServer => 'You were signed out because your session ended.';

	/// en: 'We couldn't reach the college to restore your session.'
	String get signedOutOffline => 'We couldn\'t reach the college to restore your session.';

	/// en: 'Enter a valid email address.'
	String get invalidEmail => 'Enter a valid email address.';

	/// en: 'Use at least 8 characters.'
	String get passwordTooShort => 'Use at least 8 characters.';

	/// en: 'The passwords don't match.'
	String get passwordsDiffer => 'The passwords don\'t match.';

	/// en: 'Check your email'
	String get verifyTitle => 'Check your email';

	/// en: 'We sent a 6-character code to {email}. Enter it below.'
	String get verifyBody => 'We sent a 6-character code to {email}. Enter it below.';

	/// en: 'That code isn't right. Check it and try again.'
	String get verifyCodeInvalid => 'That code isn\'t right. Check it and try again.';

	/// en: 'Send a new code'
	String get resendCode => 'Send a new code';

	/// en: 'A new code is on its way.'
	String get codeSent => 'A new code is on its way.';

	/// en: 'Two-step verification'
	String get mfaTitle => 'Two-step verification';

	/// en: 'Enter the 6-digit code from your authenticator app.'
	String get mfaBody => 'Enter the 6-digit code from your authenticator app.';

	/// en: 'Use a recovery code'
	String get mfaRecovery => 'Use a recovery code';

	/// en: 'Recovery code'
	String get mfaRecoveryHint => 'Recovery code';

	/// en: 'Sign in with a code'
	String get loginCodeTitle => 'Sign in with a code';

	/// en: 'We'll email you a one-time code so you don't need your password.'
	String get loginCodeBody => 'We\'ll email you a one-time code so you don\'t need your password.';

	/// en: 'Send code'
	String get loginCodeSend => 'Send code';

	/// en: 'Enter your code'
	String get loginCodeConfirmTitle => 'Enter your code';

	/// en: 'Type the code we emailed to {email}.'
	String get loginCodeConfirmBody => 'Type the code we emailed to {email}.';

	/// en: 'Reset your password'
	String get forgotTitle => 'Reset your password';

	/// en: 'Enter your email and we'll send you a link to set a new password.'
	String get forgotBody => 'Enter your email and we\'ll send you a link to set a new password.';

	/// en: 'Send reset link'
	String get forgotSend => 'Send reset link';

	/// en: 'Check your inbox'
	String get forgotSentTitle => 'Check your inbox';

	/// en: 'If an account exists for {email}, a reset link is on its way.'
	String get forgotSentBody => 'If an account exists for {email}, a reset link is on its way.';

	/// en: 'Choose a new password'
	String get resetTitle => 'Choose a new password';

	/// en: 'Pick something you'll remember. You'll sign in again afterwards.'
	String get resetBody => 'Pick something you\'ll remember. You\'ll sign in again afterwards.';

	/// en: 'Set password'
	String get resetSubmit => 'Set password';

	/// en: 'Password updated'
	String get resetDoneTitle => 'Password updated';

	/// en: 'Sign in with your new password.'
	String get resetDoneBody => 'Sign in with your new password.';

	/// en: 'This reset link is invalid or has expired.'
	String get resetInvalidKey => 'This reset link is invalid or has expired.';

	/// en: 'Welcome, {name}'
	String get choiceTitle => 'Welcome, {name}';

	/// en: 'We don't have an account for {email} yet. Would you like to apply for admission to {college}?'
	String get choiceBody => 'We don\'t have an account for {email} yet. Would you like to apply for admission to {college}?';

	/// en: 'Apply for admission'
	String get choiceApply => 'Apply for admission';

	/// en: 'Use a different account'
	String get choiceNotMe => 'Use a different account';

	/// en: 'Nothing to show here yet'
	String get noPortalTitle => 'Nothing to show here yet';

	/// en: 'Your account doesn't have a mobile portal. Please use the web portal or contact the admissions office.'
	String get noPortalBody => 'Your account doesn\'t have a mobile portal. Please use the web portal or contact the admissions office.';

	/// en: 'Back to sign in'
	String get backToSignIn => 'Back to sign in';

	/// en: 'Google sign-in didn't complete.'
	String get googleFailed => 'Google sign-in didn\'t complete.';

	/// en: 'Sign in with Apple didn't complete.'
	String get appleFailed => 'Sign in with Apple didn\'t complete.';
}

// Path: shell
class Translations$shell$en {
	Translations$shell$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Applications'
	String get applications => 'Applications';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Profile'
	String get profile => 'Profile';
}

// Path: profile
class Translations$profile$en {
	Translations$profile$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Appearance'
	String get appearance => 'Appearance';

	/// en: 'Change password'
	String get changePassword => 'Change password';

	/// en: 'Set a password'
	String get setPassword => 'Set a password';

	/// en: 'About'
	String get about => 'About';

	/// en: 'Version {version}'
	String get version => 'Version {version}';

	/// en: 'Sign out?'
	String get signOutConfirmTitle => 'Sign out?';

	/// en: 'You'll need your email and password to sign back in.'
	String get signOutConfirmBody => 'You\'ll need your email and password to sign back in.';

	/// en: 'Showing your last known details. We'll refresh when you're back online.'
	String get offlineSnapshot => 'Showing your last known details. We\'ll refresh when you\'re back online.';
}

// Path: applications
class Translations$applications$en {
	Translations$applications$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your applications'
	String get title => 'Your applications';

	/// en: 'No applications yet'
	String get emptyTitle => 'No applications yet';

	/// en: 'Start your application and we'll guide you through every step.'
	String get emptyBody => 'Start your application and we\'ll guide you through every step.';

	/// en: 'Start an application'
	String get start => 'Start an application';
}

// Path: notifications
class Translations$notifications$en {
	Translations$notifications$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notifications'
	String get title => 'Notifications';

	/// en: 'You're all caught up'
	String get emptyTitle => 'You\'re all caught up';

	/// en: 'Updates about your application will appear here.'
	String get emptyBody => 'Updates about your application will appear here.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Heuser',
			'app.tagline' => 'Where learning knows no limits',
			'common.retry' => 'Try again',
			'common.cancel' => 'Cancel',
			'common.kContinue' => 'Continue',
			'common.back' => 'Back',
			'common.save' => 'Save',
			'common.done' => 'Done',
			'common.ok' => 'OK',
			'common.close' => 'Close',
			'common.loading' => 'Loading…',
			'common.offline' => 'You\'re offline. We\'ll retry when you\'re back.',
			'common.somethingWentWrong' => 'Something went wrong. Please try again.',
			'common.signOut' => 'Sign out',
			'errors.noConnection' => 'No internet connection. Check your connection and try again.',
			'errors.unreachable' => 'We can\'t reach the college right now. Please try again shortly.',
			'errors.timeout' => 'That took too long. Please try again.',
			'errors.sessionExpired' => 'Your session has ended. Please sign in again.',
			'errors.forbidden' => 'You don\'t have access to that.',
			'errors.notFound' => 'We couldn\'t find that.',
			'errors.invalid' => 'Please check the details and try again.',
			'errors.conflict' => 'That didn\'t go through. Please try again.',
			'errors.rateLimited' => 'Too many attempts. Please wait a minute and try again.',
			'errors.moduleDisabled' => 'Admissions are closed right now. Please check back later.',
			'errors.server' => 'The college\'s server had a problem. Please try again.',
			'appearance.title' => 'Appearance',
			'appearance.modeTitle' => 'Colour mode',
			'appearance.modeSystem' => 'System',
			'appearance.modeLight' => 'Light',
			'appearance.modeDark' => 'Dark',
			'appearance.presetTitle' => 'Theme',
			'appearance.presetHint' => 'Pick the palette you like. The college can change the default at any time.',
			'appearance.presetLocked' => 'Your college has chosen the theme for everyone.',
			'appearance.setByAdmin' => 'Set by college',
			'appearance.resetPreset' => 'Use the college default',
			'auth.welcomeTitle' => 'Your next step toward excellence',
			'auth.welcomeBody' => 'Apply to {name}, track your application and stay in touch with admissions.',
			'auth.signIn' => 'Sign in',
			'auth.createAccount' => 'Create account',
			'auth.continueWithGoogle' => 'Continue with Google',
			'auth.continueWithApple' => 'Continue with Apple',
			'auth.or' => 'or',
			'auth.email' => 'Email',
			'auth.emailHint' => 'you@example.com',
			'auth.password' => 'Password',
			'auth.passwordHint' => 'At least 8 characters',
			'auth.confirmPassword' => 'Confirm password',
			'auth.firstName' => 'First name',
			'auth.lastName' => 'Last name',
			'auth.cnic' => 'CNIC / B-Form',
			'auth.cnicHelper' => '13 digits, optional for now',
			'auth.phone' => 'Mobile number',
			'auth.forgotPassword' => 'Forgot password?',
			'auth.signInWithCode' => 'Email me a sign-in code instead',
			'auth.noAccount' => 'New to {name}?',
			'auth.haveAccount' => 'Already have an account?',
			'auth.termsNote' => 'By continuing you agree to the admissions terms of {name}.',
			'auth.signedOutServer' => 'You were signed out because your session ended.',
			'auth.signedOutOffline' => 'We couldn\'t reach the college to restore your session.',
			'auth.invalidEmail' => 'Enter a valid email address.',
			'auth.passwordTooShort' => 'Use at least 8 characters.',
			'auth.passwordsDiffer' => 'The passwords don\'t match.',
			'auth.verifyTitle' => 'Check your email',
			'auth.verifyBody' => 'We sent a 6-character code to {email}. Enter it below.',
			'auth.verifyCodeInvalid' => 'That code isn\'t right. Check it and try again.',
			'auth.resendCode' => 'Send a new code',
			'auth.codeSent' => 'A new code is on its way.',
			'auth.mfaTitle' => 'Two-step verification',
			'auth.mfaBody' => 'Enter the 6-digit code from your authenticator app.',
			'auth.mfaRecovery' => 'Use a recovery code',
			'auth.mfaRecoveryHint' => 'Recovery code',
			'auth.loginCodeTitle' => 'Sign in with a code',
			'auth.loginCodeBody' => 'We\'ll email you a one-time code so you don\'t need your password.',
			'auth.loginCodeSend' => 'Send code',
			'auth.loginCodeConfirmTitle' => 'Enter your code',
			'auth.loginCodeConfirmBody' => 'Type the code we emailed to {email}.',
			'auth.forgotTitle' => 'Reset your password',
			'auth.forgotBody' => 'Enter your email and we\'ll send you a link to set a new password.',
			'auth.forgotSend' => 'Send reset link',
			'auth.forgotSentTitle' => 'Check your inbox',
			'auth.forgotSentBody' => 'If an account exists for {email}, a reset link is on its way.',
			'auth.resetTitle' => 'Choose a new password',
			'auth.resetBody' => 'Pick something you\'ll remember. You\'ll sign in again afterwards.',
			'auth.resetSubmit' => 'Set password',
			'auth.resetDoneTitle' => 'Password updated',
			'auth.resetDoneBody' => 'Sign in with your new password.',
			'auth.resetInvalidKey' => 'This reset link is invalid or has expired.',
			'auth.choiceTitle' => 'Welcome, {name}',
			'auth.choiceBody' => 'We don\'t have an account for {email} yet. Would you like to apply for admission to {college}?',
			'auth.choiceApply' => 'Apply for admission',
			'auth.choiceNotMe' => 'Use a different account',
			'auth.noPortalTitle' => 'Nothing to show here yet',
			'auth.noPortalBody' => 'Your account doesn\'t have a mobile portal. Please use the web portal or contact the admissions office.',
			'auth.backToSignIn' => 'Back to sign in',
			'auth.googleFailed' => 'Google sign-in didn\'t complete.',
			'auth.appleFailed' => 'Sign in with Apple didn\'t complete.',
			'shell.applications' => 'Applications',
			'shell.notifications' => 'Notifications',
			'shell.profile' => 'Profile',
			'profile.title' => 'Profile',
			'profile.account' => 'Account',
			'profile.appearance' => 'Appearance',
			'profile.changePassword' => 'Change password',
			'profile.setPassword' => 'Set a password',
			'profile.about' => 'About',
			'profile.version' => 'Version {version}',
			'profile.signOutConfirmTitle' => 'Sign out?',
			'profile.signOutConfirmBody' => 'You\'ll need your email and password to sign back in.',
			'profile.offlineSnapshot' => 'Showing your last known details. We\'ll refresh when you\'re back online.',
			'applications.title' => 'Your applications',
			'applications.emptyTitle' => 'No applications yet',
			'applications.emptyBody' => 'Start your application and we\'ll guide you through every step.',
			'applications.start' => 'Start an application',
			'notifications.title' => 'Notifications',
			'notifications.emptyTitle' => 'You\'re all caught up',
			'notifications.emptyBody' => 'Updates about your application will appear here.',
			_ => null,
		};
	}
}
