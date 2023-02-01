// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo/controller/apihomepage.dart';
import 'package:test_demo/controller/make_new_home.dart';
import 'package:test_demo/controller/shopping_controller.dart';
import 'package:test_demo/pages/Ui_pages.dart/aboutus.dart';
import 'package:test_demo/pages/Ui_pages.dart/homepage.dart';

// import 'package:test_demo/pages/apireleted.dart';
// import 'package:test_demo/pages/extrapage/drawer2.dart';
// import 'package:test_demo/pages/extrapage/drawer2.dart';
// import 'package:test_demo/pages/homepage.dart';
import 'package:test_demo/pages/Ui_pages.dart/login_page.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';
import 'package:test_demo/pages/Ui_pages.dart/profile.dart';
import 'package:test_demo/pages/extrapage/writedata_in_firebase.dart';
// import 'package:test_demo/utiles/routes.dart';

class MyDrawer extends StatefulWidget {
  // final controller = Get.put(loginController());
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  final controller = Get.put(Shopping_controller());
  // void initState() {
  //   // _showSavedValue();
  //   super.initState();
  // }

  // TextEditingController emailcontroller = TextEditingController(text: "");
  // TextEditingController pwdcontroller = TextEditingController(text: "");

  // String name = "";
  // String fullName = "";
  // String email = "";
  // late SharedPreferences prefs;

  // _showSavedValue() async {
  //   var emailcontroller;
  //   emailcontroller.text = email;
  //   var fullnamecontroller;
  //   fullnamecontroller.text = fullName;
  //   // ignore: use_build_context_synchronously
  // }

  // getText2() {
  //   var emailcontroller;
  //   return emailcontroller.text;
  // }

  // getText3() {
  //   var fullnamecontroller;
  //   return fullnamecontroller.text;
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    const imageUrl =
        "https://th.bing.com/th/id/OIP.s_lu4r0t_HFCWOwLoyfpqAHaEo?pid=ImgDet&rs=1";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      margin: const EdgeInsets.only(top: 40, bottom: 10),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(180),
          ),
        ),
        // backgroundColor: Colors.white,
        elevation: 10.0,
        // ignore: avoid_unnecessary_containers
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/06/12/12/41/application-2395468_960_720.png"),
                fit: BoxFit.fitHeight),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(180),
            ),
          ),
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.topRight,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(180),
                    bottomLeft: Radius.circular(20),
                  ),
                  border: Border.all(
                    // color: Colors.white60,
                    width: 1,
                  ),
                ),
                margin: const EdgeInsets.all(20),
                height: 175,
                child: UserAccountsDrawerHeader(
                  // arrowColor: Colors.black,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          // color: Colors.white54,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(4, 4)),
                    ],
                    // image: const DecorationImage(
                    //     image: NetworkImage(
                    //         "https://th.bing.com/th/id/R.2bf0158b789c0d7f2bd66a3ec3f76488?rik=4gxDZrVISRZeAg&riu=http%3a%2f%2f3.bp.blogspot.com%2f-1SYrbxJsLiI%2fUh9yksZGFvI%2fAAAAAAAAHCQ%2fi41Qndj_YIs%2fs1600%2fPhoto-Background-Application.jpg&ehk=zmxcqeaoAc21%2bczrHEqfYuNZB%2fS9g6e9XU%2bu8IFu39U%3d&risl=&pid=ImgRaw&r=0"),
                    //     fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(180),
                      bottomLeft: Radius.circular(20),
                    ),
                    border: Border.all(
                      // color: Colors.white,
                      width: 1,
                    ),
                    // color: Colors.black12,
                  ),

                  currentAccountPictureSize: const Size(100, 70),

                  accountName: Obx(() => Text(
                        controller.myname.value,
                        style: const TextStyle(
                          // color: Colors.black,
                          fontSize: 12,
                        ),
                      )),

                  accountEmail: const Text(
                    "Surat Gujarat",
                    style: TextStyle(
                      // color: Colors.black,
                      fontSize: 12,
                    ),
                  ),

                  currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ), //image.network(imageUrl),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(const HomePage1());
                },
                onLongPress: () {
                  Get.to(apiHomePage());
                },
                leading: const Icon(
                  CupertinoIcons.home,
                  // color: Colors.black,
                ),
                title: const Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      // color: Colors.black,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(const ProfileScreen());
                },
                onLongPress: () {
                  Get.to(writedatapage());
                },
                leading: const Icon(
                  CupertinoIcons.person,
                  // color: Colors.black,
                ),
                title: const Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      // color: Colors.black,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(const Aboutus());
                },
                leading: const Icon(
                  CupertinoIcons.person_2_alt,
                  // color: Colors.black,
                ),
                title: const Text(
                  "About Us",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      // color: Colors.black87,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(const HomePage1());
                },
                onLongPress: () {
                  Get.to(apiHomePage());
                },
                leading: const Icon(
                  CupertinoIcons.mail,
                  // color: Colors.black,
                ),
                title: const Text(
                  "Mail",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      // color: Colors.black,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(const Make_new_home());
                },
                leading: const Icon(
                  CupertinoIcons.settings,
                  // color: Colors.black,
                ),
                title: const Text(
                  "Setting",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      // color: Colors.black,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.defaultDialog(
                    title: 'Are You Sure ',
                    middleText: '🥲 🥲 🥲 🥲 🥲',
                    radius: 30,
                    textConfirm: 'Yes',
                    textCancel: 'No',
                    titlePadding: const EdgeInsets.all(10),
                    // cancel: Text('Sure'),
                    // confirm: Text('No way'),
                    onCancel: () {
                      Get.to(const HomePagedemo());
                    },
                    onConfirm: () {
                      Get.offAll(const LoginPage());
                    },
                    // confirmTextColor: Colors.white,
                    // cancelTextColor: Colors.black,
                    // backgroundColor: Colors.white,
                  );

                  // Get.to(const LoginPage());
                },
                leading: const Icon(
                  CupertinoIcons.right_chevron,
                  // color: Colors.black,
                ),
                title: const Text(
                  "Logout",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      // color: Colors.black,
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
