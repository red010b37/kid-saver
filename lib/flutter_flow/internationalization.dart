import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'es'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // OBGetStarted
  {
    'hrpahv4d': {
      'en': 'Welcome ',
      'es': '',
    },
    'bp6xogfd': {
      'en': 'Lets get kids better with money',
      'es': '',
    },
    'ce1on9s4': {
      'en': 'Get  started',
      'es': '',
    },
    '2mj08hgs': {
      'en': 'or',
      'es': '',
    },
    '3dwt2j52': {
      'en': 'Login',
      'es': '',
    },
    '770rdimx': {
      'en': 'Home',
      'es': '',
    },
  },
  // OBName
  {
    'bwyi4rdv': {
      'en': 'What is your name?',
      'es': '',
    },
    '2kkjs4e9': {
      'en': ' name',
      'es': '',
    },
    'mug9zpxl': {
      'en': 'Next',
      'es': '',
    },
    'molwzwv2': {
      'en': 'Home',
      'es': '',
    },
  },
  // OBDisplayName
  {
    '0ojs2qtd': {
      'en': 'What do your kids call you?',
      'es': '',
    },
    '3ig7zgia': {
      'en': ' Mum, Dad, something else ',
      'es': '',
    },
    'voywrnfd': {
      'en': 'Next',
      'es': '',
    },
    '62vca2nu': {
      'en': 'Home',
      'es': '',
    },
  },
  // OBProfileImage
  {
    '5r4syr5l': {
      'en': 'How you look',
      'es': '',
    },
    '7wxoa96g': {
      'en': 'Upload a photo or use on of ours avatars',
      'es': '',
    },
    'rdf4bqal': {
      'en': 'or',
      'es': '',
    },
    'et6n6ovt': {
      'en': 'Select Avatar',
      'es': '',
    },
    'q2wjm2gk': {
      'en': 'Next',
      'es': '',
    },
    'hzuacdu7': {
      'en': 'Home',
      'es': '',
    },
  },
  // KidsList
  {
    'a6wbqej8': {
      'en': 'Who are you?',
      'es': '',
    },
    '9n9va2ll': {
      'en': 'Home',
      'es': '',
    },
  },
  // GuardianDashboard
  {
    'at3d1bzq': {
      'en': 'Hi',
      'es': '',
    },
    '6342htm6': {
      'en': '...',
      'es': '',
    },
    'h8ww4h4p': {
      'en': 'Spendable',
      'es': '',
    },
    'uek72y0t': {
      'en': 'Total',
      'es': '',
    },
    '6bmtdc6z': {
      'en': '+',
      'es': '',
    },
    'gseta2r4': {
      'en': '-',
      'es': '',
    },
    'y8oj8558': {
      'en': 'Home',
      'es': '',
    },
  },
  // CreateChild
  {
    '29d65kyd': {
      'en': 'Add Child',
      'es': '',
    },
    'o0k2r7xx': {
      'en': 'Upload image or select one of ours',
      'es': '',
    },
    '7g4kot2w': {
      'en': 'Select Avatar',
      'es': '',
    },
    'x6f8252l': {
      'en': 'Child Name',
      'es': '',
    },
    'z0hlkdog': {
      'en': 'Boy',
      'es': '',
    },
    '2w2a9rti': {
      'en': 'Girl',
      'es': '',
    },
    'haia0n7n': {
      'en': 'Cancel',
      'es': '',
    },
    'o4sm4tkz': {
      'en': 'Add',
      'es': '',
    },
    'gmb2blui': {
      'en': 'Home',
      'es': '',
    },
  },
  // ChildDashboard
  {
    'wck5933t': {
      'en': 'Total',
      'es': '',
    },
    '7rsaom52': {
      'en': 'Home',
      'es': '',
    },
  },
  // GuardianSettings
  {
    'uyaihqvu': {
      'en': '[User Name Here]',
      'es': '',
    },
    '95sgr508': {
      'en': 'User.name@domainname.com',
      'es': '',
    },
    '7cnnah7z': {
      'en': 'Account Settings',
      'es': '',
    },
    'em04mibj': {
      'en': 'Order History',
      'es': '',
    },
    'u9w7mwng': {
      'en': 'Settings',
      'es': '',
    },
    'cyjxdfow': {
      'en': 'Notifications',
      'es': '',
    },
    'ufw73v70': {
      'en': 'Change Password',
      'es': '',
    },
    'uabrq9uj': {
      'en': 'Log Out',
      'es': '',
    },
    '57gje7s2': {
      'en': 'Home',
      'es': '',
    },
  },
  // OBEmailPassword
  {
    'yhd74dvm': {
      'en': 'Login  Details',
      'es': '',
    },
    '22a8c00b': {
      'en': 'Enter email and password so you can log back in.',
      'es': '',
    },
    'ww0vcul7': {
      'en': 'Email  address',
      'es': '',
    },
    'griroaj5': {
      'en': 'Enter Password',
      'es': '',
    },
    '5pt1b1yf': {
      'en': 'Lets GO!',
      'es': '',
    },
    'yjv2wna1': {
      'en': 'Home',
      'es': '',
    },
  },
  // CreateSpendableBucket
  {
    'kyyh14re': {
      'en': 'Bucket Color',
      'es': '',
    },
    '4ayfhuxu': {
      'en': 'Name',
      'es': '',
    },
    'z6y4h6ip': {
      'en': 'Description',
      'es': '',
    },
    'n58dqvs6': {
      'en': 'Create',
      'es': '',
    },
    'c6a2nnx2': {
      'en': 'Field is required',
      'es': '',
    },
    'ydep6pk1': {
      'en': 'Field is required',
      'es': '',
    },
    'gti731at': {
      'en': 'Create Spendable Bucket',
      'es': '',
    },
    'b3qjt61d': {
      'en': 'Home',
      'es': '',
    },
  },
  // CreateGoalBucket
  {
    'ma5e5j0b': {
      'en': 'Bucket Color',
      'es': '',
    },
    'pt3wdt5a': {
      'en': 'Name',
      'es': '',
    },
    'cuv1mpl8': {
      'en': 'Description',
      'es': '',
    },
    '9zwdneh9': {
      'en': 'Goal Amount',
      'es': '',
    },
    'hhhwdp3v': {
      'en': 'Create',
      'es': '',
    },
    '1fgee9mz': {
      'en': 'Field is required',
      'es': '',
    },
    'zy8785gt': {
      'en': 'Field is required',
      'es': '',
    },
    'a7iu8l74': {
      'en': 'Create Goal Bucket',
      'es': '',
    },
    'jrkbz2ey': {
      'en': 'Home',
      'es': '',
    },
  },
  // BucketView
  {
    'ohdbck0b': {
      'en': 'Added from Dad ',
      'es': '',
    },
    'e1pzxakq': {
      'en': 'Home',
      'es': '',
    },
  },
  // OnboardingAvatarSelector
  {
    'tsmahe3o': {
      'en': 'Select One',
      'es': '',
    },
  },
  // UserAvatarSelector
  {
    's7csthov': {
      'en': 'Select One',
      'es': '',
    },
  },
  // AddAmountComponent
  {
    'cqf83cuz': {
      'en': 'Add Amount',
      'es': '',
    },
    'qwmkdcil': {
      'en': '0.00',
      'es': '',
    },
    'okvupkbr': {
      'en': 'The amount will be added to each selected  below',
      'es': '',
    },
    '4a50njd3': {
      'en': 'Description (optional)',
      'es': '',
    },
    'hghohgbz': {
      'en': 'Add',
      'es': '',
    },
  },
  // RemoveAmountComponent
  {
    'yeqr46n5': {
      'en': 'Remove Amount',
      'es': '',
    },
    '5ac4rgpe': {
      'en': '0.00',
      'es': '',
    },
    'z6fb0kvl': {
      'en': 'The amount will be added to each selected  below',
      'es': '',
    },
    'rxnddnmj': {
      'en': 'Description (optional)',
      'es': '',
    },
    '0o4rrxwl': {
      'en': 'Remove',
      'es': '',
    },
  },
  // KidsListEmpty
  {
    'yxiv934b': {
      'en': 'Use  the button below to add  your fisrt child',
      'es': '',
    },
  },
  // KidsAddBucketTypes
  {
    'gt4wcpuv': {
      'en': 'Spending Bucket',
      'es': '',
    },
    'dy4nn053': {
      'en': 'Goal Bucket',
      'es': '',
    },
    'lj3xek7b': {
      'en': 'Savings Bucket',
      'es': '',
    },
  },
  // Goal
  {
    'rrevur05': {
      'en': 'Bike',
      'es': '',
    },
    '2022gpgj': {
      'en': 'of \$4000',
      'es': '',
    },
  },
  // BucketViewHeaderTotal
  {
    '2ze5ewya': {
      'en': 'Total',
      'es': '',
    },
  },
  // Miscellaneous
  {
    '5t9h3md1': {
      'en': '',
      'es': '',
    },
    '9u70to2l': {
      'en': '',
      'es': '',
    },
    'pixdp50o': {
      'en': '',
      'es': '',
    },
    'y87a7yoi': {
      'en': '',
      'es': '',
    },
    '4tuntdo9': {
      'en': '',
      'es': '',
    },
    'kgz7m67y': {
      'en': '',
      'es': '',
    },
    'oym6q6in': {
      'en': '',
      'es': '',
    },
    'b4kr6xdd': {
      'en': '',
      'es': '',
    },
    'fmaz560m': {
      'en': '',
      'es': '',
    },
    'hj91twvl': {
      'en': '',
      'es': '',
    },
    'x06vyzpq': {
      'en': '',
      'es': '',
    },
    '6m75q3aa': {
      'en': '',
      'es': '',
    },
    'k9gavmx1': {
      'en': '',
      'es': '',
    },
    'vm3bw18y': {
      'en': '',
      'es': '',
    },
    'swnd3crm': {
      'en': '',
      'es': '',
    },
    'cp4le0dx': {
      'en': '',
      'es': '',
    },
    'sxjf3kbl': {
      'en': '',
      'es': '',
    },
    '8ejp8vvo': {
      'en': '',
      'es': '',
    },
    'kodkqmfd': {
      'en': '',
      'es': '',
    },
    'yoevvns8': {
      'en': '',
      'es': '',
    },
    '78nmvk28': {
      'en': '',
      'es': '',
    },
    'i7fo0j22': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
