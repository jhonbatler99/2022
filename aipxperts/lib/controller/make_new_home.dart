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
import 'package:test_demo/pages/Ui_pages.dart/mail(homepage).dart';
import 'package:test_demo/pages/Ui_pages.dart/profile.dart';
import 'package:test_demo/pages/extrapage/drawer2.dart';
import 'package:test_demo/widget/drawer.dart';
// ignore: unused_import
import 'package:test_demo/widget/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: unused_import
import '../utiles/routes.dart';

class Make_new_home extends StatefulWidget {
  const Make_new_home({Key? key}) : super(key: key);

  @override
  State<Make_new_home> createState() => _HomePageState();
}

class _HomePageState extends State<Make_new_home> {
  bool ishiddenpassword = true;

  final TextEditingController? editTextController = TextEditingController();
  bool swich = true;
  // final keyisfirstloaded = "is_File_loaded";
  final int days = 4;
  final String name = "Hello World";
  int currentindex = 2;
  bool showgridview = false;
  bool showlistvew = false;

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

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;

    // Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        // shrinkWrap: true,
        slivers: [
          SliverAppBar(
            // backgroundColor: Colors.grey,
            floating: true,
            centerTitle: true,
            leadingWidth: 0,
            elevation: 0.0,
            expandedHeight: 125,
            title: const Text(
              'Buyerzone',
              style: TextStyle(
                fontSize: 25,
                // color: Colors.white,
              ),
            ),
            actions: [
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.shopping_cart,
                  // color: Colors.white54,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.sunny,
                  // color: Colors.black,
                ),
                onPressed: () {
                  Get.isDarkMode
                      ? Get.changeTheme(ThemeData.light())
                      : Get.changeTheme(ThemeData.dark());

                  CartPageNew();
                },
              ),
            ],
            flexibleSpace: const FlexibleSpaceBar(
                // background: Image.network(
                //   filterQuality: FilterQuality.low,
                //   fit: BoxFit.fitWidth,
                //   'https://th.bing.com/th/id/R.7a949d5981dd6d3a67a31a874176d67f?rik=4AZlgKnzCr%2bLxQ&pid=ImgRaw&r=0',
                // ),
                ),
            bottom: AppBar(
              bottomOpacity: 0.0,
              // backgroundColor: Colors.grey,
              leadingWidth: 0,
              title: Container(
                // width: 400,
                height: 40,
                // color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for something',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      suffixIcon: Icon(
                        Icons.camera_alt,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 710,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      border: Border.all(
                          // color: const Color.fromARGB(255, 145, 86, 86),
                          width: 1.0),
                      // color: Colors.grey[100],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        // ignore: unnecessary_null_comparison
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ListView(
                                padding: const EdgeInsets.all(0),
                                children: [
                                  Container(
                                    height: 150,
                                    // width: 50,
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white54, width: 1.5),
                                      // color: Colors.black12,
                                    ),
                                    child: CarouselSlider(
                                      items: [
                                        //1st Image of Slider
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Colors.white,
                                            image: const DecorationImage(
                                                image: NetworkImage(
                                                    "https://th.bing.com/th/id/OIP.0YvjbnRaBh5tvs0O1HgQmAHaFj?pid=ImgDet&rs=1"),
                                                fit: BoxFit.fitHeight),
                                          ),
                                        ),

                                        //2nd Image of Slider
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Colors.white,
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                  "https://cdn.xxl.thumbs.canstockphoto.com/synergy-abstract-objects-isolated-on-white-background-drawing_csp6963314.jpg"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),

                                        //3rd Image of Slider
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Colors.white,
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                  "https://www.bing.com/th?id=OIP._q6C-aNnR_kZhIEr46Af8AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.12&pid=3.1&rm=2"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),

                                        //4th Image of Slider
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Colors.white,
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                  "https://media.istockphoto.com/vectors/meeting-room-people-logogroup-of-four-persons-in-circle-vector-id980681946?k=6&m=980681946&s=612x612&w=0&h=hlSJ7ttA-0TC13y0H3v57Y4AX5KxFeMmuDlszhNUjrM="),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),

                                        //5th Image of Slider
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Colors.white,
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                  "https://st.depositphotos.com/1025177/4095/v/450/depositphotos_40951747-stock-illustration-colorful-icon.jpg"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),

                                        //6th Image of Slider
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Colors.white,
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                  "https://th.bing.com/th/id/OIP.ncYzH_R2SgCoCj3rsbJ3CQHaHa?pid=ImgDet&rs=1"),
                                              fit: BoxFit.fitHeight,
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
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 0.0,
                            ),

                            // // ignore: unnecessary_null_comparison
                            (catalogmodel.Items != null &&
                                    catalogmodel.Items.isNotEmpty)
                                ? Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
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
                                          final item =
                                              catalogmodel.Items[index];

                                          return Card(
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: GridTile(
                                              header: InkWell(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
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

                                              // Image.network(
                                              //   // item.image ?? "",
                                              // ),

                                              footer: Container(
                                                padding:
                                                    const EdgeInsets.all(5),

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
                                : const CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
                  Icons.category,
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
                    Get.to(const HomePagedemo());
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
                  Get.to(homePage());
                },
                child: const Icon(
                  Icons.settings,
                  color: Colors.redAccent,
                ),
              ),
              label: 'setting'),
        ],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: MyDrawer(),
      ),

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

//bottemnavigation bar end
    );

//     Scaffold(
//       backgroundColor: Colors.grey[200],
//       extendBody: false,

//       appBar: AppBar(
//         titleSpacing: 20.0,
//         centerTitle: true,
//         toolbarHeight: 50.2,
//         leadingWidth: 60.2,
//         toolbarOpacity: 0.8,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(25),
//               bottomLeft: Radius.circular(25),
//               topLeft: Radius.circular(25),
//               topRight: Radius.circular(25)),
//         ),
//         elevation: 8.00,
//         backgroundColor: Colors.grey[200],
//         actions: [
//           InkWell(
//             child: IconButton(
//               color: const Color.fromARGB(86, 230, 239, 228),
//               onPressed: () {
//                 // Navigator.pushNamed(context, MyRoutes.CartPageNew);
//                 Get.to(CartPageNew());
//               },
//               icon: const Icon(Icons.shopping_cart, color: Colors.red),
//             ),
//           ),
//           Switch(
//             inactiveTrackColor: Colors.black45,
//             activeTrackColor: Colors.red,
//             value: showgridview,
//             onChanged: (value) {
//               if (showgridview) {
//                 // Navigator.pushNamed(context, MyRoutes.homeRoutes);
//                 Get.to(homePage());
//               } else {
//                 // Navigator.pushNamed(context, MyRoutes.HomePagedemo);
//                 Get.to(HomePagedemo());
//               }
//             },
//           ),
//         ],
//         title: const Text(
//           'BuyerZone',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 25,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),

//       body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.only(top: 10),

//           // margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
//           height: 710,
//           width: 500,
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(25),
//                 bottomLeft: Radius.circular(25),
//                 topLeft: Radius.circular(25),
//                 topRight: Radius.circular(25)),
//             border: Border.all(
//                 color: const Color.fromARGB(255, 145, 86, 86), width: 0.5),
//             color: Colors.grey[100],
//           ),
//           child: Center(
//             child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 // ignore: unnecessary_null_comparison
//                 child: Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: SizedBox(
//                           width: 420,
//                           child: ListView(
//                             padding: const EdgeInsets.all(0),
//                             children: [
//                               Container(
//                                 height: 120,
//                                 width: 50,
//                                 padding: const EdgeInsets.all(5),
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 16, vertical: 15),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(
//                                       color: Colors.white54, width: 5.5),
//                                   color: Colors.black12,
//                                 ),
//                                 child: CarouselSlider(
//                                   items: [
//                                     //1st Image of Slider
//                                     Container(
//                                       padding: EdgeInsets.all(5),
//                                       margin: const EdgeInsets.all(1.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(15.0),
//                                         color: Colors.white,
//                                         image: const DecorationImage(
//                                             image: NetworkImage(
//                                                 "https://th.bing.com/th/id/OIP.0YvjbnRaBh5tvs0O1HgQmAHaFj?pid=ImgDet&rs=1"),
//                                             fit: BoxFit.fitHeight),
//                                       ),
//                                     ),

//                                     //2nd Image of Slider
//                                     Container(
//                                       padding: EdgeInsets.all(5),
//                                       margin: const EdgeInsets.all(1.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(15.0),
//                                         color: Colors.white,
//                                         image: const DecorationImage(
//                                           image: NetworkImage(
//                                               "https://cdn.xxl.thumbs.canstockphoto.com/synergy-abstract-objects-isolated-on-white-background-drawing_csp6963314.jpg"),
//                                           fit: BoxFit.fitHeight,
//                                         ),
//                                       ),
//                                     ),

//                                     //3rd Image of Slider
//                                     Container(
//                                       padding: EdgeInsets.all(5),
//                                       margin: const EdgeInsets.all(1.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(15.0),
//                                         color: Colors.white,
//                                         image: const DecorationImage(
//                                           image: NetworkImage(
//                                               "https://www.bing.com/th?id=OIP._q6C-aNnR_kZhIEr46Af8AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.12&pid=3.1&rm=2"),
//                                           fit: BoxFit.fitHeight,
//                                         ),
//                                       ),
//                                     ),

//                                     //4th Image of Slider
//                                     Container(
//                                       padding: EdgeInsets.all(5),
//                                       margin: const EdgeInsets.all(1.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(15.0),
//                                         color: Colors.white,
//                                         image: const DecorationImage(
//                                           image: NetworkImage(
//                                               "https://media.istockphoto.com/vectors/meeting-room-people-logogroup-of-four-persons-in-circle-vector-id980681946?k=6&m=980681946&s=612x612&w=0&h=hlSJ7ttA-0TC13y0H3v57Y4AX5KxFeMmuDlszhNUjrM="),
//                                           fit: BoxFit.fitHeight,
//                                         ),
//                                       ),
//                                     ),

//                                     //5th Image of Slider
//                                     Container(
//                                       padding: EdgeInsets.all(5),
//                                       margin: const EdgeInsets.all(1.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(15.0),
//                                         color: Colors.white,
//                                         image: const DecorationImage(
//                                           image: NetworkImage(
//                                               "https://st.depositphotos.com/1025177/4095/v/450/depositphotos_40951747-stock-illustration-colorful-icon.jpg"),
//                                           fit: BoxFit.fitHeight,
//                                         ),
//                                       ),
//                                     ),

//                                     //6th Image of Slider
//                                     Container(
//                                       padding: EdgeInsets.all(5),
//                                       margin: const EdgeInsets.all(1.0),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(15.0),
//                                         color: Colors.white,
//                                         image: const DecorationImage(
//                                           image: NetworkImage(
//                                               "https://th.bing.com/th/id/OIP.ncYzH_R2SgCoCj3rsbJ3CQHaHa?pid=ImgDet&rs=1"),
//                                           fit: BoxFit.fitHeight,
//                                         ),
//                                       ),
//                                     ),
//                                   ],

//                                   //Slider Container properties
//                                   options: CarouselOptions(
//                                     height: 200.0,
//                                     enlargeCenterPage: true,
//                                     autoPlay: true,
//                                     reverse: true,
//                                     aspectRatio: 16 / 9,
//                                     autoPlayCurve: Curves.fastOutSlowIn,
//                                     enableInfiniteScroll: true,
//                                     autoPlayAnimationDuration:
//                                         const Duration(milliseconds: 800),
//                                     viewportFraction: 0.8,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),

//                       const SizedBox(
//                         height: 15.0,
//                       ),

//                       Container(
//                         width: 500,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: Colors.black38, width: 1),
//                           color: Colors.white,
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15.0, vertical: 3),
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 2),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: const [
//                             TextField(
//                               decoration: InputDecoration(
//                                 hintText: "Search Here",
//                                 hintStyle: TextStyle(
//                                   color: Colors.black54,
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 20,
//                                 ),
//                                 contentPadding:
//                                     EdgeInsets.symmetric(vertical: 15),
//                                 icon: Icon(
//                                   Icons.search,
//                                   color: Colors.black54,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),

//                       // // ignore: unnecessary_null_comparison
//                       (catalogmodel.Items != null &&
//                               catalogmodel.Items.isNotEmpty)
//                           ? Expanded(
//                               flex: 3,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(bottom: 10),
//                                 child: GridView.builder(
//                                   padding: const EdgeInsets.all(10),
//                                   gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                     mainAxisSpacing: 10,
//                                     crossAxisSpacing: 8,
//                                   ),
//                                   itemBuilder: (context, index) {
//                                     // ignore: unused_local_variable
//                                     final item = catalogmodel.Items[index];

//                                     return Card(
//                                       clipBehavior: Clip.antiAlias,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5.0)),
//                                       child: GridTile(
//                                         header: InkWell(
//                                           child: Container(
//                                             padding: const EdgeInsets.all(5),
//                                             // ignore: sort_child_properties_last
//                                             child: Text(
//                                               item.name ?? "",
//                                               textAlign: TextAlign.center,
//                                               style: const TextStyle(
//                                                   fontSize: 16,
//                                                   color: Colors.white),
//                                             ),

//                                             decoration: const BoxDecoration(
//                                               color: Colors.black38,
//                                             ),
//                                           ),
//                                         ),

//                                         // ignore: sort_child_properties_last
//                                         child: ProgressiveImage(
//                                           blur: 10,
//                                           // placeholder: AssetImage('assets/images/car.jpg'),
//                                           thumbnail: const NetworkImage(
//                                             'https://i0.wp.com/codemyui.com/wp-content/uploads/2017/03/loading-animation.gif',
//                                           ), // 64x36
//                                           image: NetworkImage(
//                                             item.image ?? "",
//                                           ),
//                                           // 3842x2160
//                                           height: 250,
//                                           width: 500,
//                                           fit: BoxFit.fitHeight,
//                                           placeholder: null,
//                                         ),

//                                         // Image.network(
//                                         //   // item.image ?? "",
//                                         // ),

//                                         footer: Container(
//                                           padding: const EdgeInsets.all(5),

//                                           // ignore: sort_child_properties_last
//                                           child: Text(
//                                             item.price.toString(),
//                                             textAlign: TextAlign.center,
//                                             style: const TextStyle(
//                                                 color: Colors.black45),
//                                           ),

//                                           decoration: const BoxDecoration(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   itemCount: catalogmodel.Items.length,
//                                 ),
//                               ),
//                             )
//                           : const CircularProgressIndicator(),
//                     ],
//                   ),
//                 )),
//           ),
//         ),
//       ),

// //bottem navigation bar start :-
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 0.0,
//         selectedItemColor: Colors.black,
//         currentIndex: currentindex,
//         selectedFontSize: 15,
//         backgroundColor: const Color.fromARGB(255, 144, 102, 106),
//         iconSize: 25,
//         onTap: (index) => setState(
//           () => (currentindex = index),
//         ),
//         items: [
//           BottomNavigationBarItem(
//               icon: InkWell(
//                 onTap: () {
//                   Get.to(category());
//                 },
//                 child: const Icon(
//                   Icons.category,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//               label: 'Category'),
//           BottomNavigationBarItem(
//               icon: InkWell(
//                 onTap: () {
//                   Get.to(ProfileScreen());
//                 },
//                 child: const Icon(
//                   Icons.person,
//                   color: Colors.green,
//                 ),
//               ),
//               label: ' Profile'),
//           BottomNavigationBarItem(
//               icon: InkWell(
//                 onTap: () {
//                   Get.to(Addproduct());
//                 },
//                 child: const Icon(
//                   Icons.add,
//                   color: Colors.blue,
//                 ),
//               ),
//               label: 'Add Product'),
//           BottomNavigationBarItem(
//               icon: InkWell(
//                   onTap: () {
//                     Get.to(HomePagedemo());
//                   },
//                   child: Badge(
//                     shape: BadgeShape.circle,
//                     position: BadgePosition.topEnd(),
//                     borderRadius: BorderRadius.circular(50),
//                     badgeColor: const Color.fromARGB(255, 234, 190, 125),
//                     badgeContent: const Text(
//                       '2',
//                     ),
//                     child: const Icon(
//                       Icons.chat,
//                       color: Color.fromARGB(255, 106, 113, 177),
//                     ),
//                   )),
//               label: ' Chat'),
//           BottomNavigationBarItem(
//               icon: InkWell(
//                 onTap: () {
//                   // Navigator.pushNamed(context, MyRoutes.setting);
//                   Get.to(homePage());
//                 },
//                 child: const Icon(
//                   Icons.settings,
//                   color: Colors.redAccent,
//                 ),
//               ),
//               label: 'setting'),
//         ],
//       ),
// //bottemnavigation bar end

// // flotingactionbutton start
//       floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

//       floatingActionButton: FloatingActionButton(

//           // splashColor: Colors.black45,

//           // splashColor: Colors.yellow,

//           // isExtended: true,
//           // ignore: prefer_const_constructors
//           backgroundColor: Colors.blueGrey,
//           onPressed: () async {
//             // Navigator.pushNamed(context, MyRoutes.Addproduct);
//             Get.to(Addproduct());
//           },

//           // isExtended: true,
//           // ignore: prefer_const_constructors
//           child: Icon(Icons.add)),

// // flotingactionbutton End
//       drawer: MyDrawer(),
//     );

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
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),

              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 201, 99, 224),
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
//                     color: Colors.black38,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   catalog.desc ?? "",
//                   style: const TextStyle(
//                     backgroundColor: Colors.white30,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: Colors.black45,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 0,
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
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.black26),
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
//         .color(Colors.white54)
//         .make()
//         .p16()
//         .w32(context);
//   }
// }
