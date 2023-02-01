// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Beautiful Drawer Widget',
        home: homePage());
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return DrawerWidget();
  }
}

class DrawerWidget extends StatelessWidget {
  List<String> categories = [
    'Home',
    'Featured Posts',
    'Recent Posts',
    'Saved Posts',
    'Terms & Conditions',
    'Logout'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.black54),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey,
          child: Column(
            children: [
              Container(
                height: 200,

                width: double.infinity,

                // color: Colors.black,

                child: Stack(children: [
                  Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(.8),
                                  BlendMode.darken),
                              fit: BoxFit.cover,
                              image: const AssetImage('assets/pic1.jpg')),
                          color: Colors.grey.shade900,
                          boxShadow: const [BoxShadow(blurRadius: 15)],
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(150))),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              'Zeeshi Wazir',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Text(
                            'zeerockyf5@gmail.com',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 9),
                          )
                        ],
                      )),
                  Positioned(
                    bottom: 0,
                    left: 50,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: const AssetImage('assets/pic1.jpg')),
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            boxShadow: [
                              const BoxShadow(
                                  blurRadius: 7, offset: const Offset(0, 3))
                            ],
                          )),
                    ),
                  )
                ]),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 30),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,

                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Colors.grey.shade900,
                            boxShadow: [const BoxShadow(blurRadius: 4)]),

                        // width: 150,

                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),

                        alignment: Alignment.center,

                        child: Text(
                          categories[index],
                          style: const TextStyle(
                              fontSize: 12.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
