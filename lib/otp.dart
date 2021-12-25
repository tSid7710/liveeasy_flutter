import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveeasy_flutter/constants.dart';
import 'package:liveeasy_flutter/profile.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({Key? key, required this.phone}) : super(key: key);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? _verficationID;
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
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Center(
                    child: Text(
                      'Verify Phone',
                      style: kHeadingText,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Center(
                    child: Text(
                      'Code is sent to ${widget.phone}',
                      textAlign: TextAlign.center,
                      style: kSubHeadingText,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  otpField(),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Didn\’t receive the code?',
                        style: kSubHeadingText,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Request Again',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    color: const Color(0xff2E3B62),
                    child: TextButton(
                      onPressed: () async {
                        try {
                          final newUser = await _auth.signInWithCredential(
                            PhoneAuthProvider.credential(
                              verificationId: _verficationID!,
                              smsCode: otp!,
                            ),
                          );
                          if (newUser != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfilePage()));
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Text(
                        'VERIFY AND CONTINUE',
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

  String? otp;
  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 54,
      outlineBorderRadius: 0,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: const Color(0xff93D2F3),
      ),
      style: const TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {
        otp = pin;
        print("Completed: " + pin);
      },
      onChanged: (pin) {
        if (pin.length == 6) {
          print(pin);
        }
      },
    );
  }

  final _auth = FirebaseAuth.instance;
  Future<void> verifyPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91 ${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          final user = _auth.signInWithCredential(credential);
          if (user != null) {
            print('User Logged In');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, int? forceResendingtoken) {
          setState(() {
            _verficationID = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verficationID = verificationID;
          });
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }
}
