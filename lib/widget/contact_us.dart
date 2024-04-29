import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pfe/config/constants.dart';
import 'package:pfe/widget/custom_buttom.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});
  static const String routeName = '/basket';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
//Theme.of(context).backgroundColor,
        appBar: AppBar(
          //backgroundColor: Theme.of(context).primaryColor,
          //elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 21, 38, 229),
          title: Text('Contact us',
              style: kEncodeSansBold.copyWith(color: kBlackColor)),
        ),

        //*
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 500.h,
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white),
                  child: Card(
                    child: ListTile(
                      title: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text:
                                      ' -- You can contact us via our online website or call us on the number below: ',
                                  style: kEncodeSansBold.copyWith(
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: ' https://www.iconconcept.com ',
                                      style: kEncodeSansBold.copyWith(
                                          color: const Color.fromARGB(
                                              255, 126, 30, 30)),
                                    ),
                                    TextSpan(
                                      text:
                                          '                                                                 Email: ',
                                      style: kEncodeSansBold.copyWith(
                                          color: const Color.fromARGB(
                                              255, 5, 4, 4)),
                                    ),
                                    TextSpan(
                                      text: ' info@iconconcept.com ',
                                      style: kEncodeSansBold.copyWith(
                                          color: const Color.fromARGB(
                                              255, 126, 30, 30)),
                                    ),
                                    TextSpan(
                                      text:
                                          '                             WhatsApp: ',
                                      style: kEncodeSansBold.copyWith(
                                          color: const Color.fromARGB(
                                              255, 11, 9, 9)),
                                    ),
                                    TextSpan(
                                      text: ' (+216) 52 241 833 ',
                                      style: kEncodeSansBold.copyWith(
                                          color: const Color.fromARGB(
                                              255, 126, 30, 30)),
                                    )
                                  ]),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Image.asset(
                              "assets/images/loc.jpg",
                              height: 400,
                              width: 562,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomButton(
                    title: 'Go back',
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
