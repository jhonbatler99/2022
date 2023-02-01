// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';

// // ignore: depend_on_referenced_packages

// class Aboutus extends StatefulWidget {
//   const Aboutus({Key? key}) : super(key: key);

//   @override
//   _Aboutus createState() => _Aboutus();
// }

// class _Aboutus extends State<Aboutus> {
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     // ignore: unused_local_variable
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Center(
//         child: Lottie.network(
//             'https://assets5.lottiefiles.com/private_files/lf30_y9czxcb9.json',
//             height: 10),
//       ),
//     );
//   }
// }

// class Lottie {
//   static network(String s, {required int height}) {}
// }

// ignore_for_file: prefer_const_constructors
// import 'package:cupertino_icons/cupertino_icons.dart';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
    // const number = '+91 9265663621';

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        leadingWidth: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        leading: IconButton(
          iconSize: 18,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Get.to(HomePagedemo());
          },
        ),
        title: Text(
          'Aboutus',
          style: TextStyle(
            fontSize: 20,
            // color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(20),
                    height: 200,
                    width: 550,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      // color: Colors.white38,
                    ),
                    padding: const EdgeInsets.all(5),

                    // ignore: sort_child_properties_last
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color.fromARGB(255, 167, 180, 192),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://th.bing.com/th/id/R.f45caa34cc541a0800cfbcaa90d31733?rik=YCRfxlDTNTEHzg&riu=http%3a%2f%2fwww.bigbxl.com%2fwp-content%2fuploads%2f2019%2f02%2fAbout-Us1.jpg&ehk=O%2fZacm8GJ%2bwy1Fh5SaWTov1AXM1MEuyjatGLlfFMgoI%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 180,
                            width: 150,
                            padding: EdgeInsets.all(5),
                            margin: const EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.oYvrkKC4k9h55k3aHcFnpQHaFj?w=274&h=205&c=7&r=0&o=5&dpr=1.12&pid=1.7"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            padding: EdgeInsets.all(5),
                            margin: const EdgeInsets.all(1.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://th.bing.com/th/id/OIP.oYvrkKC4k9h55k3aHcFnpQHaFj?w=274&h=205&c=7&r=0&o=5&dpr=1.12&pid=1.7"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25)),
                                  color: Colors.red[100],
                                ),
                                padding: EdgeInsets.all(20),
                                height: 150,
                                width: 550,
                                alignment: Alignment.center,
                                child: Text(
                                  "We are Very Happy To Provide our service to You",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25)),
                                  color: Colors.blue[100],
                                ),
                                padding: EdgeInsets.all(20),
                                height: 150,
                                width: 550,
                                alignment: Alignment.center,
                                child: Text(
                                  "A remarkable About page is genuine, approachable, and distinguished. It should give the visitor a glimpse into what working with you and your business might be like. You can include personal interests, stories, and photos that convey the unique story of your business.",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25)),
                                  color: Color.fromARGB(255, 169, 134, 138),
                                ),
                                padding: EdgeInsets.all(20),
                                height: 150,
                                width: 550,
                                alignment: Alignment.center,
                                child: Text(
                                  "Contact Us : Mind Your Own Bussines",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
