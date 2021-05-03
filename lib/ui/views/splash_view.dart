import 'package:flutter/material.dart';
import 'package:money_save/ui/shared/app_colors.dart';
import 'package:money_save/ui/views/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(child: buildSplashScreen()));
  }

  buildSplashScreen() {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: HomePage(),
        title: new Text(
          'Money Save',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        image: new Image.asset(
          'assets/icons/wallet.png',
          height: 100,
          width: 100,
        ),
        backgroundColor: backgroundColor,
        loadingText: Text(
          'Место для всех ваших расходов.',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        photoSize: 100.0,
        loaderColor: Colors.orange);
  }
}
