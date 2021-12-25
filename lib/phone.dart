import 'package:flutter/material.dart';
import 'package:liveeasy_flutter/constants.dart';
import 'package:liveeasy_flutter/otp.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    iconSize: 30.0,
                    alignment: Alignment.topLeft,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Center(
                    child: Text(
                      'Please enter your mobile number',
                      style: kHeadingText,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Center(
                    child: Text(
                      'You’ll receive a 6 digit code\nto verify next.',
                      textAlign: TextAlign.center,
                      style: kSubHeadingText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage('assets/img_2.png'),
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            '+91',
                            style: kHeadingText,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            '-',
                            style: kHeadingText,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(fontSize: 18),
                                contentPadding:
                                    EdgeInsets.only(top: 7, bottom: 7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    color: const Color(0xff2E3B62),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OtpScreen(phone: phoneController.text)));
                      },
                      child: const Text(
                        'CONTINUE',
                        style: kbuttonText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
