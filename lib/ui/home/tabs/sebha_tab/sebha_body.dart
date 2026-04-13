import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c18_dokki/theme/colors.dart';
import 'package:audioplayers/audioplayers.dart';

class SebhaBody extends StatefulWidget {
  const SebhaBody({super.key});

  @override
  State<SebhaBody> createState() => _SebhaBodyState();
}

class _SebhaBodyState extends State<SebhaBody> {
  int counter = 0;
  double turns = 0.0;
  int phraseIndex = 0;
  List<String> phrases = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 23,
          child: Image.asset('assets/images/sebha_head.png', width: 120),
        ),
        Padding(
          padding: EdgeInsets.only(top: 68),
          child: AnimatedRotation(
            turns: turns,
            duration: Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: onSebhaClicked,
              child: Image.asset(
                'assets/images/sebha_body.png',
                width: width * 0.9,
              ),
            ),
          ),
        ),
        Column(
          spacing: 16,
          children: [
            SizedBox(height: 200),
            Text(
              phrases[phraseIndex],
              style: TextStyle(
                fontFamily: 'janna',
                fontSize: 36,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$counter',
              style: TextStyle(
                fontFamily: 'janna',
                fontSize: 36,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onSebhaClicked() async {
    setState((){
      // to turn exactly one bead radius
      turns += (1 / 33);

      counter++;
    });

      if (counter == 33) {
        counter = 0;
        phraseIndex = (phraseIndex + 1) % phrases.length;
        HapticFeedback.heavyImpact();
        await audioPlayer.stop();
        audioPlayer.play(AssetSource('sounds/success.mp3'));
      } else {
        HapticFeedback.selectionClick();
        await audioPlayer.stop();
        audioPlayer.play(AssetSource('sounds/click.mp3'));
      }

  }
}
