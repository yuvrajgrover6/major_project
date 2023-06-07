import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/wallpaper/views/wallpaper_home.dart';

import 'fonts/view/home.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Category'),
        ),
        body: Column(
          children: [
            SizedBox(height: height * 0.02),
            Container(
              margin: EdgeInsets.all(width * 0.02),
              child: Ink(
                width: width,
                height: height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: const NetworkImage(
                          "https://source.unsplash.com/1600x900/?wallpapers"),
                    )),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const WallpaperHome());
                  },
                  child: Center(
                    child: Text(
                      'Wallpapers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.08,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              margin: EdgeInsets.all(width * 0.02),
              child: Ink(
                width: width,
                height: height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: const NetworkImage(
                          'https://source.unsplash.com/1600x900/?font'),
                    )),
                child: InkWell(
                  onTap: () {
                    Get.to(() => FontsHome());
                  },
                  child: Center(
                    child: Text(
                      'Fonts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.08,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
