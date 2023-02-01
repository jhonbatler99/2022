// ignore_for_file: prefer_const_constructors

// ignore: avoid_web_libraries_in_flutter

// ignore: unused_import

// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';

// ignore: camel_case_types
class forgetpwd extends StatefulWidget {
  const forgetpwd({Key? key}) : super(key: key);

  @override
  State<forgetpwd> createState() => _LoginPageState();
}

class _LoginPageState extends State<forgetpwd> {
  TextEditingController pwdcontroller = TextEditingController(text: "");
  TextEditingController cnfpwd = TextEditingController(text: "");
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  get prefixIcon => null;
  bool ishiddenpassword = true;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;
  get confirmpassword => null;

  bool validatePassword(String pass) {
    String _password = pass.trim();

    if (_password.isEmpty) {
      setState(() {
        password_strength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        password_strength = 1 / 4;
      });
    } else if (_password.length < 8) {
      setState(() {
        password_strength = 2 / 4;
      });
    } else {
      if (pass_valid.hasMatch(_password)) {
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  movetoHome(BuildContext context) async {
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Get.to(HomePagedemo());
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 700,
        // height: Get.height,
        // width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://th.bing.com/th/id/R.2bf0158b789c0d7f2bd66a3ec3f76488?rik=4gxDZrVISRZeAg&riu=http%3a%2f%2f3.bp.blogspot.com%2f-1SYrbxJsLiI%2fUh9yksZGFvI%2fAAAAAAAAHCQ%2fi41Qndj_YIs%2fs1600%2fPhoto-Background-Application.jpg&ehk=zmxcqeaoAc21%2bczrHEqfYuNZB%2fS9g6e9XU%2bu8IFu39U%3d&risl=&pid=ImgRaw&r=0"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Lottie.network(
                      "https://assets5.lottiefiles.com/packages/lf20_iwyr6aqu.json",
                      height: 250,
                      alignment: Alignment.center),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Forget Password",
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white24,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              cursorColor: Colors.black,
                              controller: pwdcontroller,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.green),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                prefixIcon: prefixIcon ??
                                    Icon(
                                      Icons.person,
                                      color: Colors.black38,
                                    ),
                                hintText: "NewPasword",
                                hintStyle: TextStyle(
                                  color: Colors.black38,
                                ),
                                labelText: "Enter New Pasword",
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                } else {
                                  //call function to check password
                                  bool result = validatePassword(value);
                                  if (result) {
                                    // create account event
                                    return null;
                                  } else {
                                    return " Password should contain Capital, small letter & Number & Special";
                                  }
                                }
                              },
                              // onChanged: (value) {
                              //   name = value;
                              //   setState(() {});
                              // },
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              controller: cnfpwd,
                              obscureText: ishiddenpassword,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.green),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.lightGreen),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                prefixIcon: prefixIcon ??
                                    Icon(
                                      Icons.lock,
                                      color: Colors.black38,
                                    ),
                                hintText: "Confirm Password ",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Confirm New Password",
                                labelStyle: TextStyle(
                                  color: Colors.black38,
                                ),
                                suffixIcon: IconButton(
                                  color: Colors.black38,
                                  onPressed: () {
                                    setState(() {
                                      ishiddenpassword = !ishiddenpassword;
                                    });
                                  },
                                  icon: Icon(ishiddenpassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "Password can not be empty";
                              //   } else if (pwdcontroller.text != cnfpwd.text) {
                              //     return "Password don't match Please Re-entered Password";
                              //   }

                              //   return null;
                              // },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                } else if (pwdcontroller.text != cnfpwd.text) {
                                  //call function to check password
                                  bool result = validatePassword(value);
                                  if (result) {
                                    // create account event
                                    return "pwd does not match";
                                  } else {
                                    return "Password don't match Please Re-entered Password";
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  setState(() async {
                                    Get.to(HomePagedemo());

                                    Get.snackbar(
                                        "Password", "Changes Successfully",
                                        colorText: Colors.white,
                                        backgroundColor: Colors.black38,
                                        borderRadius: 50,
                                        padding: EdgeInsets.all(20),
                                        margin: EdgeInsets.all(20));
                                  });
                                }

                                // else if (_showSavedValue()) {
                                //   return;
                                // }
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(
                                          changebutton ? 50 : 8)),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     InkWell(
                            //       onTap: () {
                            //         Navigator.pushNamed(
                            //             context, MyRoutes.forgetpwd);
                            //       },
                            //       child: Text(
                            //         "Don't have an account ?",
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(
                            //           fontSize: 18,
                            //           color: Colors.deepPurple,
                            //           fontWeight: FontWeight.normal,
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 6.0,
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         Navigator.pushNamed(context, MyRoutes.signup);
                            //       },
                            //       child: Text(
                            //         "Signup",
                            //         textAlign: TextAlign.right,
                            //         style: TextStyle(
                            //           fontSize: 18,
                            //           color: Colors.deepPurple,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
