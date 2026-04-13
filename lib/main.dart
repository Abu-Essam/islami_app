import 'package:flutter/material.dart';
import 'package:islami_c18_dokki/ui/hadeth_details/hadeth_details.dart';
import 'package:islami_c18_dokki/ui/home/home_view.dart';
import 'package:islami_c18_dokki/ui/home/tabs/hadeth_tab/models/hadeth.dart';
import 'package:islami_c18_dokki/ui/home/tabs/quran_tab/models/sura.dart';
import 'package:islami_c18_dokki/ui/intro/intro_screen.dart';
import 'package:islami_c18_dokki/ui/intro/on_boarding_screen.dart';
import 'package:islami_c18_dokki/ui/sura_details/sura_details.dart';
import 'core/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        IntroScreen.routeName: (_) => IntroScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
        SuraDetails.routeName: (context) {
          var sura = ModalRoute.of(context)?.settings.arguments as Sura;
          return SuraDetails(sura: sura);
        },
        HadethDetails.routeName: (context) {
          var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
          return HadethDetails(hadeth: hadeth);
        },
      },
      initialRoute: IntroScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
