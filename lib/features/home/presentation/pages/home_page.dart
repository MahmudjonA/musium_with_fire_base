import 'package:flutter/material.dart';
import 'package:musium/core/common/colors/app_colors.dart';
import 'package:musium/core/responsiveness/app_responsive.dart';
import 'package:musium/features/home/presentation/widgets/category_wg.dart';

import '../widgets/top_mixes_wg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categories = [
    {"image": "assets/images/coffee.png", "title": "Coffee & Jazz"},
    {"image": "assets/images/new.png", "title": "RELEASED"},
    {"image": "assets/images/women.png", "title": "Anything Goes"},
    {"image": "assets/images/anime.png", "title": "Anime OSTs"},
    {"image": "assets/images/man.png", "title": "Harry’s House"},
    {"image": "assets/images/lofi.png", "title": "Lo-Fi Beats"},
  ];

  final topMixes = [
    {
      "image": "assets/images/pop.png",
      "title": "Pop Mix",
      ''
              "color":
          Colors.red,
    },
    {
      "image": "assets/images/chill.png",
      "title": "Chill Mix",
      "color": Colors.yellow,
    },
    {"image": "assets/images/kpop.png", "title": "Kpop", "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.grey,
              radius: 25,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: appH(15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: appH(5)),
                Text(
                  'User Name',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart, color: AppColors.white, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: AppColors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.white, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Continue Listening",
              style: TextStyle(
                color: AppColors.white,
                fontSize: appH(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: appH(20)),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: appH(11),
                crossAxisSpacing: appW(11),
                childAspectRatio: 2.8,
              ),
              itemBuilder: (context, index) {
                final item = categories[index];
                return CategoryWg(
                  imagePath: item["image"]!,
                  title: item["title"]!,
                );
              },
            ),
            SizedBox(height: appH(25)),
            Text(
              "Your Top Mixes",
              style: TextStyle(
                color: AppColors.white,
                fontSize: appH(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: appH(20)),
            SizedBox(
              height: appH(150),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topMixes.length,
                itemBuilder: (context, index) {
                  final item = topMixes[index];
                  return TopMixesWg(
                    image: item["image"] as String,
                    title: item["title"] as String,
                    borderColor: item["color"] as Color,
                  );
                },
              ),
            ),
            SizedBox(height: appH(20)),
            Text(
              "Based on your recent listening",
              style: TextStyle(
                color: AppColors.white,
                fontSize: appH(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: appH(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/die.png",
                    width: appW(182),
                    height: appH(182),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: appW(20)),
                  Image.asset(
                    "assets/images/player.png",
                    width: appW(182),
                    height: appH(182),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: appW(20)),
                  Image.asset(
                    "assets/images/player.png",
                    width: appW(182),
                    height: appH(182),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
