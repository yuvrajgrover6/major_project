import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:major_project/fonts/controller/category_controller.dart';
import 'package:major_project/fonts/view/font_view.dart';

class FontsHome extends StatelessWidget {
  const FontsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Font Category'),
      ),
      body: Obx(
        () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => FontView(
                      categoryName: controller.categories[index].name));
                },
                child: Container(
                    margin: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                        image: NetworkImage(controller.categories[index].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        controller.categories[index].name.capitalizeFirst!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.07,
                        ),
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
