import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_demo/models/cart.dart';
import 'package:test_demo/models/catalog.dart';
import 'package:test_demo/pages/Ui_pages.dart/Addproduct.dart';
import 'package:test_demo/pages/Ui_pages.dart/cart_page_new.dart';
import 'package:test_demo/pages/Ui_pages.dart/category.dart';
import 'package:test_demo/pages/Ui_pages.dart/notificationpage.dart';
import 'package:test_demo/pages/Ui_pages.dart/product_detail_page.dart';
import 'package:test_demo/pages/Ui_pages.dart/profile.dart';
import 'package:test_demo/pages/cart_page.dart';
import 'package:test_demo/widget/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePagedemo extends StatefulWidget {
  const HomePagedemo({Key? key}) : super(key: key);

  @override
  State<HomePagedemo> createState() => _HomePageState();
}

RxBool _isLightTheme = false.obs;
RxBool _isnightheme = false.obs;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

_saveThemeStatus() async {
  SharedPreferences pref = await _prefs;
  pref.setBool('theme', _isLightTheme.value);
}

_getThemeStatus() async {
  var _isLight = _prefs.then((SharedPreferences prefs) {
    return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  }).obs;
  _isLightTheme.value = (await _isLight.value)!;
  Get.changeThemeMode(_isnightheme.value ? ThemeMode.light : ThemeMode.dark);
}

MyApp() {
  _getThemeStatus();
}

//

class _HomePageState extends State<HomePagedemo> {
  bool ishiddenpassword = true;

  // final keyisfirstloaded = "is_File_loaded";
  final int days = 4;
  final String name = "Hello World";
  int currentindex = 2;
  bool changetheme = false;

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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(CartPageNew());
          },
          child: const Icon(
            CupertinoIcons.cart,
          )),
      appBar: AppBar(
        titleSpacing: 20.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        leadingWidth: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0)),
        ),
        elevation: 0.3,
        actions: [
          // InkWell(
          //   child: IconButton(
          //     color: const Color.fromARGB(86, 230, 239, 228),
          //     onPressed: () {
          //       Get.to(setting());
          //     },
          //     icon: const Icon(
          //       Icons.notifications,
          //       color: Colors.black45,
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              // Get.to(CartPageNew());
              Get.to(const NotificationPage());
            },
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          ObxValue(
            (data) => Switch(
              value: _isnightheme.value,
              onChanged: (val) {
                _isnightheme.value = val;
                Get.changeThemeMode(
                  _isnightheme.value ? ThemeMode.light : ThemeMode.dark,
                );
                _saveThemeStatus();
              },
            ),
            true.obs,
          ),
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
          height: Get.height,
          width: Get.width,
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Catalogheader(),
              // ignore: unnecessary_null_comparison
              if (catalogmodel.Items != null && catalogmodel.Items.isNotEmpty)
                Cataloglist().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
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
                Icons.grid_view,
                color: Colors.deepPurple,
              ),
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(const ProfileScreen());
                },
                child: const Icon(
                  Icons.account_circle_outlined,
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
                    Get.defaultDialog(
                      title: 'Are You Sure ',
                      middleText: 'Enjoy',
                      radius: 30,
                      textConfirm: 'dark',
                      textCancel: 'Light',
                      titlePadding: const EdgeInsets.all(10),
                      // cancel: Text('Sure'),
                      // confirm: Text('No way'),
                      onCancel: () => {Get.changeTheme(ThemeData.light())},
                      onConfirm: () => {Get.changeTheme(ThemeData.dark())},
                      // confirmTextColor: Colors.white,
                      // cancelTextColor: Colors.black,
                      // backgroundColor: Colors.white,
                    );
                  },
                  child:
                      // Badge(
                      // shape: BadgeShape.circle,
                      // position: BadgePosition.topEnd(),
                      // borderRadius: BorderRadius.circular(50),
                      // badgeColor: const Color.fromARGB(255, 234, 190, 125),
                      // badgeContent: const Text(
                      //   '2',
                      // ),
                      const Icon(
                    Icons.sunny,
                    color: Colors.lightGreen,
                  )),
              label: ' Theme'),
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(cart_page());
                },
                child: const Icon(
                  Icons.settings,
                  color: Colors.redAccent,
                ),
              ),
              label: 'setting'),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}

class Catalogheader extends StatelessWidget {
  const Catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(right: 5, left: 15),
      // decoration: BoxDecoration(
      //   // color: Colors.black45,
      //   borderRadius: BorderRadius.circular(20),
      //   border: Border.all(width: 0.2),
      // ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Trading Product's",
                // textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
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
          const SizedBox(
            height: 10,
          ),
          // " Trading Product's".text.black.xl2.bold.make(),
        ],
      ),
    );
  }
}

class Cataloglist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: catalogmodel.Items.length,
      itemBuilder: (context, index) {
        final catalog = catalogmodel.Items[index];

        // ignore: missing_required_param
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homedetailpage(
                      catalog: catalog,
                    ),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isadded = false;

    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image ?? "",
            ),
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  catalog.name ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    // color: Colors.black38,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  catalog.desc ?? "",
                  style: const TextStyle(
                    // backgroundColor: Colors.white30,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    // color: Colors.black45,
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    Text(
                      "\$${catalog.price.toString()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddtoCart(catalog: catalog, isadded: isadded)
                  ],
                )
              ]))
        ],
      ),
    ).roundedLg.square(125).make().py2();
  }
}

class AddtoCart extends StatefulWidget {
  AddtoCart({
    Key? key,
    required this.catalog,
    required bool isadded,
  }) : super(key: key);

  final Item catalog;

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  final _cart = Cartmodel();

  get isliked => null;
  @override
  Widget build(BuildContext context) {
    // bool isInCart = _cart.items.contains(widget.catalog) ?? false;

    bool isInCart = false;

    return Expanded(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              isInCart = isInCart.toggle();
              final _catalog = catalogmodel();

              _cart.catalog;
              _catalog;

              _cart.add = (widget.catalog);
              setState(() {});
            },
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.black26),
                shape: MaterialStateProperty.all(const StadiumBorder())),
            child:
                isInCart ? const Icon(Icons.done) : "Add to Cart".text.make(),
          ),
        ],
      ),
    );
  }
}

class CatalogImage extends StatefulWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<CatalogImage> createState() => _CatalogImageState();
}

class _CatalogImageState extends State<CatalogImage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(widget.image)
        .box
        .roundedLg
        .p8
        .color(Colors.white)
        .make()
        .p16()
        .w32(context);
  }
}

class Mysearchdelegate extends SearchDelegate {
  List<String> searchresult = [
    'apple',
    'bannana',
    'watermelon',
    'orange',
    'mango',
    'Kivi',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
          ),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.normal),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchresult.where((searchresult) {
      final result = searchresult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        // suggestions = suggestions[index] as List<String>;
        return ListTile(
          title: Text(
            suggestions[index],
            textAlign: TextAlign.start,
          ),
          onTap: () {
            query = suggestions as String;
          },
        );
      },
    );
  }
}

class SearchdeledateMy extends SearchDelegate {
  List<String> searchresult = [
    'apple',
    'bannana',
    'watermelon',
    'orange',
    'mango',
    'Kivi',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
          ),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.normal),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchresult.where((searchresult) {
      final result = searchresult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        // suggestions = suggestions[index] as List<String>;
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions as String;
          },
        );
      },
    );
  }
}

// appBar: AppBar(
//   titleSpacing: 20.0,
//   centerTitle: true,
//   toolbarHeight: 60.2,
//   leadingWidth: 60.2,
//   toolbarOpacity: 0.8,
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.only(
//         bottomRight: Radius.circular(25),
//         bottomLeft: Radius.circular(25),
//         topLeft: Radius.circular(25),
//         topRight: Radius.circular(25)),
//   ),
//   elevation: 8.00,
//   backgroundColor: Colors.grey[200],
//   actions: [
//     InkWell(
//       child: IconButton(
//         color: Colors.red,
//         onPressed: () {
//           setState(() {
//             ishiddenpassword = !ishiddenpassword;
//           });
//         },
//         icon: Icon(
//             ishiddenpassword ? Icons.favorite : Icons.favorite_border),
//       ),
//     ),
//     Switch(
//       inactiveTrackColor: Colors.black,
//       activeTrackColor: Colors.red,
//       value: showgridview,
//       onChanged: (value) {
//         setState(() {
//           showgridview = value;
//         });
//       },
//     ),
//   ],
//   title: const Text(
//     'BuyerZonee',
//     style: TextStyle(
//       color: Colors.black,
//       fontSize: 25,
//     ),
//     textAlign: TextAlign.center,
//   ),
// ),

//bottemnavigation bar start :-
// bottomNavigationBar: CurvedNavigationBar(
//   height: 60,
//   animationCurve: Curves.easeOutQuint,
//   animationDuration: const Duration(milliseconds: 300),
//   backgroundColor: const Color.fromARGB(221, 101, 77, 77),
//   items: const <Widget>[
//     Icon(Icons.home, color: Colors.black, size: 30),
//     Icon(Icons.person, color: Colors.black, size: 30),
//     Icon(Icons.shopping_cart, color: Colors.black, size: 30),
//     Icon(Icons.chat, color: Colors.black, size: 30),
//     Icon(
//       Icons.settings,
//       color: Colors.black,
//       size: 30,
//     ),

//     // Icon(Icons.person, color: Colors.black, size: 30),
//     // Icon(Icons.person, color: Colors.black, size: 30),
//     // Icon(Icons.add, size: 30),
//     // Icon(Icons.chat, size: 30),
//     // Icon(Icons.settings, size: 30),
//   ],
//   onTap: (index) {
//     //Handle button tap
//   },
// ),

// );

// body: Container(
//   margin: const EdgeInsets.all(7),

//   // margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
//   height: 710,
//   width: 410,
//   decoration: BoxDecoration(
//     borderRadius: const BorderRadius.only(
//         bottomRight: Radius.circular(25),
//         bottomLeft: Radius.circular(25),
//         topLeft: Radius.circular(25),
//         topRight: Radius.circular(25)),
//     border: Border.all(
//         color: const Color.fromARGB(255, 145, 86, 86), width: 0.5),
//     color: Colors.grey[200],
//   ),
//   child: Center(
//     child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         // ignore: unnecessary_null_comparison
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: ListView(
//                 children: [
//                   Container(
//                     height: 115,
//                     width: 50,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 2, vertical: 10),
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 15),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(40),
//                       border: Border.all(color: Colors.black12, width: 2),
//                       color: Colors.black12,
//                     ),
//                     child: CarouselSlider(
//                       items: [
//                         //1st Image of Slider
//                         Container(
//                           margin: const EdgeInsets.all(10.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             image: const DecorationImage(
//                                 image: NetworkImage(
//                                     "https://th.bing.com/th/id/OIP.0YvjbnRaBh5tvs0O1HgQmAHaFj?pid=ImgDet&rs=1"),
//                                 fit: BoxFit.contain),
//                           ),
//                         ),

//                         //2nd Image of Slider
//                         Container(
//                           margin: const EdgeInsets.all(1.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             image: const DecorationImage(
//                               image: NetworkImage(
//                                   "https://cdn.xxl.thumbs.canstockphoto.com/synergy-abstract-objects-isolated-on-white-background-drawing_csp6963314.jpg"),
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                         ),

//                         //3rd Image of Slider
//                         Container(
//                           margin: const EdgeInsets.all(1.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             image: const DecorationImage(
//                               image: NetworkImage(
//                                   "https://th.bing.com/th/id/OIP.ADn7331CdhiFiNDPJ8BPtwHaFj?pid=ImgDet&rs=1"),
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                         ),

//                         //4th Image of Slider
//                         Container(
//                           margin: const EdgeInsets.all(1.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             image: const DecorationImage(
//                               image: NetworkImage(
//                                   "https://media.istockphoto.com/vectors/meeting-room-people-logogroup-of-four-persons-in-circle-vector-id980681946?k=6&m=980681946&s=612x612&w=0&h=hlSJ7ttA-0TC13y0H3v57Y4AX5KxFeMmuDlszhNUjrM="),
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                         ),

//                         //5th Image of Slider
//                         Container(
//                           margin: const EdgeInsets.all(1.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             image: const DecorationImage(
//                               image: NetworkImage(
//                                   "https://st.depositphotos.com/1025177/4095/v/450/depositphotos_40951747-stock-illustration-colorful-icon.jpg"),
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                         ),

//                         //6th Image of Slider
//                         Container(
//                           margin: const EdgeInsets.all(1.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             image: const DecorationImage(
//                               image: NetworkImage(
//                                   "https://th.bing.com/th/id/OIP.ncYzH_R2SgCoCj3rsbJ3CQHaHa?pid=ImgDet&rs=1"),
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                         ),
//                       ],

//                       //Slider Container properties
//                       options: CarouselOptions(
//                         height: 200.0,
//                         enlargeCenterPage: true,
//                         autoPlay: true,
//                         aspectRatio: 16 / 9,
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enableInfiniteScroll: true,
//                         autoPlayAnimationDuration:
//                             const Duration(milliseconds: 800),
//                         viewportFraction: 0.8,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(
//               height: 15.0,
//             ),

//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.black38, width: 1),
//                 color: Colors.white,
//               ),
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 10.0, vertical: 3),
//               margin: const EdgeInsets.symmetric(
//                   horizontal: 10.0, vertical: 2),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: const [
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search Here",

//                       // suffixIcon: Padding(
//                       //   padding: EdgeInsetsDirectional.only(end: 10.0),
//                       //   child: Icon(Icons.check_box),
//                       //   // myIcon is a 48px-wide widget.
//                       // ),

//                       hintStyle: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 20,
//                       ),
//                       contentPadding: EdgeInsets.symmetric(vertical: 15),

//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),

//             // ignore: unnecessary_null_comparison
//             (catalogmodel.Items != null && catalogmodel.Items.isNotEmpty)
//                 ? Expanded(
//                     flex: 3,
//                     child: GridView.builder(
//                       padding: const EdgeInsets.all(10),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 10,
//                         crossAxisSpacing: 26,
//                       ),
//                       itemBuilder: (context, index) {
//                         // ignore: unused_local_variable
//                         final item = catalogmodel.Items[index];

//                         return Card(
//                           clipBehavior: Clip.antiAlias,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5.0)),
//                           child: GridTile(
//                             header: Container(
//                               padding: const EdgeInsets.all(5),
//                               // ignore: sort_child_properties_last
//                               child: Text(
//                                 item.name ?? "",
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     fontSize: 16, color: Colors.white),
//                               ),

//                               decoration: const BoxDecoration(
//                                 color: Colors.black54,
//                               ),
//                             ),

//                             // ignore: sort_child_properties_last
//                             child: ProgressiveImage(
//                               blur: 10,
//                               // placeholder: AssetImage('assets/images/car.jpg'),
//                               thumbnail: const NetworkImage(
//                                   'https://i0.wp.com/codemyui.com/wp-content/uploads/2017/03/loading-animation.gif'), // 64x36
//                               image: NetworkImage(
//                                 item.image ?? "",
//                               ),
//                               // 3842x2160
//                               height: 250,
//                               width: 500,
//                               fit: BoxFit.fitHeight,
//                               placeholder: null,
//                             ),

//                             // Image.network(
//                             //   // item.image ?? "",
//                             // ),

//                             footer: Container(
//                               padding: const EdgeInsets.all(5),

//                               // ignore: sort_child_properties_last
//                               child: Text(
//                                 item.price.toString(),
//                                 textAlign: TextAlign.center,
//                                 style:
//                                     const TextStyle(color: Colors.white),
//                               ),

//                               decoration: const BoxDecoration(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       itemCount: catalogmodel.Items.length,
//                     ),
//                   )

//                 // ignore: unnecessary_null_comparison
//                 // : (catalogmodel.Items != null &&
//                 //         catalogmodel.Items.isNotEmpty)
//                 //     ? Expanded(
//                 //         flex: 3,
//                 //         child: ListView.builder(
//                 //           itemBuilder: (context, index) {
//                 //             // ignore: unused_local_variable
//                 //             final item = catalogmodel.Items[index];

//                 //             return Card(
//                 //               clipBehavior: Clip.antiAlias,
//                 //               shape: RoundedRectangleBorder(
//                 //                   borderRadius:
//                 //                       BorderRadius.circular(5.0)),
//                 //               child: ListTile(
//                 //                 leading: Container(
//                 //                   padding: const EdgeInsets.all(5),
//                 //                   // ignore: sort_child_properties_last
//                 //                   child: Text(
//                 //                     item.name ?? "",
//                 //                     style: const TextStyle(
//                 //                         fontSize: 15,
//                 //                         color: Colors.white),
//                 //                   ),

//                 //                   decoration: const BoxDecoration(
//                 //                     color:
//                 //                         Color.fromARGB(255, 201, 99, 224),
//                 //                   ),
//                 //                 ),

//                 //                 // ignore: sort_child_properties_last
//                 //                 title: ProgressiveImage(
//                 //                   // placeholder: AssetImage('assets/images/car.jpg'),
//                 //                   thumbnail: const NetworkImage(
//                 //                       'https://i.imgur.com/eOQL4jg.jpg'), // 64x36
//                 //                   image: NetworkImage(
//                 //                       item.image ?? ""), // 3842x2160
//                 //                   height: 250,
//                 //                   width: 500,
//                 //                   fit: BoxFit.fitHeight,
//                 //                   placeholder: null,
//                 //                 ),

//                 //                 // Image.network(
//                 //                 //   // item.image ?? "",
//                 //                 // ),
//                 //               ),
//                 //             );
//                 //           },
//                 //           itemCount: catalogmodel.Items.length,
//                 //         ),
//                 //       )
//                 : const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//           ],
//         )),
//   ),
// ),

// bottomNavigationBar: BottomNavigationBar(
//   elevation: 0.0,
//   selectedItemColor: Colors.black,
//   currentIndex: currentindex,
//   selectedFontSize: 15,
//   backgroundColor: const Color.fromARGB(255, 144, 102, 106),
//   iconSize: 28,
//   onTap: (index) => setState(
//     () => (currentindex = index),
//   ),
//   items: [
//     BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, MyRoutes.homeRoutes);
//           },
//           child: const Icon(
//             Icons.home,
//             color: Colors.black,
//           ),
//         ),
//         label: ' Home'),
//     BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, MyRoutes.profileRoutes);
//           },
//           child: const Icon(
//             Icons.person,
//             color: Colors.black,
//           ),
//         ),
//         label: ' Proffile'),
//     BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, MyRoutes.Addproduct);
//           },
//           child: const Icon(
//             Icons.add,
//             color: Colors.black,
//           ),
//         ),
//         label: 'Add Product'),
//     BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, MyRoutes.SharedPreferencesDemo);
//           },
//           child: const Icon(
//             Icons.chat,
//             color: Colors.black,
//           ),
//         ),
//         label: ' Chat'),
//     BottomNavigationBarItem(
//         icon: InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, MyRoutes.setting);
//           },
//           child: const Icon(
//             Icons.settings,
//             color: Colors.black,
//           ),
//         ),
//         label: 'setting'),
//   ],
// ),
//bottemnavigation bar end

// flotingactionbutton start
// floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

// floatingActionButton: FloatingActionButton(

//     // splashColor: Colors.black45,

//     // splashColor: Colors.yellow,

//     // isExtended: true,
//     // ignore: prefer_const_constructors
//     backgroundColor: Colors.grey,
//     onPressed: () async {
//       Navigator.pushNamed(context, MyRoutes.Addproduct);
//     },

//     // isExtended: true,
//     // ignore: prefer_const_constructors
//     child: Icon(Icons.add)),

// flotingactionbutton End
// drawer: const MyDrawer(),

// ignore: dead_code
