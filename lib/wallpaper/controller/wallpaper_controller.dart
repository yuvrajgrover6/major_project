import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WallpaperController extends GetxController {
  final RxList wallpapers = [].obs;
  final String category;
  RxBool initialLoading = false.obs;
  RxBool wallpaperLoading = false.obs;
  final String key = "Mjk8jwayE7NfhdS7Vo07vdgP0QHQtCM8rzVFkXuoSUDjP24Mdo9ppPJD";
  WallpaperController({required this.category});

  RxInt page = 1.obs;
  @override
  void onInit() async {
    initialLoading.value = true;
    await fetchWallpapers();
    initialLoading.value = false;
    super.onInit();
  }

  Future<void> fetchWallpapers() async {
    final api = "https://api.pexels.com/v1/search?query=$category&per_page=80";
    final w = await http.get(Uri.parse(api), headers: {"Authorization": key});
    Map data = jsonDecode(w.body);
    wallpapers.value = data['photos'];
  }

  Future<void> loadMore() async {
    wallpaperLoading.value = true;
    final api = "https://api.pexels.com/v1/search?query=$category&per_page=80";
    page.value++;
    final apiWithPage = "$api&page=$page";
    final w =
        await http.get(Uri.parse(apiWithPage), headers: {"Authorization": key});
    Map data = jsonDecode(w.body);
    wallpapers.addAll(data['photos']);
    wallpaperLoading.value = false;
  }
}
