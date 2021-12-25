import 'package:flutter/material.dart';
import 'package:liveeasy_flutter/constants.dart';
import 'package:liveeasy_flutter/phone.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String lang = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/img.png'),
                height: 56,
                width: 56,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: Text(
                  'Please select your Language',
                  style: kHeadingText,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'You can change the language\n at any time',
                  textAlign: TextAlign.center,
                  style: kSubHeadingText,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: 216,
                child: DropdownButtonFormField(
                    value: lang,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                    ),
                    items: dropdownItems(),
                    onChanged: (String? value) {
                      setState(() {
                        lang = value!;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Container(
                  height: 48,
                  width: 216,
                  color: const Color(0xff2E3B62),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhoneNumber()));
                    },
                    child: const Text(
                      'NEXT',
                      style: kbuttonText,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> dropdownItems() {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
          child: Text('English', style: kdropTextStyle), value: 'English'),
      DropdownMenuItem(
          child: Text('Hindi', style: kdropTextStyle), value: 'Hindi'),
      DropdownMenuItem(
          child: Text('Telugu', style: kdropTextStyle), value: 'Telugu'),
      DropdownMenuItem(
          child: Text('Tamil', style: kdropTextStyle), value: 'Tamil'),
    ];
    return menuItems;
  }
}
