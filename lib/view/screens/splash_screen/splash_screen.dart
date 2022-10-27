import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hacker_news/view/constants/spaces/dimensions.dart';
import 'package:hacker_news/view/constants/styles/colors.dart';
import 'package:hacker_news/view/screens/stories_screen/stories_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _screenhome();
    super.initState();
  }

  _screenhome() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () {},
    );
    Get.offAll( StoriesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 100,
              backgroundColor: kTrans,
              backgroundImage: NetworkImage(
                "https://debarghyadas.com/writes/assets/hn-hn.png",
              ),
            ),
            kHeight10,
            Text(
              "HACKER NEWS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: kWhite
              ),
            )
          ],
        ),
      ),
    );
  }
}
