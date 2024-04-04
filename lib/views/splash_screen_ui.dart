import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // Delay 3 second and open to IntroductionUI page
    Future.delayed(
        Duration(
          // days: 366,
          seconds: 3,
        ),
        // until 3 sec open to next page that you want
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeUI(),
              ),
            ));

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width * 0.65,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Tech SAU BUFFET',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.045,
                color: Colors.white,
              ),
            ),
            Text(
              'Copyright ©️ 2024 by Dusit6552410011',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
//Version (opional)
            // Text(
            //   'Version 1.0.0',
            //   style: GoogleFonts.kanit(
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
