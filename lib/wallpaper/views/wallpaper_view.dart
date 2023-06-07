import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:major_project/wallpaper/views/full_screen_wallpaper.dart';

import '../controller/wallpaper_controller.dart';

class WallpaperView extends StatelessWidget {
  final String categoryName;
  const WallpaperView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(WallpaperController(category: categoryName.toLowerCase()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper View'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.loadMore();
        },
        tooltip: 'Load More',
        child: const Icon(Icons.refresh),
      ),
      body: Obx(
        () => controller.initialLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Obx(
                () => GridView.builder(
                  itemCount: controller.wallpaperLoading.value
                      ? controller.wallpapers.length + 1
                      : controller.wallpapers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return controller.wallpaperLoading.value
                        ? index == controller.wallpapers.length + 1
                            ? Container(
                                child: const CircularProgressIndicator())
                            : const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              Get.to(() => FullScreenImage(
                                  url: controller.wallpapers[index]['src']
                                      ['original']));
                            },
                            child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                            .wallpapers[index]['src']['tiny']),
                                        fit: BoxFit.cover))),
                          );
                  },
                ),
              ),
      ),
    );
  }
}
