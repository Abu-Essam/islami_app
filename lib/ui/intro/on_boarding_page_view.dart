import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/core/cache_helper.dart';
import 'package:islami_c18_dokki/theme/colors.dart';
import 'package:islami_c18_dokki/theme/text_styles.dart';
import 'package:islami_c18_dokki/ui/home/home_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: onBoardingTabs.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Image.asset(onBoardingTabs[index].imagePath),
                    ),
                    Spacer(flex: 1),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          (onBoardingTabs[index].content == null)
                              ? SizedBox(height: 32)
                              : SizedBox(),
                          Text(
                            onBoardingTabs[index].header,
                            style: TextStyles.titleLargeStyle().copyWith(
                              color: AppColors.gold,
                            ),
                          ),
                          SizedBox(height: 48),
                          (onBoardingTabs[index].content != null)
                              ? Text(
                                  onBoardingTabs[index].content!,
                                  style: TextStyles.titleSmallStyle().copyWith(
                                    color: AppColors.gold,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex != 0)
                  TextButton(
                    onPressed: () {
                      {
                        pageController.previousPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text('Back'),
                  ),
                if (currentIndex == 0)
                  Text('Null______', style: TextStyle(color: AppColors.black)),
                SmoothPageIndicator(
                  controller: pageController,
                  count: onBoardingTabs.length,
                  onDotClicked: (index) {
                    setState(() {
                      pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeIn,
                      );
                    });
                  },
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.gold,
                    dotColor: AppColors.gray,
                    dotWidth: 7,
                    dotHeight: 7,
                    spacing: 12,
                  ),
                ),
                if (currentIndex != onBoardingTabs.length - 1)
                  TextButton(
                    onPressed: () {
                      {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text('Next'),
                  ),
                if (currentIndex == onBoardingTabs.length - 1)
                  TextButton(
                    onPressed: () async {
                      {
                        await CacheHelper.saveBool(
                          key: 'isOnBoardingFinished',
                          value: true,
                        );
                        if (!context.mounted) return;
                        Navigator.pushReplacementNamed(
                          context,
                          HomeScreen.routeName,
                        );
                      }
                    },
                    child: Text('Finish'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingTab {
  String imagePath;
  String header;
  String? content;

  OnBoardingTab({required this.imagePath, required this.header, this.content});
}

List<OnBoardingTab> onBoardingTabs = [
  OnBoardingTab(
    imagePath: 'assets/images/welcome.png',
    header: 'Welcome To Islami App',
  ),
  OnBoardingTab(
    imagePath: 'assets/images/kabba.png',
    header: 'Welcome To Islami',
    content: 'We Are Very Excited To Have You In Our Community',
  ),
  OnBoardingTab(
    imagePath: 'assets/images/reading_the_quran.png',
    header: 'Reading the Quran',
    content: 'Read, and your Lord is the Most Generous',
  ),
  OnBoardingTab(
    imagePath: 'assets/images/bearish.png',
    header: 'Bearish',
    content: 'Praise the name of your Lord, the Most High',
  ),
  OnBoardingTab(
    imagePath: 'assets/images/radio.png',
    header: 'Holy Quran Radio',
    content:
        'You can listen to the Holy Quran Radio'
        ' through the application for free and easily',
  ),
];
