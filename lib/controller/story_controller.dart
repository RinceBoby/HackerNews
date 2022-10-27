import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hacker_news/model/story_model.dart';
import 'package:hacker_news/service/story/story_service.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryController extends GetxController {
  RxList<StoryModel> allStories = <StoryModel>[].obs;

  Future<List<StoryModel>?> topstories() async {
    try {
      var response = await StoryServices().getTopStories();
      final stories = response?.map((response) {
        final json = jsonDecode(response.body);
        return StoryModel.fromJSON(json);
      }).toList();
      return stories;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Future<void> CALL(String url) async {
  //   final Uri uri = Uri(
  //     scheme: "https",
  //   );
  //   if (await canLaunchUrl(uri)) {
  //     await launchurl();
  //   } else {
  //     throw "cannot launch $url";
  //   }
  // }

  // launchurl() async {
  //   const url = 'https://www.youtube.com/channel/UCS3brcF49FE3japE2xM-8gg';
  //   if (await canLaunchUrl(UndoTextIntent())) {
  //     await launchurl();
  //   } else {
  //     throw "cannot launch $url";
  //   }
  // }

  @override
  void onInit() {
    topstories().then((value) {
      allStories.value = value!;
    });
    super.onInit();
  }
}
