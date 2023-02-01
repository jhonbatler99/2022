// import 'package:flutter/cupertino.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo/pages/Ui_pages.dart/login_page.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../utiles/routes.dart';

// import 'package:flutter/services.dart';

// ignore: unused_import

// ignore: camel_case_types

// ignore: must_be_immutable
class Addproduct extends StatelessWidget {
  // ignore: unused_field
  final String _buttonClick = "click sign in button";

  // ignore: non_constant_identifier_names
  // var fullnamecontroller = TextEditingController(text: "");

  // final emailcontroller = TextEditingController(text: "");

  // final numbercontroller = TextEditingController(text: "");

  // final pwdcontroller = TextEditingController(text: "");

  Addproduct({Key? key}) : super(key: key);

  @override
  // void dispose() {
  //   fullnamecontroller.dispose();
  //   emailcontroller.dispose();
  //   numbercontroller.dispose();
  //   pwdcontroller.dispose();
  // }

  // late SharedPreferences prefs;

  // _saveToShared_Preferences() async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.setString("FullName", fullnamecontroller.text.toString());
  //   prefs.setString("Email", emailcontroller.text.toString());
  //   prefs.setString("Number", numbercontroller.text.toString());
  //   prefs.setString("password", pwdcontroller.text.toString());

  Widget build(BuildContext context) {
    int currentindex = 0;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable

    return Material(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: () {
                Get.to(LoginPage());
              },
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Add Product',
                style: TextStyle(
                  // color: Colors.black,
                  fontSize: 22,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Get.to(LoginPage());
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://n4.sdlcdn.com/imgs/c/u/q/Om-Retailers-1-PVC-Black-SDL479960560-1-fb240.jpg"),
                                fit: BoxFit.fill),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.5k1BMd9JwQo3MaDo5hTzBgHaD-?pid=ImgDet&rs=1"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.Ze7G1_T5Z2YIv9Ndi9GGjwHaJm?pid=ImgDet&rs=1"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        //4th Image of Slider
                        Container(
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP._N07oIUR7vctMAs8zwivfQHaE8?pid=ImgDet&rs=1"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        //5th Image of Slider
                        Container(
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.2JO74W3nDfWiVoOo-V5JEwHaE8?pid=ImgDet&rs=1"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //6th Image of Slider
                        Container(
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP._R4Vx9WUq17tr1L1nsh9VgHaJm?pid=ImgDet&rs=1"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                    // Container(
                    //   height: 150,
                    //   width: 125,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     // shape: BoxShape.circle,
                    //     border: Border.all(color: Colors.deepPurple, width: 2),
                    //     // image: const DecorationImage(
                    //     //   image: AssetImage("assets/images/flag.jpg"),
                    //     //   fit: BoxFit.fill,
                    //     // ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "product Name",
                        labelText: "Title",
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          // color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username can not be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // hintText: "Enter Username",
                        labelText: "Price",
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          // color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Price can not be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.1),
                        //     offset: const Offset(0, 8),
                        //   ),
                        // ],
                        border: Border.all(color: Colors.deepPurple),
                        // color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      child: DropdownButton(
                        isExpanded: true,
                        menuMaxHeight: 200,
                        borderRadius: BorderRadius.circular(20),
                        iconSize: 20,
                        // dropdownColor: Colors.white,
                        alignment: Alignment.centerLeft,
                        hint: const Text(
                          'Category',
                          style: TextStyle(
                            // color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        style: const TextStyle(fontSize: 15),
                        // focusColor: Colors.black,
                        items: const [
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "New",
                              style: TextStyle(fontSize: 15),
                            ),

                            value: 1,
                          ),
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "New -Used Like New",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Used - Good",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Used - Not Good",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: 4,
                          ),
                        ],
                        onChanged: (int? value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.1),
                        //     offset: const Offset(0, 8),
                        //   ),
                        // ],
                        border: Border.all(color: Colors.deepPurple),
                        // color: Colors.white,
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: DropdownButton(
                        isExpanded: true,
                        menuMaxHeight: 200,
                        borderRadius: BorderRadius.circular(20),
                        iconSize: 20,
                        // dropdownColor: Colors.white,
                        alignment: Alignment.centerLeft,
                        hint: const Text(
                          'Category                                                        ',
                          style: TextStyle(
                            // color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        // focusColor: Colors.black,
                        items: const [
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Home & Kichen",
                            ),

                            value: 1,
                          ),
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Tools",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Furniture",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Household",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Garden",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(
                              "Appliances",
                              style: TextStyle(fontSize: 15),
                            ),
                            value: 6,
                          ),
                        ],
                        onChanged: (int? value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Description",
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          // color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Descrition is required";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      maxLength: 500,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "surat",
                        labelText: "Location",
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          // color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Price can not be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // ignore: avoid_unnecessary_containers
                    ElevatedButton(
                      onPressed: () {
                        // ignore: unused_label
                        validator:
                        (value) {
                          if (value!.isEmpty) {
                            return "fill The Deatils";
                          }
                          return null;
                        };
                        Get.to(HomePagedemo());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      // howCheckedModeBanner: false,
      // title: "setting ",
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
