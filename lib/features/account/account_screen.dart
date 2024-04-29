import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pfe/classes/language.dart';
import 'package:pfe/config/constants.dart';

import '../../translations/locale_keys.g.dart';
import 'components/body.dart';

class AccountScreen extends StatefulWidget {
  static const String routeName = '/account';

  const AccountScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AccountScreen(),
    );
  }

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language? language) async {
    await context.setLocale(Locale(language!.languageCode));

    //Locale _locale = await setLocale(language!.languageCode);
    //  MyApp.setLocale(context, _locale);
  }

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 38, 229),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          LocaleKeys.myaccount.tr(),
          style: kEncodeSansBold.copyWith(color: Colors.black, fontSize: 15.sp),
        ),
        actions: <Widget>[
          Row(
            children: [
              //  Expanded(flex: 2, child: Text(LocaleKeys.language.tr())),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<Language>(
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.black,
                  ),
                  onChanged: (Language? language) {
                    _changeLanguage(language);
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                e.flag,
                                style: TextStyle(fontSize: 30.sp),
                              ),
                              Text(e.name)
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Body(),
    );
  }
}
