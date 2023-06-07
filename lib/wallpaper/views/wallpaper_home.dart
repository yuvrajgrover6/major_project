import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:major_project/fonts/controller/category_controller.dart';
import 'package:major_project/fonts/view/font_view.dart';
import 'package:major_project/wallpaper/controller/wallpaper_controller.dart';
import 'package:major_project/wallpaper/model/wallpaper_category.dart';
import 'package:major_project/wallpaper/views/wallpaper_view.dart';

class WallpaperHome extends StatelessWidget {
  const WallpaperHome({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Animals",
      "Architecture",
      "Nature",
      "People",
      "Technology",
      "Travel",
      "Food",
      "Sports",
      "Fashion",
      "Business",
      "Education",
      "Health",
      "Music",
      "Religion",
      "Actors",
      "Science",
      "Spirituality",
      "Art",
      "History",
      "Places",
      "Industry",
      "Computer",
    ];

    final List<WallpaperCategory> wallpaperCategories = List.generate(
        categories.length,
        (index) => WallpaperCategory(
            name: categories[index],
            image:
                "https://source.unsplash.com/1600x900/?${categories[index].toLowerCase()}"));
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Wallpaper Category'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: wallpaperCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() =>
                  WallpaperView(categoryName: wallpaperCategories[index].name));
            },
            child: Container(
                margin: EdgeInsets.all(width * 0.02),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.darken),
                    image: NetworkImage(wallpaperCategories[index].image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    wallpaperCategories[index].name.capitalizeFirst!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.07,
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
