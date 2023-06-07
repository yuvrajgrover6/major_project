// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final db = FirebaseFirestore.instance;
  RxList<Category> categories = <Category>[].obs;
  @override
  void onInit() async {
    categories.value = await getCategories();
    super.onInit();
  }

  Future<List<Category>> getCategories() async {
    final categories = await db.collection('Categories').get();
    return categories.docs.map((e) => Category.fromMap(e.data())).toList();
  }
}

class Category {
  String name;
  String image;
  Category({
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
