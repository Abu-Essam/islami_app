import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/theme/colors.dart';
import 'package:islami_c18_dokki/ui/intro/on_boarding_page_view.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = '/onBoarding';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        spacing: 32,
        children: [
          SafeArea(
            child: Center(
              child: Image.asset(
                'assets/images/img_header.png',
                width: width * 0.75,
              ),
            ),
          ),
          OnBoardingPageView(),
        ],
      ),
    );
  }
}
