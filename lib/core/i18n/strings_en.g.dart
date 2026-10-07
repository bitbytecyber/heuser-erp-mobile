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
		  );

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$app$en app = Translations$app$en.internal(_root);
	late final Translations$common$en common = Translations$common$en.internal(_root);
	late final Translations$errors$en errors = Translations$errors$en.internal(_root);
	late final Translations$appearance$en appearance = Translations$appearance$en.internal(_root);
	late final Translations$auth$en auth = Translations$auth$en.internal(_root);
	late final Translations$shell$en shell = Translations$shell$en.internal(_root);
	late final Translations$profile$en profile = Translations$profile$en.internal(_root);
	late final Translations$applications$en applications = Translations$applications$en.internal(_root);
	late final Translations$notifications$en notifications = Translations$notifications$en.internal(_root);
	late final Translations$form$en form = Translations$form$en.internal(_root);
	late final Translations$documents$en documents = Translations$documents$en.internal(_root);
	late final Translations$tracker$en tracker = Translations$tracker$en.internal(_root);
	late final Translations$lock$en lock = Translations$lock$en.internal(_root);
	late final Translations$student$en student = Translations$student$en.internal(_root);
}

// Path: app
class Translations$app$en {
	Translations$app$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Heuser'
	String get name => 'Heuser';

	/// en: 'Where learning knows no limits'
	String get tagline => 'Where learning knows no limits';
}

// Path: common
class Translations$common$en {
	Translations$common$en.internal(this._root);

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

	/// en: 'Later'
	String get later => 'Later';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';

	/// en: 'Not added'
	String get notAdded => 'Not added';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'No matches'
	String get noMatches => 'No matches';

	/// en: 'Could not load. Try again.'
	String get tryAgainLoad => 'Could not load. Try again.';

	/// en: 'Choose…'
	String get choose => 'Choose…';

	/// en: 'More'
	String get more => 'More';
}

// Path: errors
class Translations$errors$en {
	Translations$errors$en.internal(this._root);

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
	Translations$appearance$en.internal(this._root);

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
	Translations$auth$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your next step toward excellence'
	String get welcomeTitle => 'Your next step toward excellence';

	/// en: 'Apply to {name}, track your application and stay in touch with admissions.'
	String welcomeBody({required Object name}) => 'Apply to ${name}, track your application and stay in touch with admissions.';

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
	String noAccount({required Object name}) => 'New to ${name}?';

	/// en: 'Already have an account?'
	String get haveAccount => 'Already have an account?';

	/// en: 'By continuing you agree to the admissions terms of {name}.'
	String termsNote({required Object name}) => 'By continuing you agree to the admissions terms of ${name}.';

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
	String verifyBody({required Object email}) => 'We sent a 6-character code to ${email}. Enter it below.';

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
	String loginCodeConfirmBody({required Object email}) => 'Type the code we emailed to ${email}.';

	/// en: 'Reset your password'
	String get forgotTitle => 'Reset your password';

	/// en: 'Enter your email and we'll send you a link to set a new password.'
	String get forgotBody => 'Enter your email and we\'ll send you a link to set a new password.';

	/// en: 'Send reset link'
	String get forgotSend => 'Send reset link';

	/// en: 'Check your inbox'
	String get forgotSentTitle => 'Check your inbox';

	/// en: 'If an account exists for {email}, a reset link is on its way.'
	String forgotSentBody({required Object email}) => 'If an account exists for ${email}, a reset link is on its way.';

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
	String choiceTitle({required Object name}) => 'Welcome, ${name}';

	/// en: 'We don't have an account for {email} yet. Would you like to apply for admission to {college}?'
	String choiceBody({required Object email, required Object college}) => 'We don\'t have an account for ${email} yet. Would you like to apply for admission to ${college}?';

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
	Translations$shell$en.internal(this._root);

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
	Translations$profile$en.internal(this._root);

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
	String version({required Object version}) => 'Version ${version}';

	/// en: 'Sign out?'
	String get signOutConfirmTitle => 'Sign out?';

	/// en: 'You'll need your email and password to sign back in.'
	String get signOutConfirmBody => 'You\'ll need your email and password to sign back in.';

	/// en: 'Showing your last known details. We'll refresh when you're back online.'
	String get offlineSnapshot => 'Showing your last known details. We\'ll refresh when you\'re back online.';

	/// en: 'Enter your current password, then the new one twice.'
	String get changePasswordBody => 'Enter your current password, then the new one twice.';

	/// en: 'You signed in with Google or Apple. Set a password to sign in with your email too.'
	String get setPasswordBody => 'You signed in with Google or Apple. Set a password to sign in with your email too.';

	/// en: 'Current password'
	String get currentPassword => 'Current password';

	/// en: 'New password'
	String get newPassword => 'New password';

	/// en: 'Enter your current password.'
	String get currentPasswordNeeded => 'Enter your current password.';

	/// en: 'Password saved.'
	String get passwordChanged => 'Password saved.';

	/// en: 'Security'
	String get security => 'Security';

	/// en: 'App lock'
	String get appLock => 'App lock';

	/// en: 'Ask for your fingerprint, face or phone PIN when you open the app.'
	String get appLockSub => 'Ask for your fingerprint, face or phone PIN when you open the app.';
}

// Path: applications
class Translations$applications$en {
	Translations$applications$en.internal(this._root);

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

	/// en: 'Start another application'
	String get startAnother => 'Start another application';

	/// en: 'Copy family details?'
	String get copyFamilyTitle => 'Copy family details?';

	/// en: 'Save time by copying parents, address and emergency contact from an earlier application.'
	String get copyFamilyBody => 'Save time by copying parents, address and emergency contact from an earlier application.';

	/// en: 'Copy from {name}'
	String copyFamilyFrom({required Object name}) => 'Copy from ${name}';

	/// en: 'Start fresh'
	String get copyFamilyNone => 'Start fresh';

	/// en: 'Draft'
	String get draft => 'Draft';

	/// en: 'Continue'
	String get continueDraft => 'Continue';

	/// en: 'Track'
	String get track => 'Track';

	/// en: 'Step {step} of 3'
	String stepOf({required Object step}) => 'Step ${step} of 3';

	/// en: 'Updated {when}'
	String updated({required Object when}) => 'Updated ${when}';

	/// en: 'just now'
	String get justNow => 'just now';

	/// en: '{n} min ago'
	String minutesAgo({required Object n}) => '${n} min ago';

	/// en: '{n} h ago'
	String hoursAgo({required Object n}) => '${n} h ago';

	/// en: '{n} d ago'
	String daysAgo({required Object n}) => '${n} d ago';

	/// en: 'Delete draft'
	String get deleteDraft => 'Delete draft';

	/// en: 'Delete this draft?'
	String get deleteDraftTitle => 'Delete this draft?';

	/// en: 'Everything you've typed in it will be gone.'
	String get deleteDraftBody => 'Everything you\'ve typed in it will be gone.';

	/// en: 'Draft deleted.'
	String get deleted => 'Draft deleted.';

	/// en: 'Withdraw'
	String get withdraw => 'Withdraw';

	/// en: 'Withdraw this application?'
	String get withdrawTitle => 'Withdraw this application?';

	/// en: 'The office will be told. You can start a new application later.'
	String get withdrawBody => 'The office will be told. You can start a new application later.';

	/// en: 'Application withdrawn.'
	String get withdrawn => 'Application withdrawn.';

	/// en: 'Admissions are closed'
	String get closedTitle => 'Admissions are closed';

	/// en: 'Applications are not being accepted right now. Please check back later.'
	String get closedBody => 'Applications are not being accepted right now. Please check back later.';

	/// en: 'Couldn't load your applications'
	String get loadFailedTitle => 'Couldn\'t load your applications';

	/// en: 'AS Level · first year'
	String get levelAS => 'AS Level · first year';

	/// en: 'A2 Level · joining second year'
	String get levelA2 => 'A2 Level · joining second year';

	/// en: 'Application sent'
	String get sentTitle => 'Application sent';

	/// en: 'Thank you. We'll be in touch about your documents and interview.'
	String get sentBody => 'Thank you. We\'ll be in touch about your documents and interview.';

	/// en: 'Tracking arrives in the next update. Watch your email for now.'
	String get trackerSoon => 'Tracking arrives in the next update. Watch your email for now.';
}

// Path: notifications
class Translations$notifications$en {
	Translations$notifications$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Notifications'
	String get title => 'Notifications';

	/// en: 'You're all caught up'
	String get emptyTitle => 'You\'re all caught up';

	/// en: 'Updates about your application will appear here.'
	String get emptyBody => 'Updates about your application will appear here.';

	/// en: 'Mark all read'
	String get markAllRead => 'Mark all read';

	/// en: 'Couldn't load your notifications'
	String get loadFailed => 'Couldn\'t load your notifications';

	/// en: 'Open'
	String get open => 'Open';

	/// en: 'Unread'
	String get unreadA11y => 'Unread';
}

// Path: form
class Translations$form$en {
	Translations$form$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$form$steps$en steps = Translations$form$steps$en.internal(_root);
	late final Translations$form$meta$en meta = Translations$form$meta$en.internal(_root);
	late final Translations$form$lede$en lede = Translations$form$lede$en.internal(_root);

	/// en: 'Step'
	String get step => 'Step';

	/// en: 'of'
	String get of => 'of';

	/// en: 'Finish later'
	String get finishLater => 'Finish later';

	/// en: 'Send application'
	String get sendApplication => 'Send application';

	/// en: 'Sending'
	String get sending => 'Sending';

	/// en: 'Saved'
	String get saved => 'Saved';

	/// en: 'Saved just now'
	String get savedJustNow => 'Saved just now';

	/// en: 'Saving…'
	String get saving => 'Saving…';

	/// en: 'Not saved'
	String get notSaved => 'Not saved';

	/// en: 'Saved on this phone. We'll send it when you're back online.'
	String get offlineSaved => 'Saved on this phone. We\'ll send it when you\'re back online.';

	/// en: 'A few things still need you. They're marked in red.'
	String get fixMarked => 'A few things still need you. They\'re marked in red.';

	/// en: 'Resume unsaved changes?'
	String get resumeTitle => 'Resume unsaved changes?';

	/// en: 'You made changes on this phone that never reached the college. Continue with them, or go back to the saved copy.'
	String get resumeBody => 'You made changes on this phone that never reached the college. Continue with them, or go back to the saved copy.';

	/// en: 'Resume'
	String get resumeYes => 'Resume';

	/// en: 'Use saved copy'
	String get resumeNo => 'Use saved copy';

	/// en: 'Saved. Pick up where you left off any time from your applications.'
	String get leftToast => 'Saved. Pick up where you left off any time from your applications.';

	/// en: 'Fields marked * are required.'
	String get requiredLegend => 'Fields marked * are required.';

	/// en: 'optional'
	String get optional => 'optional';

	/// en: 'from sign-in'
	String get prefilled => 'from sign-in';

	/// en: 'Not listed? Enter it manually'
	String get notListed => 'Not listed? Enter it manually';

	/// en: 'Search the list instead'
	String get searchInstead => 'Search the list instead';

	/// en: 'Type the name'
	String get typeNameHint => 'Type the name';

	late final Translations$form$about$en about = Translations$form$about$en.internal(_root);
	late final Translations$form$address$en address = Translations$form$address$en.internal(_root);
	late final Translations$form$parents$en parents = Translations$form$parents$en.internal(_root);
	late final Translations$form$emergency$en emergency = Translations$form$emergency$en.internal(_root);
	late final Translations$form$siblings$en siblings = Translations$form$siblings$en.internal(_root);
	late final Translations$form$school$en school = Translations$form$school$en.internal(_root);
	late final Translations$form$grades$en grades = Translations$form$grades$en.internal(_root);
	late final Translations$form$subjects$en subjects = Translations$form$subjects$en.internal(_root);
	late final Translations$form$referee$en referee = Translations$form$referee$en.internal(_root);
	late final Translations$form$beyond$en beyond = Translations$form$beyond$en.internal(_root);
	late final Translations$form$statement$en statement = Translations$form$statement$en.internal(_root);
	late final Translations$form$documentsBlock$en documentsBlock = Translations$form$documentsBlock$en.internal(_root);
	late final Translations$form$review$en review = Translations$form$review$en.internal(_root);
	late final Translations$form$declaration$en declaration = Translations$form$declaration$en.internal(_root);
	late final Translations$form$errors$en errors = Translations$form$errors$en.internal(_root);
}

// Path: documents
class Translations$documents$en {
	Translations$documents$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$documents$groups$en groups = Translations$documents$groups$en.internal(_root);
	late final Translations$documents$pills$en pills = Translations$documents$pills$en.internal(_root);

	/// en: 'The office asked for a clearer copy. Please upload it again.'
	String get replaceSub => 'The office asked for a clearer copy. Please upload it again.';

	/// en: 'Upload'
	String get upload => 'Upload';

	/// en: 'Replace'
	String get replace => 'Replace';

	/// en: 'Later'
	String get later => 'Later';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Send a new copy'
	String get sendNewCopy => 'Send a new copy';

	/// en: 'Add another'
	String get addAnother => 'Add another';

	/// en: 'Uploading file'
	String get uploading => 'Uploading file';

	/// en: 'Another overall result statement'
	String get anotherOverallTitle => 'Another overall result statement';

	/// en: 'For subjects from a later sitting. Each statement is kept.'
	String get anotherOverallSub => 'For subjects from a later sitting. Each statement is kept.';

	/// en: '1 earlier copy kept on your record'
	String get earlierOne => '1 earlier copy kept on your record';

	/// en: '{n} earlier copies kept on your record'
	String earlierMany({required Object n}) => '${n} earlier copies kept on your record';

	/// en: 'was verified'
	String get wasVerified => 'was verified';

	/// en: 'replacement requested'
	String get replacementRequested => 'replacement requested';

	/// en: 'replaced before checking'
	String get replacedBefore => 'replaced before checking';

	/// en: 'File'
	String get file => 'File';

	late final Translations$documents$resultTitle$en resultTitle = Translations$documents$resultTitle$en.internal(_root);

	/// en: 'Upload it when results are announced.'
	String get resultSubPredicted => 'Upload it when results are announced.';

	/// en: 'You can add it now or later.'
	String get resultSubNow => 'You can add it now or later.';

	/// en: 'Awaiting result. Add it when it's announced, or send another combined statement.'
	String get resultAwaiting => 'Awaiting result. Add it when it\'s announced, or send another combined statement.';

	/// en: 'Add a file'
	String get pickTitle => 'Add a file';

	/// en: 'Take a photo'
	String get camera => 'Take a photo';

	/// en: 'Choose a photo'
	String get gallery => 'Choose a photo';

	/// en: 'Choose a file (PDF or image)'
	String get pickFile => 'Choose a file (PDF or image)';

	/// en: '{name} added.'
	String added({required Object name}) => '${name} added.';

	/// en: '{name} removed.'
	String removed({required Object name}) => '${name} removed.';

	/// en: 'Could not upload the file.'
	String get uploadFailed => 'Could not upload the file.';

	/// en: 'Could not remove the file.'
	String get removeFailed => 'Could not remove the file.';

	/// en: '{name} certificate'
	String certificateFor({required Object name}) => '${name} certificate';

	/// en: 'Result'
	String get result => 'Result';

	/// en: 'View'
	String get open => 'View';
}

// Path: tracker
class Translations$tracker$en {
	Translations$tracker$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi {name}, here's where you are.'
	String hi({required Object name}) => 'Hi ${name}, here\'s where you are.';

	/// en: 'Hi there, here's where you are.'
	String get hiThere => 'Hi there, here\'s where you are.';

	/// en: 'Everything happens here: interview, documents, offer, fees and enrolment.'
	String get lede => 'Everything happens here: interview, documents, offer, fees and enrolment.';

	/// en: 'Reference'
	String get reference => 'Reference';

	/// en: 'Copy'
	String get copy => 'Copy';

	/// en: 'Reference copied.'
	String get copied => 'Reference copied.';

	late final Translations$tracker$tabs$en tabs = Translations$tracker$tabs$en.internal(_root);

	/// en: 'Nothing left to do on this application.'
	String get nothingLeft => 'Nothing left to do on this application.';

	/// en: 'Every file is checked by the admissions office. If they need a clearer copy, an upload button appears here. You can send a newer result slip at any time before your offer; earlier copies stay on your record.'
	String get docsHint => 'Every file is checked by the admissions office. If they need a clearer copy, an upload button appears here. You can send a newer result slip at any time before your offer; earlier copies stay on your record.';

	/// en: 'A read-only copy of what you sent, exactly as the admissions office sees it. Contact the office if something needs correcting.'
	String get formHint => 'A read-only copy of what you sent, exactly as the admissions office sees it. Contact the office if something needs correcting.';

	/// en: 'Nothing yet.'
	String get historyEmpty => 'Nothing yet.';

	late final Translations$tracker$status$en status = Translations$tracker$status$en.internal(_root);
	late final Translations$tracker$docsTask$en docsTask = Translations$tracker$docsTask$en.internal(_root);
	late final Translations$tracker$interview$en interview = Translations$tracker$interview$en.internal(_root);
	late final Translations$tracker$slots$en slots = Translations$tracker$slots$en.internal(_root);
	late final Translations$tracker$trials$en trials = Translations$tracker$trials$en.internal(_root);
	late final Translations$tracker$aid$en aid = Translations$tracker$aid$en.internal(_root);
	late final Translations$tracker$enrolled$en enrolled = Translations$tracker$enrolled$en.internal(_root);
	late final Translations$tracker$results$en results = Translations$tracker$results$en.internal(_root);
	late final Translations$tracker$offer$en offer = Translations$tracker$offer$en.internal(_root);
	late final Translations$tracker$payment$en payment = Translations$tracker$payment$en.internal(_root);

	/// en: 'Stage {n} of {total}: {stage}'
	String stageSummary({required Object n, required Object total, required Object stage}) => 'Stage ${n} of ${total}: ${stage}';

	/// en: 'All {total} stages complete'
	String stagesDone({required Object total}) => 'All ${total} stages complete';

	/// en: 'This application has ended'
	String get stagesEnded => 'This application has ended';

	late final Translations$tracker$taskState$en taskState = Translations$tracker$taskState$en.internal(_root);
}

// Path: lock
class Translations$lock$en {
	Translations$lock$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Heuser is locked'
	String get title => 'Heuser is locked';

	/// en: 'Unlock with your fingerprint, face or phone PIN.'
	String get body => 'Unlock with your fingerprint, face or phone PIN.';

	/// en: 'Unlock'
	String get unlock => 'Unlock';

	/// en: 'Unlock Heuser'
	String get reason => 'Unlock Heuser';

	/// en: 'Confirm it is you to turn on app lock'
	String get enableReason => 'Confirm it is you to turn on app lock';
}

// Path: student
class Translations$student$en {
	Translations$student$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Student'
	String get title => 'Student';

	/// en: 'Welcome to Heuser'
	String get welcome => 'Welcome to Heuser';

	/// en: 'Welcome to Heuser, {name}'
	String welcomeName({required Object name}) => 'Welcome to Heuser, ${name}';

	/// en: 'Your student portal is on its way to the app. Until then, use the web portal for everything below.'
	String get body => 'Your student portal is on its way to the app. Until then, use the web portal for everything below.';

	/// en: 'Coming to the app'
	String get comingTitle => 'Coming to the app';

	/// en: 'Timetable'
	String get timetable => 'Timetable';

	/// en: 'Attendance'
	String get attendance => 'Attendance';

	/// en: 'Results'
	String get results => 'Results';

	/// en: 'Fees and vouchers'
	String get fees => 'Fees and vouchers';

	/// en: 'Coming soon'
	String get soon => 'Coming soon';
}

// Path: form.steps
class Translations$form$steps$en {
	Translations$form$steps$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You and your family'
	String get family => 'You and your family';

	/// en: 'Your studies'
	String get studies => 'Your studies';

	/// en: 'Check and send'
	String get review => 'Check and send';
}

// Path: form.meta
class Translations$form$meta$en {
	Translations$form$meta$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About 5 min'
	String get family => 'About 5 min';

	/// en: 'About 6 min'
	String get studies => 'About 6 min';

	/// en: 'About 4 min'
	String get review => 'About 4 min';
}

// Path: form.lede
class Translations$form$lede$en {
	Translations$form$lede$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Who you are, where you live, and who we should contact.'
	String get family => 'Who you are, where you live, and who we should contact.';

	/// en: 'Where you study now, how it's going, and what you'd like to take here.'
	String get studies => 'Where you study now, how it\'s going, and what you\'d like to take here.';

	/// en: 'Write a few lines, add what you have now, check your details, and send. Anything marked "later" won't hold you up.'
	String get review => 'Write a few lines, add what you have now, check your details, and send. Anything marked "later" won\'t hold you up.';
}

// Path: form.about
class Translations$form$about$en {
	Translations$form$about$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About you'
	String get title => 'About you';

	/// en: 'Applying for'
	String get level => 'Applying for';

	/// en: 'First name'
	String get firstName => 'First name';

	/// en: 'Last name'
	String get lastName => 'Last name';

	/// en: 'Date of birth'
	String get dob => 'Date of birth';

	/// en: 'Gender'
	String get gender => 'Gender';

	/// en: 'Male'
	String get male => 'Male';

	/// en: 'Female'
	String get female => 'Female';

	/// en: 'B-Form or CNIC number'
	String get cnic => 'B-Form or CNIC number';

	/// en: '42101-1234567-8'
	String get cnicHint => '42101-1234567-8';

	/// en: 'Religion'
	String get religion => 'Religion';

	/// en: 'Prefer not to say'
	String get religionNone => 'Prefer not to say';

	/// en: 'Your mobile'
	String get mobile => 'Your mobile';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'I hold dual nationality'
	String get dual => 'I hold dual nationality';

	/// en: 'Only if you're a citizen of another country as well as Pakistan.'
	String get dualSub => 'Only if you\'re a citizen of another country as well as Pakistan.';

	/// en: 'Other nationality'
	String get otherNationality => 'Other nationality';

	/// en: 'Your picture'
	String get photo => 'Your picture';

	/// en: 'Passport-style. A phone photo against a plain wall works.'
	String get photoHint => 'Passport-style. A phone photo against a plain wall works.';

	/// en: 'B-Form or CNIC copy'
	String get bform => 'B-Form or CNIC copy';

	/// en: 'A photo of the front is enough.'
	String get bformHint => 'A photo of the front is enough.';
}

// Path: form.address
class Translations$form$address$en {
	Translations$form$address$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Where you live'
	String get title => 'Where you live';

	/// en: 'Home address'
	String get address => 'Home address';

	/// en: 'House, street, area'
	String get addressHint => 'House, street, area';

	/// en: 'Country'
	String get country => 'Country';

	/// en: 'City'
	String get city => 'City';
}

// Path: form.parents
class Translations$form$parents$en {
	Translations$form$parents$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parents'
	String get title => 'Parents';

	/// en: 'One parent is enough to apply. Add the other now or later.'
	String get note => 'One parent is enough to apply. Add the other now or later.';

	/// en: 'Parent or guardian'
	String get first => 'Parent or guardian';

	/// en: 'Second parent'
	String get second => 'Second parent';

	/// en: 'Add second parent'
	String get addSecond => 'Add second parent';

	/// en: 'They are your'
	String get relation => 'They are your';

	/// en: 'First name'
	String get firstName => 'First name';

	/// en: 'Last name'
	String get lastName => 'Last name';

	/// en: 'CNIC number'
	String get cnic => 'CNIC number';

	/// en: 'Mobile'
	String get mobile => 'Mobile';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Marital status'
	String get marital => 'Marital status';

	/// en: 'Work'
	String get work => 'Work';

	/// en: 'Organisation'
	String get organisation => 'Organisation';

	/// en: 'Designation'
	String get designation => 'Designation';
}

// Path: form.emergency
class Translations$form$emergency$en {
	Translations$form$emergency$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Emergency contact'
	String get title => 'Emergency contact';

	/// en: 'Who we call if we can't reach you during the day.'
	String get note => 'Who we call if we can\'t reach you during the day.';

	/// en: 'Same as my {relation}'
	String sameAs({required Object relation}) => 'Same as my ${relation}';

	/// en: 'Same as my first parent'
	String get sameAsFirst => 'Same as my first parent';

	/// en: 'First name'
	String get firstName => 'First name';

	/// en: 'Last name'
	String get lastName => 'Last name';

	/// en: 'Relation to you'
	String get relation => 'Relation to you';

	/// en: 'e.g. Uncle'
	String get relationHint => 'e.g. Uncle';

	/// en: 'Mobile'
	String get mobile => 'Mobile';

	/// en: 'CNIC'
	String get cnic => 'CNIC';

	/// en: 'Email'
	String get email => 'Email';
}

// Path: form.siblings
class Translations$form$siblings$en {
	Translations$form$siblings$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A brother or sister studies or studied at {name}'
	String toggle({required Object name}) => 'A brother or sister studies or studied at ${name}';

	/// en: 'Optional. It helps us link your family's records.'
	String get sub => 'Optional. It helps us link your family\'s records.';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Year or class at {name}'
	String year({required Object name}) => 'Year or class at ${name}';

	/// en: 'e.g. A2, 2025'
	String get yearHint => 'e.g. A2, 2025';

	/// en: 'Add another'
	String get addAnother => 'Add another';
}

// Path: form.school
class Translations$form$school$en {
	Translations$form$school$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Current school'
	String get title => 'Current school';

	/// en: 'School name'
	String get name => 'School name';

	/// en: 'Start typing'
	String get nameHint => 'Start typing';

	/// en: 'Type your school's full name'
	String get manualHint => 'Type your school\'s full name';

	/// en: 'My school isn't listed'
	String get notListed => 'My school isn\'t listed';

	/// en: 'Campus / branch'
	String get campus => 'Campus / branch';

	/// en: 'e.g. Gulshan Campus, or the address'
	String get campusHint => 'e.g. Gulshan Campus, or the address';

	/// en: 'Studied there from'
	String get from => 'Studied there from';

	/// en: 'Until'
	String get until => 'Until';

	/// en: 'Year'
	String get year => 'Year';

	/// en: 'I'm a private candidate, not at a school'
	String get private => 'I\'m a private candidate, not at a school';

	/// en: 'Qualification'
	String get qualification => 'Qualification';

	/// en: 'Cambridge O-Level'
	String get oLevel => 'Cambridge O-Level';

	/// en: 'Matric'
	String get matric => 'Matric';

	/// en: 'IGCSE'
	String get igcse => 'IGCSE';

	/// en: 'AKU-EB'
	String get akuEb => 'AKU-EB';

	/// en: 'Other'
	String get other => 'Other';

	/// en: 'Which qualification?'
	String get whichQualification => 'Which qualification?';

	/// en: 'e.g. American High School Diploma'
	String get whichHint => 'e.g. American High School Diploma';

	/// en: 'Overall percentage'
	String get percentage => 'Overall percentage';
}

// Path: form.grades
class Translations$form$grades$en {
	Translations$form$grades$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your grades'
	String get title => 'Your grades';

	/// en: 'Two lists: papers whose results are out, then papers still to sit or whose results aren't out yet. A subject goes in one list only.'
	String get note => 'Two lists: papers whose results are out, then papers still to sit or whose results aren\'t out yet. A subject goes in one list only.';

	/// en: 'Results out'
	String get outTitle => 'Results out';

	/// en: 'Papers you've already sat whose results are out: pick the grade you got.'
	String get outNote => 'Papers you\'ve already sat whose results are out: pick the grade you got.';

	/// en: 'No results yet. Tap a subject below to add one.'
	String get outEmpty => 'No results yet. Tap a subject below to add one.';

	/// en: 'Still to sit, or results not out yet'
	String get awaitedTitle => 'Still to sit, or results not out yet';

	/// en: 'Papers you haven't sat yet, or whose results aren't out: add the sitting and, if you have one, your expected grade.'
	String get awaitedNote => 'Papers you haven\'t sat yet, or whose results aren\'t out: add the sitting and, if you have one, your expected grade.';

	/// en: 'Nothing here yet. Add the subjects you're still waiting on.'
	String get awaitedEmpty => 'Nothing here yet. Add the subjects you\'re still waiting on.';

	/// en: 'added by you'
	String get addedByYou => 'added by you';

	/// en: 'Month'
	String get month => 'Month';

	/// en: 'Year'
	String get year => 'Year';

	/// en: 'Expected'
	String get expected => 'Expected';

	/// en: 'Quick add:'
	String get quickAdd => 'Quick add:';

	/// en: 'Add another subject'
	String get addAnother => 'Add another subject';

	/// en: 'My subject isn't listed…'
	String get customOption => 'My subject isn\'t listed…';

	/// en: 'Type the subject, e.g. Marine Science'
	String get customHint => 'Type the subject, e.g. Marine Science';

	/// en: 'Type the subject name.'
	String get typeSubject => 'Type the subject name.';

	/// en: '{name} is already in this list.'
	String alreadyListed({required Object name}) => '${name} is already in this list.';

	/// en: '{name} added. Now tap its grade.'
	String addedGrade({required Object name}) => '${name} added. Now tap its grade.';

	/// en: '{name} added. Now add its sitting.'
	String addedSitting({required Object name}) => '${name} added. Now add its sitting.';

	/// en: 'Remove {name}'
	String removeSubject({required Object name}) => 'Remove ${name}';

	/// en: 'Or later'
	String get orLater => 'Or later';

	/// en: 'Not out yet? Leave this, or attach a statement if you have one. We'll remind you when results are announced.'
	String get resultPredicted => 'Not out yet? Leave this, or attach a statement if you have one. We\'ll remind you when results are announced.';

	/// en: 'Attach your results as combined statements (you can add more than one, for different sittings) or one file per subject — whichever you have. You can add more at any time.'
	String get resultAttachHint => 'Attach your results as combined statements (you can add more than one, for different sittings) or one file per subject — whichever you have. You can add more at any time.';

	/// en: 'Combined statement'
	String get combined => 'Combined statement';

	/// en: 'Combined statements'
	String get combinedPlural => 'Combined statements';

	/// en: 'Attach combined result'
	String get attachCombined => 'Attach combined result';

	/// en: 'Add another combined statement'
	String get addCombined => 'Add another combined statement';

	/// en: 'OR'
	String get or => 'OR';

	/// en: 'One file per subject'
	String get perSubject => 'One file per subject';

	/// en: 'Subjects still awaiting results'
	String get awaitingSubjects => 'Subjects still awaiting results';

	/// en: 'Attach result'
	String get attachResult => 'Attach result';

	/// en: 'Mid-term report'
	String get midTerm => 'Mid-term report';

	/// en: 'Helps if your results aren't out yet.'
	String get midTermHint => 'Helps if your results aren\'t out yet.';

	/// en: 'Attach report'
	String get attachReport => 'Attach report';
}

// Path: form.subjects
class Translations$form$subjects$en {
	Translations$form$subjects$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A-Level subjects you'd like'
	String get title => 'A-Level subjects you\'d like';

	/// en: 'Pick 3 to 5. You can change them after your counselling session.'
	String get note => 'Pick 3 to 5. You can change them after your counselling session.';

	/// en: '{n} of {min}–{max}'
	String counter({required Object n, required Object min, required Object max}) => '${n} of ${min}–${max}';

	/// en: '{n} of {max} · the maximum'
	String counterMax({required Object n, required Object max}) => '${n} of ${max} · the maximum';

	/// en: '{n} teachers'
	String teachers({required Object n}) => '${n} teachers';

	/// en: 'No subjects are open for this level yet.'
	String get noneOpen => 'No subjects are open for this level yet.';

	/// en: 'Where a subject has more than one teacher, pick the one you'd prefer. We'll place you with them if their class has a seat. You can switch later in the add/drop window.'
	String get teacherNote => 'Where a subject has more than one teacher, pick the one you\'d prefer. We\'ll place you with them if their class has a seat. You can switch later in the add/drop window.';

	/// en: 'Teacher for {subject}'
	String teacherFor({required Object subject}) => 'Teacher for ${subject}';

	/// en: 'Taught by {name}'
	String taughtBy({required Object name}) => 'Taught by ${name}';

	/// en: 'Teacher assigned by the college'
	String get assigned => 'Teacher assigned by the college';

	/// en: 'What might you study after?'
	String get future => 'What might you study after?';

	/// en: 'Helps our counsellors check your subjects fit the university route you want.'
	String get futureHint => 'Helps our counsellors check your subjects fit the university route you want.';

	/// en: 'Choose or type, e.g. Medicine, Computer Science, Law'
	String get futurePlaceholder => 'Choose or type, e.g. Medicine, Computer Science, Law';
}

// Path: form.referee
class Translations$form$referee$en {
	Translations$form$referee$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Referee'
	String get title => 'Referee';

	/// en: 'A teacher who can recommend you. We'll only contact them if we need to.'
	String get note => 'A teacher who can recommend you. We\'ll only contact them if we need to.';

	/// en: 'I'd like to add a referee'
	String get toggle => 'I\'d like to add a referee';

	/// en: 'Optional. Leave it off if you don't have one.'
	String get sub => 'Optional. Leave it off if you don\'t have one.';

	/// en: 'Their name'
	String get name => 'Their name';

	/// en: 'e.g. Ms. Sana Ali'
	String get nameHint => 'e.g. Ms. Sana Ali';

	/// en: 'Their email'
	String get email => 'Their email';

	/// en: 'Their organisation email is preferred.'
	String get emailHint => 'Their organisation email is preferred.';

	/// en: 'Organisation'
	String get organisation => 'Organisation';

	/// en: 'e.g. Beaconhouse School System'
	String get organisationHint => 'e.g. Beaconhouse School System';

	/// en: 'Designation'
	String get designation => 'Designation';

	/// en: 'e.g. Head of Physics'
	String get designationHint => 'e.g. Head of Physics';

	/// en: 'Recommendation letter'
	String get letter => 'Recommendation letter';

	/// en: 'If your referee has already written one. Otherwise we'll ask them.'
	String get letterHint => 'If your referee has already written one. Otherwise we\'ll ask them.';

	/// en: 'Attach letter'
	String get attachLetter => 'Attach letter';
}

// Path: form.beyond
class Translations$form$beyond$en {
	Translations$form$beyond$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Beyond the classroom'
	String get title => 'Beyond the classroom';

	/// en: 'Tap anything you do, add a line about it, and attach a certificate or letter if you have one.'
	String get note => 'Tap anything you do, add a line about it, and attach a certificate or letter if you have one.';

	/// en: 'Sports'
	String get sports => 'Sports';

	/// en: 'Name the sport, e.g. Horse riding'
	String get otherSport => 'Name the sport, e.g. Horse riding';

	/// en: '{name} level'
	String level({required Object name}) => '${name} level';

	/// en: 'e.g. School team captain, 2 years'
	String get sportDetailsHint => 'e.g. School team captain, 2 years';

	/// en: 'Other activities'
	String get activities => 'Other activities';

	/// en: 'What else have you done? e.g. Hifz, Volunteer tutoring'
	String get otherActivity => 'What else have you done? e.g. Hifz, Volunteer tutoring';

	/// en: 'What did you do? e.g. Beach clean-up, 3 drives'
	String get activityDetailsHint => 'What did you do? e.g. Beach clean-up, 3 drives';

	/// en: '+ Other'
	String get other => '+ Other';

	/// en: 'Added by you. Tap to remove.'
	String get addedByYou => 'Added by you. Tap to remove.';

	/// en: 'Type the sport name.'
	String get typeSport => 'Type the sport name.';

	/// en: 'Type the activity name.'
	String get typeActivity => 'Type the activity name.';

	/// en: '{name} is already on the list, so we selected it.'
	String alreadyListed({required Object name}) => '${name} is already on the list, so we selected it.';

	/// en: '{name} added. Add a line about it below.'
	String added({required Object name}) => '${name} added. Add a line about it below.';

	/// en: 'Certificate (optional)'
	String get certificate => 'Certificate (optional)';

	/// en: 'Add more'
	String get addMore => 'Add more';

	/// en: 'Certificate'
	String get certificateLabel => 'Certificate';

	/// en: 'I'd like a sports trial'
	String get trial => 'I\'d like a sports trial';

	/// en: 'For a sports scholarship. You'll book a trial after you apply.'
	String get trialSub => 'For a sports scholarship. You\'ll book a trial after you apply.';

	/// en: 'Anything else we should know?'
	String get more => 'Anything else we should know?';

	/// en: 'Special circumstances, extra qualifications, or anything the form doesn't cover.'
	String get moreSub => 'Special circumstances, extra qualifications, or anything the form doesn\'t cover.';

	/// en: 'Additional information'
	String get moreLabel => 'Additional information';
}

// Path: form.statement
class Translations$form$statement$en {
	Translations$form$statement$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your statement'
	String get title => 'Your statement';

	/// en: 'Why {name}, and what you want from your A-Levels. Your interviewer reads this first.'
	String note({required Object name}) => 'Why ${name}, and what you want from your A-Levels. Your interviewer reads this first.';

	/// en: '{n} words · 80–300'
	String words({required Object n}) => '${n} words · 80–300';

	/// en: '1 word · 80–300'
	String get word => '1 word · 80–300';

	/// en: 'I want to study at {name} because…'
	String prompt1({required Object name}) => 'I want to study at ${name} because…';

	/// en: 'The subject I enjoy most is…'
	String get prompt2 => 'The subject I enjoy most is…';

	/// en: 'After A-Levels, I hope to…'
	String get prompt3 => 'After A-Levels, I hope to…';
}

// Path: form.documentsBlock
class Translations$form$documentsBlock$en {
	Translations$form$documentsBlock$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Documents'
	String get title => 'Documents';

	/// en: '{n} marked "Before interview" are needed before your interview. Everything else can follow.'
	String needed({required Object n}) => '${n} marked "Before interview" are needed before your interview. Everything else can follow.';

	/// en: 'One, marked "Before interview", is needed before your interview. Everything else can follow.'
	String get neededOne => 'One, marked "Before interview", is needed before your interview. Everything else can follow.';

	/// en: 'You can book your interview without these. Add them when you can.'
	String get none => 'You can book your interview without these. Add them when you can.';
}

// Path: form.review
class Translations$form$review$en {
	Translations$form$review$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your details'
	String get title => 'Your details';

	/// en: 'You'
	String get you => 'You';

	/// en: 'Applying for'
	String get applyingFor => 'Applying for';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Date of birth'
	String get dob => 'Date of birth';

	/// en: 'Gender'
	String get gender => 'Gender';

	/// en: 'B-Form / CNIC'
	String get cnic => 'B-Form / CNIC';

	/// en: 'Religion'
	String get religion => 'Religion';

	/// en: 'Mobile'
	String get mobile => 'Mobile';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Dual nationality'
	String get dual => 'Dual nationality';

	/// en: 'Home address'
	String get home => 'Home address';

	/// en: 'Parent or guardian'
	String get parent => 'Parent or guardian';

	/// en: 'Second parent'
	String get secondParent => 'Second parent';

	/// en: 'Relation'
	String get relation => 'Relation';

	/// en: 'Marital status'
	String get maritalStatus => 'Marital status';

	/// en: 'Work'
	String get work => 'Work';

	/// en: 'Emergency contact'
	String get emergency => 'Emergency contact';

	/// en: 'Contact'
	String get contact => 'Contact';

	/// en: 'Same as {relation}'
	String sameAs({required Object relation}) => 'Same as ${relation}';

	/// en: 'Siblings at {name}'
	String siblings({required Object name}) => 'Siblings at ${name}';

	/// en: 'Studies'
	String get studies => 'Studies';

	/// en: 'School'
	String get school => 'School';

	/// en: 'Private candidate'
	String get privateCandidate => 'Private candidate';

	/// en: 'Years'
	String get years => 'Years';

	/// en: 'Qualification'
	String get qualification => 'Qualification';

	/// en: 'Overall percentage'
	String get percentage => 'Overall percentage';

	/// en: 'Results'
	String get results => 'Results';

	/// en: 'awaited'
	String get awaited => 'awaited';

	/// en: 'expected {grade}'
	String expected({required Object grade}) => 'expected ${grade}';

	/// en: 'A-Level choices'
	String get choices => 'A-Level choices';

	/// en: '{subject} with {teacher}'
	String kWith({required Object subject, required Object teacher}) => '${subject} with ${teacher}';

	/// en: 'Future study'
	String get future => 'Future study';

	/// en: 'Referee'
	String get referee => 'Referee';

	/// en: 'Beyond the classroom'
	String get beyond => 'Beyond the classroom';

	/// en: 'Sports'
	String get sports => 'Sports';

	/// en: 'Other activities'
	String get activities => 'Other activities';

	/// en: 'Sports trial'
	String get trial => 'Sports trial';

	/// en: 'Yes, requested'
	String get trialYes => 'Yes, requested';

	/// en: 'Anything else'
	String get anythingElse => 'Anything else';

	/// en: 'Statement'
	String get statement => 'Statement';

	/// en: 'Own business'
	String get ownBusiness => 'Own business';

	/// en: 'Not working'
	String get notWorking => 'Not working';
}

// Path: form.declaration
class Translations$form$declaration$en {
	Translations$form$declaration$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'I confirm the details are correct. I understand {name} may ask for original documents at enrolment, and that expected grades will be checked against final results.'
	String text({required Object name}) => 'I confirm the details are correct. I understand ${name} may ask for original documents at enrolment, and that expected grades will be checked against final results.';

	/// en: 'Please confirm before sending.'
	String get missing => 'Please confirm before sending.';

	/// en: 'Tick the declaration first'
	String get tickFirst => 'Tick the declaration first';
}

// Path: form.errors
class Translations$form$errors$en {
	Translations$form$errors$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$form$errors$req$en req = Translations$form$errors$req$en.internal(_root);
	late final Translations$form$errors$format$en format = Translations$form$errors$format$en.internal(_root);

	/// en: 'Pick a teacher for {subject}.'
	String teacher({required Object subject}) => 'Pick a teacher for ${subject}.';

	/// en: 'Pick a teacher for this subject.'
	String get teacherGeneric => 'Pick a teacher for this subject.';

	/// en: 'Write at least 80 words. A few honest lines are better than a polished essay.'
	String get statementShort => 'Write at least 80 words. A few honest lines are better than a polished essay.';

	/// en: 'That's over 300 words. Trim it to the parts that matter most.'
	String get statementLong => 'That\'s over 300 words. Trim it to the parts that matter most.';
}

// Path: documents.groups
class Translations$documents$groups$en {
	Translations$documents$groups$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Needed before your interview'
	String get beforeInterview => 'Needed before your interview';

	/// en: 'Add when you have them'
	String get later => 'Add when you have them';

	/// en: 'Certificates'
	String get certificates => 'Certificates';

	/// en: 'Needed at enrolment'
	String get enrolment => 'Needed at enrolment';
}

// Path: documents.pills
class Translations$documents$pills$en {
	Translations$documents$pills$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Before interview'
	String get beforeInterview => 'Before interview';

	/// en: 'Add when you can'
	String get early => 'Add when you can';

	/// en: 'After results'
	String get afterResults => 'After results';

	/// en: 'At enrolment'
	String get atEnrolment => 'At enrolment';

	/// en: 'Optional'
	String get optional => 'Optional';

	/// en: 'Added'
	String get added => 'Added';

	/// en: 'Being checked'
	String get checking => 'Being checked';

	/// en: 'Received'
	String get received => 'Received';

	/// en: 'Replacement requested'
	String get replace => 'Replacement requested';

	/// en: 'Later'
	String get later => 'Later';
}

// Path: documents.resultTitle
class Translations$documents$resultTitle$en {
	Translations$documents$resultTitle$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Matric result card'
	String get matric => 'Matric result card';

	/// en: 'IGCSE result'
	String get igcse => 'IGCSE result';

	/// en: 'AKU-EB result'
	String get akuEb => 'AKU-EB result';

	/// en: 'CAIE result'
	String get caie => 'CAIE result';
}

// Path: tracker.tabs
class Translations$tracker$tabs$en {
	Translations$tracker$tabs$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'To do'
	String get todo => 'To do';

	/// en: 'Documents'
	String get docs => 'Documents';

	/// en: 'Application'
	String get form => 'Application';

	/// en: 'History'
	String get history => 'History';
}

// Path: tracker.status
class Translations$tracker$status$en {
	Translations$tracker$status$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Application withdrawn'
	String get withdrawnTitle => 'Application withdrawn';

	/// en: 'You withdrew this application on {date}. The admissions office has been told. To apply again, start a new application.'
	String withdrawnBody({required Object date}) => 'You withdrew this application on ${date}. The admissions office has been told. To apply again, start a new application.';

	/// en: 'an earlier date'
	String get anEarlierDate => 'an earlier date';

	/// en: 'We couldn't offer you a place'
	String get notOfferedTitle => 'We couldn\'t offer you a place';

	/// en: 'We're unable to offer you a place this time. Thank you for applying.'
	String get notOfferedBody => 'We\'re unable to offer you a place this time. Thank you for applying.';

	/// en: 'Application closed'
	String get closedTitle => 'Application closed';

	/// en: 'This application is closed. Contact the admissions office if you have questions.'
	String get closedBody => 'This application is closed. Contact the admissions office if you have questions.';

	/// en: 'Welcome to {name}'
	String enrolledTitle({required Object name}) => 'Welcome to ${name}';

	/// en: 'You're enrolled. The college will be in touch about orientation.'
	String get enrolledBody => 'You\'re enrolled. The college will be in touch about orientation.';

	/// en: 'Place confirmed'
	String get readyTitle => 'Place confirmed';

	/// en: 'Paid and verified. The office is completing your enrolment.'
	String get readyBody => 'Paid and verified. The office is completing your enrolment.';

	/// en: 'We're checking your payment'
	String get checkingTitle => 'We\'re checking your payment';

	/// en: 'Finance is verifying your proof of payment. This page updates once it's done.'
	String get checkingBody => 'Finance is verifying your proof of payment. This page updates once it\'s done.';

	/// en: 'Pay your fee voucher'
	String get payTitle => 'Pay your fee voucher';

	/// en: 'Your last proof couldn't be verified. See the reason below and upload a new one.'
	String get payRejectedBody => 'Your last proof couldn\'t be verified. See the reason below and upload a new one.';

	/// en: 'Pay the voucher online or at the bank, then upload the screenshot or the bank's copy.'
	String get payBody => 'Pay the voucher online or at the bank, then upload the screenshot or the bank\'s copy.';

	/// en: 'Your offer has expired'
	String get offerExpiredTitle => 'Your offer has expired';

	/// en: 'Contact the admissions office if you'd like it reconsidered.'
	String get offerExpiredBody => 'Contact the admissions office if you\'d like it reconsidered.';

	/// en: 'You declined the offer'
	String get offerDeclinedTitle => 'You declined the offer';

	/// en: 'The admissions office has been told. If you change your mind, contact them; they can make a new offer.'
	String get offerDeclinedBody => 'The admissions office has been told. If you change your mind, contact them; they can make a new offer.';

	/// en: 'You have an offer'
	String get offeredTitle => 'You have an offer';

	/// en: 'Read your offer and accept it to get your fee voucher.'
	String get offeredBody => 'Read your offer and accept it to get your fee voucher.';

	/// en: 'Your sports trial'
	String get trialTitle => 'Your sports trial';

	/// en: 'Book or attend your trial below. Each sport has its own trial calendar, separate from your interview.'
	String get trialBody => 'Book or attend your trial below. Each sport has its own trial calendar, separate from your interview.';

	/// en: 'Your interview is done'
	String get interviewDoneTitle => 'Your interview is done';

	/// en: 'The admissions office is making a decision. This usually takes about a week.'
	String get interviewDoneBody => 'The admissions office is making a decision. This usually takes about a week.';

	/// en: 'Interview booked'
	String get bookedTitle => 'Interview booked';

	/// en: 'See you on {when}. A reminder goes to you and your parent the day before.'
	String bookedBody({required Object when}) => 'See you on ${when}. A reminder goes to you and your parent the day before.';

	/// en: 'Book your interview'
	String get bookTitle => 'Book your interview';

	/// en: 'Pick a time that suits you and a parent.'
	String get bookBody => 'Pick a time that suits you and a parent.';

	/// en: 'We're reviewing your application'
	String get reviewingTitle => 'We\'re reviewing your application';

	/// en: 'Add your {docs} so the office can check them before your interview.'
	String reviewingMissing({required Object docs}) => 'Add your ${docs} so the office can check them before your interview.';

	/// en: 'The admissions office is checking your details and documents. You can book your interview once they're cleared.'
	String get reviewingBody => 'The admissions office is checking your details and documents. You can book your interview once they\'re cleared.';

	/// en: ' and '
	String get and => ' and ';
}

// Path: tracker.docsTask
class Translations$tracker$docsTask$en {
	Translations$tracker$docsTask$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Documents'
	String get title => 'Documents';

	/// en: 'The office asked for a clearer copy of one document'
	String get replace => 'The office asked for a clearer copy of one document';

	/// en: '{n} needed before your interview'
	String blocking({required Object n}) => '${n} needed before your interview';

	/// en: 'Still to send: {names}'
	String toSend({required Object names}) => 'Still to send: ${names}';

	/// en: '{names} and {n} more'
	String andMore({required Object names, required Object n}) => '${names} and ${n} more';

	/// en: 'Everything needed for now is in. Results-dependent ones can follow.'
	String get allIn => 'Everything needed for now is in. Results-dependent ones can follow.';

	/// en: 'Upload'
	String get upload => 'Upload';

	/// en: 'View'
	String get view => 'View';
}

// Path: tracker.interview
class Translations$tracker$interview$en {
	Translations$tracker$interview$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Interview'
	String get title => 'Interview';

	/// en: 'In progress, {when}'
	String inProgress({required Object when}) => 'In progress, ${when}';

	/// en: 'Done, {when}'
	String done({required Object when}) => 'Done, ${when}';

	/// en: 'Missed. Contact the admissions office to arrange another time.'
	String get missed => 'Missed. Contact the admissions office to arrange another time.';

	/// en: 'Your documents are checked. We'll email you when interview times open.'
	String get waitingTimes => 'Your documents are checked. We\'ll email you when interview times open.';

	/// en: 'You'll be able to book once your documents are checked'
	String get waitingDocs => 'You\'ll be able to book once your documents are checked';

	/// en: 'Booked: {when}'
	String booked({required Object when}) => 'Booked: ${when}';

	/// en: 'Choose a time. A parent should come with you.'
	String get choose => 'Choose a time. A parent should come with you.';

	/// en: 'You've already moved it once. Contact the office to change it again.'
	String get movedOnce => 'You\'ve already moved it once. Contact the office to change it again.';

	/// en: 'Not happy with this time? You can move it once.'
	String get notHappy => 'Not happy with this time? You can move it once.';

	/// en: 'Change it'
	String get changeIt => 'Change it';

	/// en: 'Pick a new time. You can move your interview once.'
	String get pickNew => 'Pick a new time. You can move your interview once.';

	/// en: 'Keep {time}'
	String keep({required Object time}) => 'Keep ${time}';

	/// en: 'No times are open right now. Check back soon.'
	String get noTimes => 'No times are open right now. Check back soon.';

	/// en: 'Book this interview time?'
	String get confirmBookTitle => 'Book this interview time?';

	/// en: 'Move your interview?'
	String get confirmMoveTitle => 'Move your interview?';

	/// en: 'Book it'
	String get confirmBook => 'Book it';

	/// en: 'Move it'
	String get confirmMove => 'Move it';

	/// en: '{when}. A parent should come with you. You can move it once later if you need to.'
	String confirmBookBody({required Object when}) => '${when}. A parent should come with you. You can move it once later if you need to.';

	/// en: '{when} instead of {old}. This uses your one change. After this, the office moves it for you.'
	String confirmMoveBody({required Object when, required Object old}) => '${when} instead of ${old}. This uses your one change. After this, the office moves it for you.';

	/// en: 'Booked. See you then.'
	String get bookedToast => 'Booked. See you then.';

	/// en: 'Interview moved.'
	String get movedToast => 'Interview moved.';
}

// Path: tracker.slots
class Translations$tracker$slots$en {
	Translations$tracker$slots$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today · {date}'
	String today({required Object date}) => 'Today · ${date}';

	/// en: 'Tomorrow · {date}'
	String tomorrow({required Object date}) => 'Tomorrow · ${date}';

	/// en: '{n} slots available'
	String available({required Object n}) => '${n} slots available';

	/// en: '1 slot available'
	String get availableOne => '1 slot available';

	/// en: 'Fully booked'
	String get full => 'Fully booked';

	/// en: '{booked} of {total} booked · {left} left'
	String places({required Object booked, required Object total, required Object left}) => '${booked} of ${total} booked · ${left} left';

	/// en: '{n} left'
	String left({required Object n}) => '${n} left';

	/// en: 'Last selected'
	String get lastSelected => 'Last selected';
}

// Path: tracker.trials
class Translations$tracker$trials$en {
	Translations$tracker$trials$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Sports trial'
	String get title => 'Sports trial';

	/// en: 'For the sports scholarship'
	String get forScholarship => 'For the sports scholarship';

	/// en: 'Trial skipped by the admissions office'
	String get skipped => 'Trial skipped by the admissions office';

	/// en: 'Booked: {list}'
	String booked({required Object list}) => 'Booked: ${list}';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Skipped'
	String get skippedPill => 'Skipped';

	/// en: 'We'll email you when trial timeslots open, then you can book one here.'
	String get notReleased => 'We\'ll email you when trial timeslots open, then you can book one here.';

	/// en: 'No trial times yet.'
	String get noTimes => 'No trial times yet.';

	/// en: 'Bring your sports kit. Each sport has its own trial calendar, separate from your interview.'
	String get kit => 'Bring your sports kit. Each sport has its own trial calendar, separate from your interview.';

	/// en: 'Each sport has its own trial calendar, separate from your interview.'
	String get calendar => 'Each sport has its own trial calendar, separate from your interview.';

	/// en: 'Book the {sport} trial?'
	String confirmTitle({required Object sport}) => 'Book the ${sport} trial?';

	/// en: '{when}. Bring your sports kit.'
	String confirmBody({required Object when}) => '${when}. Bring your sports kit.';

	/// en: 'Trial booked.'
	String get bookedToast => 'Trial booked.';
}

// Path: tracker.aid
class Translations$tracker$aid$en {
	Translations$tracker$aid$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Financial aid form'
	String get title => 'Financial aid form';

	/// en: 'Sent. The admissions office will review it.'
	String get sent => 'Sent. The admissions office will review it.';

	/// en: 'Your interviewer has given you the financial aid form.'
	String get given => 'Your interviewer has given you the financial aid form.';

	/// en: 'The form's questions are being finalised by the college; you'll be able to fill it in here.'
	String get pending => 'The form\'s questions are being finalised by the college; you\'ll be able to fill it in here.';
}

// Path: tracker.enrolled
class Translations$tracker$enrolled$en {
	Translations$tracker$enrolled$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enrolled'
	String get title => 'Enrolled';

	/// en: 'The college will be in touch about orientation'
	String get sub => 'The college will be in touch about orientation';

	/// en: 'Still to add before classes start: {docs}.'
	String left({required Object docs}) => 'Still to add before classes start: ${docs}.';

	/// en: 'Nothing left to add. You're all set.'
	String get none => 'Nothing left to add. You\'re all set.';
}

// Path: tracker.results
class Translations$tracker$results$en {
	Translations$tracker$results$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Results still to come'
	String get waitingTitle => 'Results still to come';

	/// en: 'Your results'
	String get title => 'Your results';

	/// en: 'When a result is out, tap the grade you got, then upload the result below. If a grade you sent is wrong, change it; the office checks it again and keeps the old one on record.'
	String get hint => 'When a result is out, tap the grade you got, then upload the result below. If a grade you sent is wrong, change it; the office checks it again and keeps the old one on record.';

	/// en: 'expected {grade}'
	String expected({required Object grade}) => 'expected ${grade}';

	/// en: 'Result out'
	String get resultOut => 'Result out';

	/// en: 'Change grade'
	String get changeGrade => 'Change grade';

	/// en: 'Save grade'
	String get saveGrade => 'Save grade';

	/// en: 'Result is out'
	String get isOut => 'Result is out';

	/// en: 'Result saved. Upload its slip below.'
	String get savedToast => 'Result saved. Upload its slip below.';
}

// Path: tracker.offer
class Translations$tracker$offer$en {
	Translations$tracker$offer$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Offer'
	String get waitingTitle => 'Offer';

	/// en: 'Usually within a week of your interview'
	String get waitingSub => 'Usually within a week of your interview';

	/// en: 'Your offer'
	String get title => 'Your offer';

	/// en: 'Accepted'
	String get accepted => 'Accepted';

	/// en: 'You declined this offer'
	String get declined => 'You declined this offer';

	/// en: 'This offer has expired'
	String get expired => 'This offer has expired';

	/// en: '{level}, {cycle}'
	String summary({required Object level, required Object cycle}) => '${level}, ${cycle}';

	/// en: '{summary}, with {list}'
	String withScholarships({required Object summary, required Object list}) => '${summary}, with ${list}';

	/// en: '{summary} · conditional'
	String conditional({required Object summary}) => '${summary} · conditional';

	/// en: 'Respond and pay by {date}'
	String respondBy({required Object date}) => 'Respond and pay by ${date}';

	/// en: 'Deadline passed'
	String get deadlinePassed => 'Deadline passed';

	/// en: '{label} (monthly)'
	String monthly({required Object label}) => '${label} (monthly)';

	/// en: 'Scholarship on {label}'
	String scholarshipOn({required Object label}) => 'Scholarship on ${label}';

	/// en: 'Due now'
	String get dueNow => 'Due now';

	/// en: 'Monthly'
	String get monthlyTotal => 'Monthly';

	/// en: 'Accept offer'
	String get accept => 'Accept offer';

	/// en: 'Accept this offer?'
	String get acceptTitle => 'Accept this offer?';

	/// en: 'You'll then pay {amount} and upload proof of payment to secure your place.'
	String acceptBody({required Object amount}) => 'You\'ll then pay ${amount} and upload proof of payment to secure your place.';

	/// en: 'Not yet'
	String get notYet => 'Not yet';

	/// en: 'Offer accepted. Your fee voucher is ready.'
	String get acceptedToast => 'Offer accepted. Your fee voucher is ready.';

	/// en: 'Download letter'
	String get letter => 'Download letter';

	/// en: 'Offer details'
	String get details => 'Offer details';

	/// en: 'Terms and conditions'
	String get terms => 'Terms and conditions';

	/// en: '{course} with {teacher}'
	String kWith({required Object course, required Object teacher}) => '${course} with ${teacher}';

	/// en: 'Could not open the file.'
	String get downloadFailed => 'Could not open the file.';

	/// en: 'Accepted'
	String get pillAccepted => 'Accepted';

	/// en: 'Declined'
	String get pillDeclined => 'Declined';

	/// en: 'Expired'
	String get pillExpired => 'Expired';
}

// Path: tracker.payment
class Translations$tracker$payment$en {
	Translations$tracker$payment$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Fee payment'
	String get title => 'Fee payment';

	/// en: 'Your voucher appears when you accept the offer'
	String get locked => 'Your voucher appears when you accept the offer';

	/// en: 'Paid'
	String get paid => 'Paid';

	/// en: 'Pay online or at the bank, then upload the screenshot or the bank's copy'
	String get due => 'Pay online or at the bank, then upload the screenshot or the bank\'s copy';

	/// en: 'Tuition voucher'
	String get tuition => 'Tuition voucher';

	/// en: 'Tuition voucher · {period}'
	String tuitionPeriod({required Object period}) => 'Tuition voucher · ${period}';

	/// en: 'Instalment {n}'
	String instalment({required Object n}) => 'Instalment ${n}';

	/// en: 'Admission fee voucher'
	String get admission => 'Admission fee voucher';

	/// en: 'Amount'
	String get amount => 'Amount';

	/// en: 'Pay by'
	String get payBy => 'Pay by';

	/// en: 'We've received {paid}. {left} is still due: pay it and upload the proof.'
	String partly({required Object paid, required Object left}) => 'We\'ve received ${paid}. ${left} is still due: pay it and upload the proof.';

	/// en: 'Please upload it again.'
	String get uploadAgain => 'Please upload it again.';

	/// en: 'Paid · approved by finance'
	String get paidPill => 'Paid · approved by finance';

	/// en: 'Proof sent · being checked'
	String get checkingPill => 'Proof sent · being checked';

	/// en: 'Download voucher'
	String get voucher => 'Download voucher';

	/// en: 'Download balance voucher'
	String get balanceVoucher => 'Download balance voucher';

	/// en: 'Paid online (screenshot)'
	String get online => 'Paid online (screenshot)';

	/// en: 'Paid at the bank (bank copy)'
	String get bank => 'Paid at the bank (bank copy)';

	/// en: 'Upload proof'
	String get upload => 'Upload proof';

	/// en: 'Upload again'
	String get again => 'Upload again';

	/// en: 'Send another copy'
	String get another => 'Send another copy';

	/// en: 'Proof sent. Finance will verify it.'
	String get sentToast => 'Proof sent. Finance will verify it.';

	/// en: 'Uploading file'
	String get uploading => 'Uploading file';
}

// Path: tracker.taskState
class Translations$tracker$taskState$en {
	Translations$tracker$taskState$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'To do'
	String get todo => 'To do';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Not yet available'
	String get locked => 'Not yet available';
}

// Path: form.errors.req
class Translations$form$errors$req$en {
	Translations$form$errors$req$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add your first name as on your B-Form.'
	String get first_name => 'Add your first name as on your B-Form.';

	/// en: 'Add your last name.'
	String get last_name => 'Add your last name.';

	/// en: 'Add your date of birth.'
	String get date_of_birth => 'Add your date of birth.';

	/// en: 'Choose one.'
	String get gender => 'Choose one.';

	/// en: 'Enter the 13-digit number from your B-Form or CNIC.'
	String get cnic => 'Enter the 13-digit number from your B-Form or CNIC.';

	/// en: 'Add a mobile number we can reach you on.'
	String get mobile => 'Add a mobile number we can reach you on.';

	/// en: 'Which other country?'
	String get other_nationality => 'Which other country?';

	/// en: 'Add your home address.'
	String get address => 'Add your home address.';

	/// en: 'Add your city.'
	String get city => 'Add your city.';

	/// en: 'Add your country.'
	String get country => 'Add your country.';

	/// en: 'Add at least one parent or guardian.'
	String get guardians => 'Add at least one parent or guardian.';

	/// en: 'Add a first name.'
	String get emg_first_name => 'Add a first name.';

	/// en: 'Add a last name.'
	String get emg_last_name => 'Add a last name.';

	/// en: 'How are they related to you?'
	String get emg_relation => 'How are they related to you?';

	/// en: 'Add their mobile.'
	String get emg_mobile => 'Add their mobile.';

	/// en: 'Tell us which school you're at.'
	String get school => 'Tell us which school you\'re at.';

	/// en: 'Add the campus name or address.'
	String get school_campus => 'Add the campus name or address.';

	/// en: 'Name your qualification.'
	String get qualification_other => 'Name your qualification.';

	/// en: 'Pick the year you joined.'
	String get studied_from => 'Pick the year you joined.';

	/// en: 'Pick the year you finish.'
	String get studied_until => 'Pick the year you finish.';

	/// en: 'Add the subjects you've sat or are sitting. Each result that's out needs its grade.'
	String get results => 'Add the subjects you\'ve sat or are sitting. Each result that\'s out needs its grade.';

	/// en: 'Choose at least 3 subjects.'
	String get subjects => 'Choose at least 3 subjects.';

	/// en: 'Choose one.'
	String get parent_relation => 'Choose one.';

	/// en: 'Add their first name.'
	String get parent_first_name => 'Add their first name.';

	/// en: 'Add their last name.'
	String get parent_last_name => 'Add their last name.';

	/// en: 'Enter their 13-digit CNIC number.'
	String get parent_cnic => 'Enter their 13-digit CNIC number.';

	/// en: 'We need a number to call about your interview.'
	String get parent_mobile => 'We need a number to call about your interview.';

	/// en: 'Add their email address.'
	String get parent_email => 'Add their email address.';

	/// en: 'Required.'
	String get other => 'Required.';
}

// Path: form.errors.format
class Translations$form$errors$format$en {
	Translations$form$errors$format$en.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Enter a mobile number (not a landline) for the chosen country. For Pakistan: 0300 1234567.'
	String get phone => 'Enter a mobile number (not a landline) for the chosen country. For Pakistan: 0300 1234567.';

	/// en: 'That doesn't look like an email address. Check for a typo, like name@example.com.'
	String get email => 'That doesn\'t look like an email address. Check for a typo, like name@example.com.';

	/// en: 'A CNIC or B-Form number has 13 digits, like 42101-1234567-8.'
	String get cnic => 'A CNIC or B-Form number has 13 digits, like 42101-1234567-8.';
}
