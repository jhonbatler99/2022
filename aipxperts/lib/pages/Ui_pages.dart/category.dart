import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';

class category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.black26,
        centerTitle: true,
        title: const Text(
          'Category',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.black,
          ),
          onPressed: () {
            Get.to(HomePagedemo());
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              // color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 6,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: Colors.red,
                // unselectedBackgroundColor: Colors.grey[300],
                // unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.home,
                    ),
                    text: "Home",
                  ),
                  Tab(
                    icon: Icon(Icons.kitchen),
                    text: "Kichen",
                  ),
                  Tab(
                    icon: Icon(Icons.smart_toy_sharp),
                    text: "Toys",
                  ),
                  Tab(
                    icon: Icon(Icons.book_outlined),
                    text: "Books",
                  ),
                  Tab(
                    icon: Icon(Icons.bathroom),
                    text: "Bathroom accessories",
                  ),
                  Tab(
                    icon: Icon(Icons.garage),
                    text: "Tools",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.network(
                                  'https://www.bing.com/th?id=OIP.3IXPDixlr9qLZ90wRnkJFQHaHa&w=176&h=170&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Image.network(
                                width: 350,
                                'https://th.bing.com/th/id/OIP.L5gkOPFVaxMF5tgsaIOP1gHaEK?pid=ImgDet&rs=1',
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: Column(
                          children: [
                            Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/515FoYNfDfS._SX522_.jpg'),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Image.network(
                          'https://cdn.shopclues.com/images/detailed/78561/123812984_SkateBlue_1500382126.jpg'),
                    ),
                    Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/510c7Dh4qRL._AC_US1000_.jpg'),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Image.network(
                              'https://th.bing.com/th/id/OIP.UKr_5zttSsvdupMlddqbGwHaHa?w=210&h=210&c=7&r=0&o=5&pid=1.7'),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Image.network(
                              'https://th.bing.com/th/id/OIP.OgQusWNiHpZRYVVBX8zSdwHaK6?pid=ImgDet&rs=1'),
                        ],
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
