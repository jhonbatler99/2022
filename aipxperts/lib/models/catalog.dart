// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types

// ignore: unused_import
import 'dart:convert';

// ignore: unused_import
import 'package:flutter/cupertino.dart';

class catalogmodel {
  static final catModel = catalogmodel._internal();

  catalogmodel._internal();

  factory catalogmodel() => catModel;
  // ignore: non_constant_identifier_names
  static List<Item> Items = [];
  //stack overflow solution =[]

  Item getByid(int id) =>
      // ignore: null_closures
      Items.firstWhere((element) => element.id == id, orElse: null);

  List<Item> getByPosition(int pos) => Items;

  static void foreach(Null Function() param0) {}
  // [
  //   Item(
  //     id: 1,
  //     name: "iphone 12 pro",
  //     desc: "Apple iphone 12th generation",
  //     price: 899,
  //     color: "black",
  //     image:
  //         "https://th.bing.com/th/id/OIP.hjZtIcknYScvdNMCKTpfvgHaIw?w=124&h=180&c=7&r=0&o=5&dpr=1.12&pid=1.7",
  //   ),
  // ];
}

class Item {
  int? id;
  String? name;
  String? desc;
  dynamic price;
  String? color;
  String? image;

  // num totalprice;

  Item({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
    required quantity,
    // required this.totalprice,
    // requrired this.totalprice is not thier
  });

  get itemname => null;

  get itemdesc => null;

  get isFavorite => null;

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    dynamic price,
    String? color,
    String? image,
    num? totalprice,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image, quantity: null,
      // totalprice: totalprice ?? this.totalprice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
      // 'totalprice': totalprice,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      price: map['price'],
      color: map['color'] != null ? map['color'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      quantity: null,
      // totalprice: map['totalprice'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image,)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
    // other.totalprice == totalprice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
    // totalprice.hashCode;
  }
}

class string {}

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: camel_case_types

// // ignore: unused_import
// import 'dart:convert';

// // ignore: unused_import
// import 'package:flutter/cupertino.dart';

// class catalogmodel {
// // ignore: non_constant_identifier_names
//   static List<Item> Items = [];
//   //stack overflow solution =[]

//   Item getByid(int id) =>
//       Items.firstWhere((element) => element.id == id, orElse: null);

//   List<Item> getByPosition(int pos) => Items;
//   // [
//   //   Item(
//   //     id: 1,
//   //     name: "iphone 12 pro",
//   //     desc: "Apple iphone 12th generation",
//   //     price: 899,
//   //     color: "black",
//   //     image:
//   //         "https://th.bing.com/th/id/OIP.hjZtIcknYScvdNMCKTpfvgHaIw?w=124&h=180&c=7&r=0&o=5&dpr=1.12&pid=1.7",
//   //   ),
//   // ];
// }

// class Item {
//   int? id;
//   String? name;
//   String? desc;
//   num? price;
//   String? color;
//   String? image;
//   String? Totalprice;

//   Item({
//     this.id,
//     this.name,
//     this.desc,
//     this.price,
//     this.color,
//     this.image,
//     this.Totalprice,
//   });

//   Item copyWith({
//     int? id,
//     String? name,
//     String? desc,
//     num? price,
//     String? color,
//     String? image,
//     String? Totalprice,
//   }) {
//     return Item(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       desc: desc ?? this.desc,
//       price: price ?? this.price,
//       color: color ?? this.color,
//       image: image ?? this.image,
//       Totalprice: Totalprice ?? this.Totalprice,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'desc': desc,
//       'price': price,
//       'color': color,
//       'image': image,
//       'Totalprice': Totalprice,
//     };
//   }

//   factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(
//       id: map['id'] != null ? map['id'] as int : null,
//       name: map['name'] != null ? map['name'] as String : null,
//       desc: map['desc'] != null ? map['desc'] as String : null,
//       price: map['price'] != null ? map['price'] as num : null,
//       color: map['color'] != null ? map['color'] as String : null,
//       image: map['image'] != null ? map['image'] as String : null,
//       Totalprice:
//           map['Totalprice'] != null ? map['Totalprice'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Item.fromJson(String source) =>
//       Item.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image, Totalprice:$Totalprice)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Item &&
//         other.id == id &&
//         other.name == name &&
//         other.desc == desc &&
//         other.price == price &&
//         other.color == color &&
//         other.image == image &&
//         other.Totalprice == Totalprice;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         name.hashCode ^
//         desc.hashCode ^
//         price.hashCode ^
//         color.hashCode ^
//         image.hashCode ^
//         Totalprice.hashCode;
//   }
// }

// class string {}
