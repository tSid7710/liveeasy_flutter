import 'package:flutter/material.dart';
import 'package:liveeasy_flutter/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selected = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 88,
              ),
              const Center(
                child: Text(
                  'Please select your profile',
                  style: kHeadingText,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.7,
                      child: Radio(
                        value: 'Shipper',
                        groupValue: selected,
                        activeColor: Colors.black,
                        onChanged: (String? value) {
                          setState(() {
                            selected = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    const Image(
                      image: AssetImage('assets/img_3.png'),
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Shipper',
                            style: kProfileStyle,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet,consectetur,adipiscing',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.7,
                      child: Radio(
                        value: 'Transporter',
                        groupValue: selected,
                        activeColor: Colors.black,
                        onChanged: (String? value) {
                          setState(() {
                            selected = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    const Image(
                      image: AssetImage('assets/img_4.png'),
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Transporter',
                            style: kProfileStyle,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet,consectetur,adipiscing',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                color: const Color(0xff2E3B62),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'CONTINUE',
                    style: kbuttonText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
