import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class StoryServices {
  //<<<<<Single_Story>>>>>//
  Future<Response> getStory(int storyId) async {
    final getStoryUrl = Uri.parse(
        "https://hacker-news.firebaseio.com/v0/item/$storyId.json?print=pretty");
    final response = await http.get(getStoryUrl);
    return response;
  }

  //<<<<<Story_List>>>>>//
  Future<List<Response>?> getTopStories() async {
    try {
      final getTopStoriesUrl = Uri.parse(
          "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty");
      final response = await http.get(getTopStoriesUrl);
      Iterable storyIds = jsonDecode(response.body);
      return Future.wait(
        storyIds.take(storyIds.length).map(
          (storyId) {
            return getStory(storyId);
          },
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
