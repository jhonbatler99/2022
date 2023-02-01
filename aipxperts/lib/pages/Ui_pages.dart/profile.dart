// ignore_for_file: prefer_const_constructors
// import 'package:cupertino_icons/cupertino_icons.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo/controller/shopping_controller.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
    // const number = '+91 9265663621';
    final controller = Get.put(Shopping_controller());

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
                          color: Colors.orange,
                        )),
                    Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: AppBar(
                          leading: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Get.to(HomePagedemo());
                            },
                          ),
                          actions: [
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            )
                          ],
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        )),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: screenHeight * 0.2,
                      // height: screenHeight * 0.50,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          // color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Text(
                              'Aipxperts Private Limited'.tr,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() => Text(controller.myname.value)),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: const [
                                TextField(
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.phone),
                                    hintText: "+91 9265663621",
                                    hintStyle: TextStyle(
                                        // color: Colors.black,
                                        ),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 20),
                                  ),
                                ),
                              ],
                            ),
                            // TextButton(
                            //     child: Text('Woolha.com'),
                            //     onPressed: () async {
                            //       // ignore: deprecated_member_use
                            //       launch('tel://$number');
                            //     }),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.mail),
                                hintText: "sutariyatushark@gmail.com",
                                hintStyle: TextStyle(
                                    // color: Colors.black,
                                    ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_city),
                                hintText: "Surat",
                                hintStyle: TextStyle(
                                    // color: Colors.black,
                                    ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.17,
                      left: (screenWidth - 150) / 3,
                      right: (screenWidth - 150) / 3,
                      height: screenHeight * 0.17,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/flag.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
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
