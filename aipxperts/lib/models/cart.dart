// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: prefer_typing_uninitialized_variables, recursive_getters, camel_case_types

// ignore: unused_import
import 'package:test_demo/models/cart.dart';
import 'package:test_demo/models/catalog.dart';

class Cartmodel {
  //catalog field
  // ignore: unused_field

  static final cartodel = Cartmodel._internal();

  Cartmodel._internal();

  factory Cartmodel() => cartodel;

  late catalogmodel _catalog;

  // ignore: unused_field
  // item id collection
  final List<int> _itemIds = [];

  var price;

  var totalprice;

  var items;

  set add(Item add) {}

  catalogmodel get catalog => catalog;

  setcatalog(catalogmodel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }
}

List<Item> get items => _itemIds.map((id) => _catalog.getByid(id)).tolist();

// num get totalprice => items.fold(0, (total, current) => totalprice);

num get totalprice => items.fold(0, (total, current) => total + current.price);

//add item
void add(Item item) {
  _itemIds.add(item.id);
}

//remove item
void remove(Item item) {
  _itemIds.remove(item.id);
}

class _itemIds {
  static map(Function(dynamic id) param0) {}

  static void add(int? id) {}

  static void remove(int? id) {}
}

class _catalog {
  static getByid(id) {}
}
