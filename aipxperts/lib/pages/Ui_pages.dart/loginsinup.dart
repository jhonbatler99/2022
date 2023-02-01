import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:test_demo/pages/Ui_pages.dart/login_page.dart';
import 'package:test_demo/pages/Ui_pages.dart/signup.dart';

// ignore: camel_case_types
class loginsinguppage extends StatelessWidget {
  const loginsinguppage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * .75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_w9bdffcb.json',
              fit: BoxFit.fitWidth,
              width: 300,
              height: 350,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Let's Connect together👍",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 38,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.deepPurple, width: 1.5),
                color: Colors.white,
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 117, 96, 155),
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {
                        Get.to(LoginPage());
                      })),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 75,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.deepPurple, width: 1.5),
                color: Colors.white,
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 120, 98, 158),
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {
                        Get.to(signup());
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
