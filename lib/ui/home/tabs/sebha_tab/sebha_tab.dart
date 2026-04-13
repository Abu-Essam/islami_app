import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/theme/colors.dart';
import 'package:islami_c18_dokki/ui/home/tabs/sebha_tab/sebha_body.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turns = 0.0;
  int phraseIndex = 0;
  List<String> phrases = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/sebha_bg.png',
            height: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.black, AppColors.black.withAlpha(190)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Image.asset('assets/images/img_header.png', width: width * 0.7),
                SizedBox(height: 36),
                Image.asset('assets/images/sebha_title.png'),
                SizedBox(height: 16),
                SebhaBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
