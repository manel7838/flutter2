// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "notif": 'اشعارات',
    "help": 'مركز مساعدة',
    "backtohome": 'رجوع للصفحة رئيسية',
    "settings": "الإعدادات",
    "logout": 'خروج',
    "myaccount": 'حسابي',
    "appointement": 'مواعيدي',
    "this_should_be_translated": "يجب ترجمة هذا إلى العربية!",
    "myprofil": "الملف الشخصي",
    "name": "اسم",
    "email": "البريد الإلكتروني",
    "personalInformation": "معلومات شخصية",
    "country": 'بلاد',
    "zip": 'ترقيم بريدي',
    "city": 'مدينة',
    "adress": 'عنوان',
    "language": "تغيير اللغة",
    "cart": "سلة",
    "checkout": "استخلاص",
    "add to cart": "اضف الى السلة",
    "customer information": "معلومات المستخدم",
  };
  static const Map<String, dynamic> en = {
    "language": "Change Language",
    "country": 'Country',
    "zip": 'Code Zip',
    "adress": 'Adress',
    "city": 'City',
    "personalInformation": " Personal information",
    "name": "Name",
    "email": "Email",
    "notif": "Notifications",
    "help": "Help center",
    "myprofil": "My Profil",
    "settings": "Settings",
    "logout": 'Log_out',
    "myaccount": "My Account",
    "appointement": 'My appointments',
    "backtohome": 'Back to home',
    "cart": "cart",
    "checkout": "checkout",
    "customer information": "customer information",
    "add to cart": "add to cart",
    "this_should_be_translated": "This should be translated to Arabic!"
  };
  static const Map<String, dynamic> fr = {
    "language": "Changer la Langue",
    "country": 'Pays',
    "zip": 'Code Zip',
    "adress": 'Adresse',
    "city": 'Ville',
    "personalInformation": " Informations personnelles ",
    "name": "Nom",
    "email": "Email",
    "myprofil": "Mon Profil",
    "notif": "Notifications",
    "help": "Centre d'aide",
    "backtohome": 'accueil',
    "settings": "Parametres",
    "logout": 'Quitter',
    "myaccount": "Mon Compte",
    "appointement": 'Mes rendez-vous',
    "cart": "panier",
    "checkout": "payer",
    "customer information": "Information d'utilisateur",
    "add to cart": "ajouter au panier",
    "this_should_be_translated": "This should be translated to Arabic!"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en,
    "fr": fr
  };
}
