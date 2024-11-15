// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `QR`
  String get qr {
    return Intl.message(
      'QR',
      name: 'qr',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Here`
  String get here {
    return Intl.message(
      'Here',
      name: 'here',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Feed`
  String get feed {
    return Intl.message(
      'Feed',
      name: 'feed',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message(
      'Unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get days {
    return Intl.message(
      'days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Vote`
  String get vote {
    return Intl.message(
      'Vote',
      name: 'vote',
      desc: '',
      args: [],
    );
  }

  /// `Perks`
  String get perks {
    return Intl.message(
      'Perks',
      name: 'perks',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Union`
  String get union {
    return Intl.message(
      'Union',
      name: 'union',
      desc: '',
      args: [],
    );
  }

  /// `Call:  `
  String get call {
    return Intl.message(
      'Call:  ',
      name: 'call',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Voting`
  String get voting {
    return Intl.message(
      'Voting',
      name: 'voting',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Ends in`
  String get endsIn {
    return Intl.message(
      'Ends in',
      name: 'endsIn',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Back to`
  String get backto {
    return Intl.message(
      'Back to',
      name: 'backto',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Ends on:`
  String get endsOn {
    return Intl.message(
      'Ends on:',
      name: 'endsOn',
      desc: '',
      args: [],
    );
  }

  /// `Read all`
  String get readall {
    return Intl.message(
      'Read all',
      name: 'readall',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `All Done!`
  String get allDone {
    return Intl.message(
      'All Done!',
      name: 'allDone',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Starts on:`
  String get startsOn {
    return Intl.message(
      'Starts on:',
      name: 'startsOn',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get documents {
    return Intl.message(
      'Documents',
      name: 'documents',
      desc: '',
      args: [],
    );
  }

  /// `Send Email`
  String get sendEmail {
    return Intl.message(
      'Send Email',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Cell phone`
  String get cellphone {
    return Intl.message(
      'Cell phone',
      name: 'cellphone',
      desc: '',
      args: [],
    );
  }

  /// `Grievances`
  String get grievances {
    return Intl.message(
      'Grievances',
      name: 'grievances',
      desc: '',
      args: [],
    );
  }

  /// `Executives`
  String get executives {
    return Intl.message(
      'Executives',
      name: 'executives',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `New pasword`
  String get newpasword {
    return Intl.message(
      'New pasword',
      name: 'newpasword',
      desc: '',
      args: [],
    );
  }

  /// `Receipt ID: `
  String get receiptID {
    return Intl.message(
      'Receipt ID: ',
      name: 'receiptID',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR Code`
  String get scanQRCode {
    return Intl.message(
      'Scan QR Code',
      name: 'scanQRCode',
      desc: '',
      args: [],
    );
  }

  /// `Allow emails`
  String get allowEmails {
    return Intl.message(
      'Allow emails',
      name: 'allowEmails',
      desc: '',
      args: [],
    );
  }

  /// `Change Union`
  String get changeUnion {
    return Intl.message(
      'Change Union',
      name: 'changeUnion',
      desc: '',
      args: [],
    );
  }

  /// `Local number`
  String get localNumber {
    return Intl.message(
      'Local number',
      name: 'localNumber',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateofbirth {
    return Intl.message(
      'Date of birth',
      name: 'dateofbirth',
      desc: '',
      args: [],
    );
  }

  /// `Submitted on:`
  String get submittedOn {
    return Intl.message(
      'Submitted on:',
      name: 'submittedOn',
      desc: '',
      args: [],
    );
  }

  /// `Click to call`
  String get clickToCall {
    return Intl.message(
      'Click to call',
      name: 'clickToCall',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Union position`
  String get unionPosition {
    return Intl.message(
      'Union position',
      name: 'unionPosition',
      desc: '',
      args: [],
    );
  }

  /// `Personal Email`
  String get personalEmail {
    return Intl.message(
      'Personal Email',
      name: 'personalEmail',
      desc: '',
      args: [],
    );
  }

  /// `Share as a link`
  String get shareAsALink {
    return Intl.message(
      'Share as a link',
      name: 'shareAsALink',
      desc: '',
      args: [],
    );
  }

  /// `Back to profile`
  String get backToProfile {
    return Intl.message(
      'Back to profile',
      name: 'backToProfile',
      desc: '',
      args: [],
    );
  }

  /// `Last updated on:`
  String get lastUpdatedOn {
    return Intl.message(
      'Last updated on:',
      name: 'lastUpdatedOn',
      desc: '',
      args: [],
    );
  }

  /// `Grievance topic`
  String get grievancetopic {
    return Intl.message(
      'Grievance topic',
      name: 'grievancetopic',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changepassword {
    return Intl.message(
      'Change password',
      name: 'changepassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get repeatpassword {
    return Intl.message(
      'Repeat password',
      name: 'repeatpassword',
      desc: '',
      args: [],
    );
  }

  /// `Allow call drops`
  String get allowCallDrops {
    return Intl.message(
      'Allow call drops',
      name: 'allowCallDrops',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get enteryourEmail {
    return Intl.message(
      'Enter your Email',
      name: 'enteryourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Employment status`
  String get employmentStatus {
    return Intl.message(
      'Employment status',
      name: 'employmentStatus',
      desc: '',
      args: [],
    );
  }

  /// `Find My Union Local`
  String get findMyUnionLocal {
    return Intl.message(
      'Find My Union Local',
      name: 'findMyUnionLocal',
      desc: '',
      args: [],
    );
  }

  /// `Your receipt ID is:`
  String get yourReceiptIDIs {
    return Intl.message(
      'Your receipt ID is:',
      name: 'yourReceiptIDIs',
      desc: '',
      args: [],
    );
  }

  /// `Repeat new password`
  String get repeatnewpassword {
    return Intl.message(
      'Repeat new password',
      name: 'repeatnewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Allow text messages`
  String get allowTextMessages {
    return Intl.message(
      'Allow text messages',
      name: 'allowTextMessages',
      desc: '',
      args: [],
    );
  }

  /// `Union Notifications`
  String get unionNotifications {
    return Intl.message(
      'Union Notifications',
      name: 'unionNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Log into your account`
  String get logintoyouraccount {
    return Intl.message(
      'Log into your account',
      name: 'logintoyouraccount',
      desc: '',
      args: [],
    );
  }

  /// `Request password reset`
  String get requestpasswordreset {
    return Intl.message(
      'Request password reset',
      name: 'requestpasswordreset',
      desc: '',
      args: [],
    );
  }

  /// `Allow push notifications`
  String get allowPushNotifications {
    return Intl.message(
      'Allow push notifications',
      name: 'allowPushNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Allow registration emails`
  String get allowRegistrationEmails {
    return Intl.message(
      'Allow registration emails',
      name: 'allowRegistrationEmails',
      desc: '',
      args: [],
    );
  }

  /// `Sign up to join your Union community`
  String get signuptojoinyourUnioncommunity {
    return Intl.message(
      'Sign up to join your Union community',
      name: 'signuptojoinyourUnioncommunity',
      desc: '',
      args: [],
    );
  }

  /// `If you don’t have an account you can sign up `
  String get ifyoudonthaveanaccountyoucansignup {
    return Intl.message(
      'If you don’t have an account you can sign up ',
      name: 'ifyoudonthaveanaccountyoucansignup',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
