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
    final List<WallpaperCategory> wallpaperCategories = [
      WallpaperCategory(
          name: "Animals",
          image: "https://source.unsplash.com/1600x900/?animals"),
      WallpaperCategory(
          name: "Architecture",
          image: "https://source.unsplash.com/1600x900/?architecture"),
      WallpaperCategory(
          name: "Nature",
          image: "https://source.unsplash.com/1600x900/?nature"),
      WallpaperCategory(
          name: "People",
          image: "https://source.unsplash.com/1600x900/?people"),
      WallpaperCategory(
          name: "Technology",
          image: "https://source.unsplash.com/1600x900/?technology"),
      WallpaperCategory(
          name: "Travel",
          image: "https://source.unsplash.com/1600x900/?travel"),
      WallpaperCategory(
          name: "Food", image: "https://source.unsplash.com/1600x900/?food"),
      WallpaperCategory(
          name: "Sports",
          image: "https://source.unsplash.com/1600x900/?sports"),
      WallpaperCategory(
          name: "Fashion",
          image: "https://source.unsplash.com/1600x900/?fashion"),
      WallpaperCategory(
          name: "Business",
          image: "https://source.unsplash.com/1600x900/?business"),
      WallpaperCategory(
          name: "Education",
          image: "https://source.unsplash.com/1600x900/?education"),
      WallpaperCategory(
          name: "Health",
          image: "https://source.unsplash.com/1600x900/?health"),
      WallpaperCategory(
          name: "Music", image: "https://source.unsplash.com/1600x900/?music"),
      WallpaperCategory(
          name: "Religion",
          image: "https://source.unsplash.com/1600x900/?religion"),
      WallpaperCategory(
          name: "Actors",
          image: "https://source.unsplash.com/1600x900/?religion"),
      WallpaperCategory(
          name: "Science",
          image: "https://source.unsplash.com/1600x900/?science"),
      WallpaperCategory(
          name: "Spirituality",
          image: "https://source.unsplash.com/1600x900/?spirituality"),
      WallpaperCategory(
          name: "Art", image: "https://source.unsplash.com/1600x900/?art"),
      WallpaperCategory(
          name: "History",
          image: "https://source.unsplash.com/1600x900/?history"),
    ];
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
