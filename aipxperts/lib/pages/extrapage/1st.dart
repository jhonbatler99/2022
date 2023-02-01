// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_demo/pages/Ui_pages.dart/login_page.dart';
import 'package:test_demo/pages/Ui_pages.dart/signup.dart';

// ignore: camel_case_types
class mainhomepage extends StatefulWidget {
  const mainhomepage({Key? key}) : super(key: key);

  @override
  State<mainhomepage> createState() => _mainhomepageState();
}

String displayname = '';

@override
void initState() {
  getData();
}

getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    displayname = prefs.getStringList('displayname') as String;
  });
}

void setState(Null Function() param0) {}

class _mainhomepageState extends State<mainhomepage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
    // const number = '+91 9265663621';

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        height: screenHeight / 4,
                        child: Container(
                          color: Colors.transparent,
                        )),

                    // Positioned(
                    //     left: 0,
                    //     right: 0,
                    //     top: screenHeight * 0.1,
                    //     // height: screenHeight * 0.50,
                    //     child: Container(
                    //       margin: EdgeInsets.all(15),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(40),
                    //         color: Colors.redAccent,
                    //       ),
                    //       child: Column(
                    //         children: [
                    //           SizedBox(
                    //             height: screenHeight * 0.4,
                    //           ),

                    //           Column(
                    //             children: const [],
                    //           ),
                    //           // TextButton(
                    //           //     child: Text('Woolha.com'),
                    //           //     onPressed: () async {
                    //           //       // ignore: deprecated_member_use
                    //           //       launch('tel://$number');
                    //           //     }),
                    //         ],
                    //       ),
                    //     )),
                    Positioned(
                      top: screenHeight * 0.05,
                      left: (screenWidth - 150) * 0.1,
                      right: (screenWidth - 150) * 0.1,
                      height: screenHeight * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // shape: BoxShape.circle,
                            border: Border.all(
                                // color: Colors.transparent,
                                width: 1),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/logo1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: screenHeight * 0.5,
                      left: (screenWidth - 150) * 0.1,
                      right: (screenWidth - 150) * 0.1,
                      height: screenHeight * 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              // color: Colors.white,
                              width: 2),
                          // color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Let's Connect together 👍",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.7,
                      left: (screenWidth - 150) / 16,
                      right: (screenWidth - 150) / 16,
                      height: screenHeight * 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              // color: Colors.black,
                              width: 1),
                          // color: Colors.white,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            child: TextButton(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(LoginPage());
                                })),
                      ),
                    ),

                    // Positioned(
                    //   top: screenHeight * 0.7,
                    //   left: (screenWidth - 150) / 16,
                    //   right: (screenWidth - 150) / 16,
                    //   height: screenHeight * 0.1,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(50),
                    //       border: Border.all(color: Colors.black, width: 1),
                    //       color: Colors.white,
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 25, vertical: 20),
                    //       child: Text(
                    //         textAlign: TextAlign.center,
                    //         "login",
                    //         style: TextStyle(
                    //           fontSize: 30,
                    //           fontWeight: FontWeight.normal,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      top: (screenHeight - 150) / 1,
                      left: (screenWidth - 150) / 16,
                      right: (screenWidth - 150) / 16,
                      height: screenHeight * 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              // color: Colors.black,
                              width: 1),
                          // color: Colors.white,
                        ),
                        child: TextButton(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            onPressed: () {
                              Get.to(signup());
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
