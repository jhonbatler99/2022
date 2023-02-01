// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:progressive_image/progressive_image.dart';
import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:test_demo/models/cart.dart';
import 'package:test_demo/models/catalog.dart';
import 'package:test_demo/pages/Ui_pages.dart/Addproduct.dart';
import 'package:test_demo/pages/Ui_pages.dart/cart_page_new.dart';
import 'package:test_demo/pages/Ui_pages.dart/category.dart';
import 'package:test_demo/pages/Ui_pages.dart/loginsinup.dart';
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';
import 'package:test_demo/pages/Ui_pages.dart/profile.dart';

import 'package:test_demo/widget/drawer.dart';
// ignore: unused_import
import 'package:test_demo/widget/item_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  bool ishiddenpassword = true;

  final TextEditingController? editTextController = TextEditingController();
  bool swich = true;
  // final keyisfirstloaded = "is_File_loaded";
  final int days = 4;
  final String name = "Hello World";
  int currentindex = 2;
  bool showgridview = false;
  bool showlistvew = false;

  // launchurl start

  final String Realme = 'https://www.realme.com/in/';
  final String Samsung =
      'https://www.samsung.com/in/smartphones/galaxy-z-fold4/?page=home';
  final String Redmi = 'https://www.mi.com/in/';
  final String vivo = 'https://www.vivo.com/in/';
  final String oppo = 'https://www.oppo.com/in/';
  final String iphone = 'https://www.apple.com/in/iphone/';

  //  launchurl end

  // start Method For loaddata From to Json file
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: unused_local_variable
    final catalogjson =
        await rootBundle.loadString("assets/images/files/catalog.JSON");
    final decodeData = jsonDecode(catalogjson);
    // ignore: unused_local_variable
    var productsData = decodeData["products"];
    catalogmodel.Items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  // End Method For loaddata From to Json file

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.grey[200],
      extendBody: false,
      appBar: AppBar(
        titleSpacing: 20.0,
        centerTitle: true,
        toolbarHeight: 50.2,
        leadingWidth: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        elevation: 8.00,
        // backgroundColor: Colors.grey[200],
        actions: [
          InkWell(
            child: IconButton(
              // color: const Color.fromARGB(86, 230, 239, 228),
              onPressed: () {
                // Navigator.pushNamed(context, MyRoutes.CartPageNew);
                Get.to(CartPageNew());
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                // color: Colors.red,
              ),
            ),
          ),
          // InkWell(
          //   child: IconButton(
          //     onPressed: () {
          //       showSearch(
          //         context: context,
          //         delegate: Mysearchdelegate(),
          //       );
          //     },
          //     icon: const Icon(
          //       Icons.search,
          //     ),
          //   ),
          // ),
          IconButton(
            icon: const Icon(
              Icons.sunny,
              color: Colors.white,
              // color: Colors.black,
            ),
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());

              CartPageNew();
            },
          ),
          // Switch(
          //   // inactiveTrackColor: Colors.black45,
          //   // activeTrackColor: Colors.red,
          //   value: showgridview,
          //   onChanged: (value) {
          //     if (value) {
          //       // Navigator.pushNamed(context, MyRoutes.homeRoutes);
          //       Get.put(const homePage());
          //     } else {
          //       // Navigator.pushNamed(context, MyRoutes.HomePagedemo);
          //       Get.to(const HomePagedemo());
          //     }
          //   },
          // ),
        ],
        title: const Text(
          'BuyerZone',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),

          // margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
          // height: 710,
          // width: 500,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)),
            border: Border.all(
                // color: const Color.fromARGB(255, 145, 86, 86),
                width: 0.5),
            // color: Colors.grey[100],
          ),
          child: Padding(
              padding: const EdgeInsets.all(2.0),
              // ignore: unnecessary_null_comparison
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          height: 100,
                          width: 40,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: CarouselSlider(
                              items: [
                                //1st Image of Slider
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://th.bing.com/th/id/R.25fb86e51dd6e2f517b832c19073aa1f?rik=6y4k%2fb88qEjeEw&riu=http%3a%2f%2fs1.picswalls.com%2fwallpapers%2f2017%2f12%2f10%2f4k-photos_110628610_312.jpg&ehk=3ViGu0KbJJTsQvpW119ej67SDoB8hrdFQAUAAI%2b9Bew%3d&risl=1&pid=ImgRaw&r=0"),
                                        fit: BoxFit.cover),
                                  ),
                                ),

                                //2nd Image of Slider
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=600"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                //3rd Image of Slider
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://media.istockphoto.com/photos/fiber-optic-cables-global-data-transfer-background-picture-id1319789172?b=1&k=20&m=1319789172&s=612x612&w=0&h=bWIG4x0c0b2wShZzctoeVdThTcq-TzMUuFnrOKKlBIY="),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                //4th Image of Slider
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://th.bing.com/th/id/OIP.b0Qu5t9c88zyoe7pYGT5hwHaEK?pid=ImgDet&rs=1"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                //5th Image of Slider
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.pexels.com/photos/3183132/pexels-photo-3183132.jpeg?auto=compress&cs=tinysrgb&w=600"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                //6th Image of Slider
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.pexels.com/photos/2387873/pexels-photo-2387873.jpeg?auto=compress&cs=tinysrgb&w=600"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],

                              //Slider Container properties
                              options: CarouselOptions(
                                height: 200.0,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                reverse: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 0.8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "How's Design Look",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          InkWell(
                            child: IconButton(
                              onPressed: () {
                                showSearch(
                                  context: context,
                                  delegate: Mysearchdelegate(),
                                );
                              },
                              icon: const Icon(
                                Icons.search,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),

                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: 125,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(4),
                          children: <Widget>[
                            Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Uri url = Uri.parse(Realme);
                                    if (!await launchUrl(url)) {
                                      return;
                                    }
                                  },
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://th.bing.com/th/id/OIP.AB8hwZPk4daxp-POGdzXcQHaEJ?pid=ImgDet&rs=1',
                                      fit: BoxFit.cover,
                                      height: 70,
                                      width: 75,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Realme',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Uri url = Uri.parse(Samsung);
                                    if (!await launchUrl(url)) {
                                      return;
                                    }
                                  },
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://th.bing.com/th/id/OIP.D1cnrBHBkPg_ngtdeNsv2wHaE8?w=257&h=180&c=7&r=0&o=5&dpr=1.38&pid=1.7',
                                      fit: BoxFit.cover,
                                      height: 70,
                                      width: 75,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Samsung',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Uri url = Uri.parse(Redmi);
                                    if (!await launchUrl(url)) {
                                      return;
                                    }
                                  },
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://th.bing.com/th/id/OIP.rHAqVkHIakjOPkNx6H2NPQHaHi?w=187&h=190&c=7&r=0&o=5&dpr=1.38&pid=1.7',
                                      fit: BoxFit.cover,
                                      height: 70,
                                      width: 75,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Redmi',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Uri url = Uri.parse(vivo);
                                    if (!await launchUrl(url)) {
                                      return;
                                    }
                                  },
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://th.bing.com/th/id/OIP.hasGW_6b9p9q2mxg6itmBgHaH9?w=185&h=199&c=7&r=0&o=5&dpr=1.38&pid=1.7',
                                      fit: BoxFit.cover,
                                      height: 70,
                                      width: 75,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Vivo',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Uri url = Uri.parse(oppo);
                                    if (!await launchUrl(url)) {
                                      return;
                                    }
                                  },
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://th.bing.com/th/id/OIP.UjPJyegUg6dIMcH7T8-gRgHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.38&pid=1.7',
                                      fit: BoxFit.cover,
                                      height: 70,
                                      width: 75,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Oppo',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    Uri url = Uri.parse(iphone);
                                    if (!await launchUrl(url)) {
                                      return;
                                    }
                                  },
                                  child: ClipOval(
                                    child: Image.network(
                                      'https://th.bing.com/th/id/OIP.8In5iOliXeddVBNk4tahEAHaFj?w=224&h=180&c=7&r=0&o=5&dpr=1.38&pid=1.7',
                                      fit: BoxFit.cover,
                                      height: 75,
                                      width: 75,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Iphone',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // middel list type tab bar

                  // // ignore: unnecessary_null_comparison
                  (catalogmodel.Items != null && catalogmodel.Items.isNotEmpty)
                      ? Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GridView.builder(
                              padding: const EdgeInsets.all(10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 8,
                              ),
                              itemBuilder: (context, index) {
                                // ignore: unused_local_variable
                                final item = catalogmodel.Items[index];

                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: GridTile(
                                    header: InkWell(
                                      child: Container(
                                        padding: const EdgeInsets.all(1),
                                        // ignore: sort_child_properties_last
                                        child: Text(
                                          item.name ?? "",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            // color: Colors.white,
                                          ),
                                        ),

                                        decoration: const BoxDecoration(
                                            // color: Colors.black38,
                                            ),
                                      ),
                                    ),

                                    // ignore: sort_child_properties_last
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ProgressiveImage(
                                        blur: 10,
                                        // placeholder: AssetImage('assets/images/car.jpg'),
                                        thumbnail: const NetworkImage(
                                          'https://i0.wp.com/codemyui.com/wp-content/uploads/2017/03/loading-animation.gif',
                                        ), // 64x36
                                        image: NetworkImage(
                                          item.image ?? "",
                                        ),
                                        // 3842x2160
                                        height: 200,
                                        width: 500,
                                        fit: BoxFit.fitHeight,
                                        placeholder: null,
                                      ),
                                    ),

                                    // Image.network(
                                    //   // item.image ?? "",
                                    // ),

                                    footer: Container(
                                      // margin: EdgeInsets.all(5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),

                                      // ignore: sort_child_properties_last
                                      child: Text(
                                        item.price.toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            // color: Colors.black45,
                                            ),
                                      ),

                                      decoration: const BoxDecoration(
                                          // color: Colors.white,
                                          ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: catalogmodel.Items.length,
                            ),
                          ),
                        )
                      : const CircularProgressIndicator()
                          .centered()
                          .py16()
                          .expand(),
                ],
              )),
        ),
      ),

//bottem navigation bar start :-
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        // selectedItemColor: Colors.black,
        currentIndex: currentindex,
        selectedFontSize: 15,
        // backgroundColor: const Color.fromARGB(255, 144, 102, 106),
        iconSize: 25,
        onTap: (index) => setState(
          () => (currentindex = index),
        ),
        items: [
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(category());
                },
                child: const Icon(
                  Icons.grid_view,
                  color: Colors.deepPurple,
                ),
              ),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(const ProfileScreen());
                },
                child: const Icon(
                  Icons.person,
                  color: Colors.green,
                ),
              ),
              label: ' Profile'),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(Addproduct());
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
              ),
              label: 'Add Product'),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Get.to(HomePagedemo());
                  },
                  child: Badge(
                    shape: BadgeShape.circle,
                    position: BadgePosition.topEnd(),
                    borderRadius: BorderRadius.circular(50),
                    // badgeColor: const Color.fromARGB(255, 234, 190, 125),
                    badgeContent: const Text(
                      '2',
                    ),
                    child: const Icon(
                      Icons.chat,
                      color: Color.fromARGB(255, 106, 113, 177),
                    ),
                  )),
              label: ' Chat'),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, MyRoutes.setting);
                  Get.to(loginsinguppage());
                },
                child: const Icon(
                  Icons.settings,
                  color: Colors.redAccent,
                ),
              ),
              label: 'setting'),
        ],
      ),
//bottemnavigation bar end

// flotingactionbutton start
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      floatingActionButton: FloatingActionButton(

          // splashColor: Colors.black45,

          // splashColor: Colors.yellow,

          // isExtended: true,
          // ignore: prefer_const_constructors
          // backgroundColor: Colors.blueGrey,
          onPressed: () async {
            // Navigator.pushNamed(context, MyRoutes.Addproduct);
            Get.to(Addproduct());
          },

          // isExtended: true,
          // ignore: prefer_const_constructors
          child: Icon(Icons.add)),

// flotingactionbutton End
      drawer: MyDrawer(),
    );

    // ignore: dead_code
  }
}

class Listview extends StatelessWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        // ignore: unused_local_variable
        final item = catalogmodel.Items[index];

        return Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(5),
              // ignore: sort_child_properties_last
              child: Text(
                item.name ?? "",
                style: const TextStyle(
                  fontSize: 15,
                  // color: Colors.white,
                ),
              ),

              decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 201, 99, 224),
                  ),
            ),

            // ignore: sort_child_properties_last
            title: ProgressiveImage(
              // placeholder: AssetImage('assets/images/car.jpg'),
              thumbnail: const NetworkImage(
                  'https://i.imgur.com/eOQL4jg.jpg'), // 64x36
              image: NetworkImage(item.image ?? ""), // 3842x2160
              height: 250,
              width: 500,
              fit: BoxFit.fitHeight,
              placeholder: null,
            ),

            // Image.network(
            //   // item.image ?? "",
            // ),
          ),
        );
      },
      itemCount: catalogmodel.Items.length,
    );
  }
}

// class Cataloglist extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: catalogmodel.Items.length,
//       itemBuilder: (context, index) {
//         final catalog = catalogmodel.Items[index];

//         // ignore: missing_required_param
//         return InkWell(
//             onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Homedetailpage(
//                       catalog: catalog,
//                     ),
//                   ),
//                 ),
//             child: CatalogItem(catalog: catalog));
//       },
//     );
//   }
// }

// class CatalogItem extends StatelessWidget {
//   final Item catalog;

//   const CatalogItem({Key? key, required this.catalog})
//       : assert(catalog != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isadded = false;

//     return VxBox(
//       child: Row(
//         children: [
//           Hero(
//             tag: Key(catalog.id.toString()),
//             child: CatalogImage(
//               image: catalog.image ?? "",
//             ),
//           ),
//           Expanded(
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                 const SizedBox(
//                   height: 2,
//                 ),
//                 Text(
//                   catalog.name ?? "",
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     // color: Colors.black38,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   catalog.desc ?? "",
//                   style: const TextStyle(
//                     // backgroundColor: Colors.white30,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     // color: Colors.black45,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ButtonBar(
//                   alignment: MainAxisAlignment.spaceBetween,
//                   buttonPadding: EdgeInsets.zero,
//                   children: [
//                     Text(
//                       "\$${catalog.price.toString()}",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         isadded = isadded.toggle();
//                         final _catalog = catalogmodel();
//                         final _cart = Cartmodel();
//                         _cart.add = (catalog);
//                       },
//                       style: ButtonStyle(
//                           // backgroundColor:
//                           //     MaterialStateProperty.all(Colors.black26),
//                           shape:
//                               MaterialStateProperty.all(const StadiumBorder())),
//                       child: isadded
//                           ? const Icon(Icons.done)
//                           : "Add to Cart".text.make(),
//                     )
//                   ],
//                 )
//               ]))
//         ],
//       ),
//     ).white.roundedLg.square(125).make().py2();
//   }
// }

// class CatalogImage extends StatelessWidget {
//   final String image;
//   const CatalogImage({
//     Key? key,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(image)
//         .box
//         .roundedLg
//         .p8
//         // .color(Colors.white54)
//         .make()
//         .p16()
//         .w32(context);
//   }
// }

// class Mysearchdelegate extends SearchDelegate {
//   List<String> searchresult = [
//     'apple',
//     'bannana',
//     'watermelon',
//     'orange',
//     'mango',
//     'Kivi',
//   ];

//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//         don(
//           onPressed: () {
//             if (query.isEmpty) {
//               close(context, null);
//             } else {
//               query = '';
//             }
//           },
//           icon: const Icon(
//             Icons.clear,
//           ),
//         ),
//       ];

//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: const Icon(
//           Icons.arrow_back,
//         ),
//       );

//   @override
//   Widget buildResults(BuildContext context) => Center(
//         child: Text(
//           query,
//           style: const TextStyle(fontSize: 50, fontWeight: FontWeight.normal),
//         ),
//       );

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = searchresult.where((searchresult) {
//       final result = searchresult.toLowerCase();
//       final input = query.toLowerCase();
//       return result.contains(input);
//     }).toList();

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         // suggestions = suggestions[index] as List<String>;
//         return ListTile(
//           title: Text(suggestions[index]),
//           onTap: () {
//             query = suggestions as String;
//           },
//         );
//       },
//     );
//   }
// }
