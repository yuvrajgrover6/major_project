import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../model/Font.dart';

class FontsController extends GetxController {
  String categoryName;
  FontsController(this.categoryName);
  RxList<Font> fonts = <Font>[].obs;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  @override
  void onInit() async {
    fonts.value = await getFonts(categoryName);
    super.onInit();
  }

  Future<List<Font>> getFonts(
    String category,
  ) async {
    final fonts =
        await db.collection('Fonts').where('type', isEqualTo: category).get();
    return fonts.docs.map((e) => Font.fromMap(e.data())).toList();
  }

  Future<void> downloadFont(Font font) async {
    // write file to local storage
    final file = await storage.ref("${font.id}/font.ttf").getData();
    print(file);
    // download file
    final appDirectory = await getDownloadPath();
    final filePath = '$appDirectory/${font.name}.ttf';
    final File localFile = File(filePath);

    await localFile.writeAsBytes(file!);
    Get.snackbar(
      'Downloaded',
      'Font downloaded successfully',
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err, stack) {
      print("Cannot get download folder path");
    }
    return directory?.path;
  }
}
