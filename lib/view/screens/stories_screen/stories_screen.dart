import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/controller/story_controller.dart';
import 'package:hacker_news/view/constants/spaces/dimensions.dart';
import 'package:hacker_news/view/constants/styles/colors.dart';
import 'package:hacker_news/view/widgets/dropdown_button.dart';
import 'package:url_launcher/url_launcher.dart';

class StoriesScreen extends StatelessWidget {
  StoriesScreen({super.key});

  StoryController storyController = Get.put(StoryController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrange,
        centerTitle: true,
        title: const Text(
          "Hacker News",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [AppBarDropDownButton()],
      ),
      body: Obx(() {
        if (storyController.allStories.isEmpty) {
          return const Center(
            child: CupertinoActivityIndicator(
              color: kRed,
            ),
          );
        }
        return ListView.builder(
          itemCount: storyController.allStories.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.amber[200],
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListTile(
                onTap: () async {
                  final Uri uri = Uri(
                      scheme: "https",
                      host: storyController.allStories[index].url);
                  if (!await launchUrl(
                    uri,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw "Can't launchUrl";
                  }
                },

                //<<<<<Title>>>>>//
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    storyController.allStories[index].title!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                //<<<<<Subtitle>>>>>//
                subtitle: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            color: kRed,
                          ),
                          kWidth10,
                          Flexible(
                            child: Text(
                              storyController.allStories[index].url!,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      kHeight10,
                      Row(
                        children: [
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: kRadius15,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Center(
                                child: Text(
                                  storyController.allStories[index].score
                                      .toString(),
                                  style: const TextStyle(color: kWhite),
                                ),
                              ),
                            ),
                          ),
                          kWidth10,
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(text: "by "),
                                TextSpan(
                                  text:
                                      "${storyController.allStories[index].by!} ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                    text: storyController.allStories[index].time
                                        .toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
