import 'package:flutter/material.dart';
import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/sizes/sizes.dart';
import '../../../../core/common/widgets/default_button_wg.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/route/rout_generator.dart';
import 'auth_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> texts = [
    "From the latest to the greatest hits, play your favorite tracks on Musium now!",
    "Stream your favorite songs — from the newest releases to timeless hits — only on Musium!",
  ];

  final List<String> images = [
    "assets/images/onboarding1.jpg",
    "assets/images/onboarding2.jpg",
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: appW(5)),
      width: _currentPage == index ? appW(32) : appW(8),
      height: appH(8),
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.neonGreen : AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[_currentPage]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: appH(400),
              decoration: BoxDecoration(
                color: AppColors.background.withOpacity(0.85),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(appW(40)),
                  topRight: Radius.circular(appW(40)),
                ),
              ),
              child: Padding(
                padding: scaffoldPadding48,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: texts.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text(
                              texts[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: appW(24),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        texts.length,
                        (index) => _buildDot(index),
                      ),
                    ),
                    SizedBox(height: appH(40)),
                    DefaultButtonWg(
                      title:
                          _currentPage == texts.length - 1
                              ? "Get Started"
                              : "Next",
                      onPressed: () {
                        if (_currentPage < texts.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          AppRoute.go(AuthPage());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
