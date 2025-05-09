import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../widgets/custom_choice_chip_wg.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int selectedIndex = -1;
  final List<String> options = [
    'Playlists',
    'Artists',
    'Albums',
    'Songs',
    'Podcasts',
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
            Image.asset('assets/images/logo.jpg', width: 50, height: 50),
            SizedBox(width: appW(15)),
            Text(
              'Your Library',
              style: TextStyle(
                color: Colors.white,
                fontSize: appH(27),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          spacing: appH(20),
          children: [
            SizedBox(
              height: appH(42),
              child: ListView.builder(
                itemCount: options.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => CustomChoiceChipWg(
                      index: index,
                      label: options[index],
                      selectedIndex: selectedIndex,
                      onSelected: (selected) {
                        setState(() {
                          selectedIndex = selected ? index : selectedIndex;
                        });
                      },
                    ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: appW(56),
                  height: appH(56),
                  decoration: BoxDecoration(
                    color: AppColors.neonGreen,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Icon(Icons.add)),
                ),
                SizedBox(width: appW(10)),
                Text(
                  'Add New Playlist',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: appH(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: appW(56),
                  height: appH(56),
                  decoration: BoxDecoration(
                    color: AppColors.neonGreen,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Icon(Icons.favorite_border)),
                ),
                SizedBox(width: appW(10)),
                Text(
                  'Your Liked Songs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: appH(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            GestureDetector(
              child: Row(
                children: [
                  Icon(
                    Icons.compare_arrows,
                    color: AppColors.grey,
                    size: appH(30),
                  ),
                  SizedBox(width: appW(10)),
                  Text(
                    'Recently played',
                    style: TextStyle(
                      color: AppColors.neonGreen,
                      fontSize: appH(16),
                      fontWeight: FontWeight.bold,
                    ),
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
