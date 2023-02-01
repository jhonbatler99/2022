// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_demo/models/cart.dart';

import 'package:velocity_x/velocity_x.dart';

class cart_page extends StatelessWidget {
  const cart_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var catalog;
    return Scaffold(
      // backgroundColor: const Color.fromARGB(96, 228, 218, 218),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ).text.xl4.bold.center.make(),
        // backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _Cartlist().p32().expand(),
          const Divider(
              // color: Colors.black38,
              ),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = Cartmodel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          "\$${_cart.totalprice}".text.xl5.color(Colors.black45).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                      backgroundColor: Colors.black45,
                      SizedBox(
                        height: 50,
                        child: Column(
                          children: const [
                            Text(
                              'Buying not Supported',
                              textScaleFactor: 2,
                              textAlign: TextAlign.justify,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          width: 1,
                        ),
                      ),
                      enableDrag: false,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                  child: "Buy".text.make())
              .w24(context)
        ],
      ),
    );
  }
}

class _Cartlist extends StatefulWidget {
  _Cartlist({Key? key}) : super(key: key);

  @override
  State<_Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<_Cartlist> {
  // ignore: unused_field
  final _cart = Cartmodel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: 5,
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline), onPressed: () {}),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:test_demo/models/cart.dart';
// import 'package:velocity_x/velocity_x.dart';

// class cart_page extends StatelessWidget {
//   const cart_page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(96, 228, 218, 218),
//       appBar: AppBar(
//           centerTitle: true,
//           title: Text("Cart").text.xl4.bold.center.make(),
//           backgroundColor: Colors.white30),
//       body: Column(
//         children: [
//           _Cartlist().p32().expand(),
//           Divider(),
//           _CartTotal(),
//         ],
//       ),
//     );
//   }
// }

// class _CartTotal extends StatelessWidget {
//   final _cart = Cartmodel();
//   _CartTotal({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           "\$${_cart.totalprice}".text.xl5.color(Colors.black).make(),
//           30.widthBox,
//           ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.grey),
//                   ),
//                   child: "Buy".text.white.make())
//               .w24(context)
//         ],
//       ),
//     );
//   }
// }

// class _Cartlist extends StatelessWidget {
//   _Cartlist({Key? key}) : super(key: key);

//   final _cart = Cartmodel();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: _cart.items?.length,
//         itemBuilder: ((context, index) => ListTile(
//               leading: const Icon(Icons.done),
//               trailing: IconButton(
//                   icon: const Icon(Icons.remove_circle_outline),
//                   onPressed: () {}),
//               title: _cart.items[index].name.text.make(),
//             )));
//   }
// }

