// // ignore_for_file: library_private_types_in_public_api

// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:progressive_image/progressive_image.dart';
// import 'package:test_demo/controller/item(forfirebas).dart';
// import 'package:test_demo/models/cart.dart';
// import 'package:test_demo/models/catalog.dart';
// import 'package:test_demo/pages/extrapage/1st.dart';
// // import 'package:expandable_tree_menu/expandable_tree_menu.dart';

// // import 'package:lottie/lottie.dart';

// // ignore: camel_case_types
// class NotificationPage extends StatefulWidget {
//   NotificationPage({Key? key}) : super(key: key);

//   // ignore: non_constant_identifier_names
//   List<Item> Product_Items = [];

//   @override
//   _Aboutus createState() => _Aboutus();

//   }

// loadData() async {
//   await Future.delayed(const Duration(seconds: 2));
//   // ignore: unused_local_variable
//   final catalogjson =
//       await rootBundle.loadString("assets/images/files/catalog.JSON");
//   final decodeData = jsonDecode(catalogjson);
//   // ignore: unused_local_variable
//   var productsData = decodeData["products"];
//   catalogmodel.Items =
//       List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
//   setState(() {});
// }

// class _Aboutus extends State<NotificationPage> {

//   //firebase data fetching
//   @override
//   void initstate () {
//     fetchRecords();
//     super.initstate();
//   }

//   fetchRecords() async {
//     var records =
//         await FirebaseFirestore.instance.collection('Product_Items').get();
//     mapRecords(records);
//   }

//   mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
//     var _list = records.docs.map(
//       (items) => items(
//         id : items.id,
//         Email_id : items['Email_id'],
//         Password : items['Password'],

//       ),
//     ).toString();

//     setState(() {
//          Product_Items = _list;

//     });
//   }

//   //firebase data fetching

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     final double screenHeight = MediaQuery.of(context).size.height;
//     // ignore: unused_local_variable
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   titleSpacing: 20.0,
//       //   centerTitle: true,
//       //   // toolbarHeight: 60.2,
//       //   // leadingWidth: 60.2,
//       //   // toolbarOpacity: 0.8,
//       //   shape: const RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.only(
//       //         bottomRight: Radius.circular(50),
//       //         bottomLeft: Radius.circular(50),
//       //         topLeft: Radius.circular(25),
//       //         topRight: Radius.circular(25)),
//       //   ),
//       //   elevation: 5.00,
//       //   backgroundColor: Colors.white,

//       //   // ignore: prefer_const_constructors
//       //   title: Text(
//       //     'Notification',
//       //     style: const TextStyle(
//       //       color: Colors.black,
//       //     ),
//       //     textAlign: TextAlign.center,
//       //   ),
//       //   actions: [
//       //     IconButton(
//       //       icon: const Icon(
//       //         Icons.search,
//       //       ),
//       //       onPressed: () {},
//       //     )
//       //   ],
//       // ),
//       body: ListView.builder(
//       itemCount: Product_items.length,
//       itemBuilder: (context, index) {
//         // ignore: unused_local_variable
//         final item = catalogmodel.Items[index];

//         return Card(
//           clipBehavior: Clip.antiAlias,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//           child: ListTile(
//             leading: Text(
//               'item $index',
//               style: const TextStyle(
//                 fontSize: 15,
//                 // color: Colors.white,
//               ),
//             ),
//             subtitle: Text('item $index description'),

//             // ignore: sort_child_properties_last

//             // Image.network(
//             //   // item.image ?? "",
//             // ),
//           ),
//         );
//       },
//     );,
//     );
//   }
// }

// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:test_demo/controller/item(forfirebas).dart';
import 'package:test_demo/pages/extrapage/1st.dart';

// class NotificationPage extends StatefulWidget {
//   NotificationPage({Key? key}) : super(key: key);

//   @override
//   State<NotificationPage> createState() => _NotificationPageState();
// }

// class _NotificationPageState extends State<NotificationPage> {
//   List<Item> basketitems = [];

//   @override
//   Widget build(BuildContext context) {
//     return Notfication();
//   }
// }

// ** second  class**

class writedatapage extends StatefulWidget {
  const writedatapage({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names

  @override
  State<writedatapage> createState() => _NotficationState();
}

class _NotficationState extends State<writedatapage> {
  bool hasinternet = false;
  late StreamSubscription subscription;
  late StreamSubscription internetsubscription;
  ConnectivityResult result = ConnectivityResult.none;

  List<Item> basket_items = [];

  // @override
  // Void initstate() {
  //   super.initState();
  // }

  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  @override
  void intstate() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(
      (result) {
        // setState(() => this.result = result);
      },
    );

    InternetConnectionChecker().onStatusChange.listen((status) {
      // ignore: unused_local_variable
      final hasinternet = status == InternetConnectionStatus.connected;

      // setState(() => this.hasinternet = hasinternet);
    });
  }

  @override
  void initstate() {
    subscription.cancel();
    internetsubscription.cancel();
    super.dispose();
  }

  fetchRecords() async {
    var records =
        await FirebaseFirestore.instance.collection('basket_items').get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    // List<Item> _list;
    // ignore: no_leading_underscores_for_local_identifiers
    var _list = records.docs
        .map(
          (item) => Item(
            id: item.id,
            name: item['name'],
            quantity: item['quantity'],
          ),
        )
        .toList();

    setState(() {
      basket_items = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        centerTitle: true,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)),
        ),
        elevation: 5.00,
        // backgroundColor: Colors.white,

        // ignore: prefer_const_constructors
        title: Text(
          'firebase w',
          style: const TextStyle(
              // color: Colors.black,
              ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 100,
            color: Colors.white,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    hasinternet =
                        await InternetConnectionChecker().hasConnection;
                    result = await Connectivity().checkConnectivity();

                    final Color = hasinternet ? Colors.green : Colors.red;
                    final text = hasinternet ? 'internet' : 'No Internet';

                    if (result == ConnectivityResult.mobile) {
                      showSimpleNotification(
                        Text(
                          // ignore: unnecessary_string_interpolations
                          '$text:Mobile Connection',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        background: Color,
                      );
                    } else if (result == ConnectivityResult.wifi) {
                      showSimpleNotification(
                        Text(
                          // ignore: unnecessary_string_interpolations
                          '$text: Wifi Connection',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        background: Color,
                      );
                    } else {
                      showSimpleNotification(
                        Text(
                          // ignore: unnecessary_string_interpolations
                          '$text: No Network Avalible',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        background: Colors.red,
                      );
                    }
                  },
                  child: const Text('Check'),
                ),
                // ListView.builder(
                //   itemCount: basket_items.length,
                //   itemBuilder: ((context, index) {
                //     return ListTile(
                //       title: Text(basket_items[index].name),
                //       subtitle: Text(basket_items[index].quantity),
                //     );
                //   }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
