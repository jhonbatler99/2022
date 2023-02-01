// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:test_demo/models/catalog.dart';

import '../utiles/routes.dart';
import 'cart_page_new.dart';

// ignore: camel_case_types
class Homedetailpage extends StatelessWidget {
  final Item catalog;
  const Homedetailpage({
    Key? key,
    required this.catalog,
    // ignore: unnecessary_null_comparison
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        // color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            Text(
              "\$${catalog.price.toString()}",
              style: const TextStyle(
                  // color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(CartPageNew());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black26),
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                ),
              ),
              child: const Text("Add To Cart"),
            ).wh(120, 50)
          ],
        ).p16(),
      ),
      appBar: AppBar(
          // backgroundColor: Colors.white,
          ),
      // backgroundColor: Colors.white70,
      body: SafeArea(
        bottom: true,
        child: Container(
          // color: Colors.white,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(
                  catalog.image.toString(),
                ),
              ).h32(context),
              Expanded(
                  child: VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 30.0,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: context.screenWidth,
                    // color: Colors.white,
                    child: Column(
                      children: [
                        Text(
                          catalog.name ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            // color: Colors.black45,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          catalog.desc ?? "",
                          style: const TextStyle(
                            // backgroundColor: Colors.white30,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            // color: Colors.black45,
                          ),
                        ),
                      ],
                    ).py32()),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
