import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/full_screen_controller.dart';

class FullScreenImage extends StatelessWidget {
  final String url;
  const FullScreenImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FullScreenWallpaperController(url: url));
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Obx(() => Image.file(controller.cachedimage.value!,
                    fit: BoxFit.cover)))),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('Set As Wallpaper'),
                      content: const Text(
                          'Select the type of wallpaper you want to set'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              controller.setWallpaper(
                                  url: url, selectedType: 'home');
                            },
                            child: const Text('Home')),
                        TextButton(
                            onPressed: () {
                              controller.setWallpaper(
                                  url: url, selectedType: 'lock');
                            },
                            child: const Text('Lock')),
                        TextButton(
                            onPressed: () {
                              controller.setWallpaper(
                                  url: url, selectedType: 'both');
                            },
                            child: const Text('Both')),
                      ],
                    ));
          },
          child: Container(
            height: size.height * 0.06,
            width: size.width,
            color: Theme.of(context).primaryColor,
            child: Center(
                child: Text('Set As Wallpaper',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold))),
          ),
        ),
      ],
    ));
  }
}
