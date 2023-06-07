import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class FullScreenWallpaperController extends GetxController {
  Rx<File?> cachedimage = Rx<File?>(null);
  final String url;
  RxBool isLoading = false.obs;
  FullScreenWallpaperController({required this.url});

  @override
  void onInit() async {
    super.onInit();
    isLoading.value = true;
    cachedimage.value = await DefaultCacheManager().getSingleFile(url);
    isLoading.value = false;
  }

  void setWallpaper({
    required String url,
    required String selectedType,
  }) async {
    int location = selectedType == 'home'
        ? WallpaperManagerFlutter.HOME_SCREEN
        : selectedType == 'lock'
            ? WallpaperManagerFlutter.LOCK_SCREEN
            : WallpaperManagerFlutter.BOTH_SCREENS;

    await WallpaperManagerFlutter().setwallpaperfromFile(cachedimage.value, location);
    Get.close(1);
    Get.snackbar("Done", "Wallpaper Set Successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }
}
