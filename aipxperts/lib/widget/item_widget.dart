import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:test_demo/models/catalog.dart';

class Itemwidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Item item;
  const Itemwidget({Key? key, required this.item})
      // ignore: unnecessary_null_comparison
      : assert(Item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // ignore: avoid_print
          print("$item.name pressed");
        },
        leading: Image.network(item.image ?? ""),
        title: Text(item.name ?? ""),
        subtitle: Text(item.desc ?? ""),
        trailing: Text(
          "\$${item.price ?? ""}",
          textScaleFactor: 1.5,
          style: const TextStyle(
            color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
