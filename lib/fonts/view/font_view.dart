import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/fonts/controller/fonts_controller.dart';

class FontView extends StatelessWidget {
  final String categoryName;
  const FontView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FontsController(categoryName));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font View'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.fonts.length,
          itemBuilder: (context, index) {
            final font = controller.fonts[index];
            return ListTile(
              leading: CircleAvatar(
                  child:
                      Text(font.name[0], style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)]),
              title: Text(font.name),
              subtitle: Text(font.size.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.download),
                onPressed: () {
                  controller.downloadFont(font);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
