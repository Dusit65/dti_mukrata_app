import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/saulogo.png',
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            'Tech SAU BUFFET',
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.040,
              color: Colors.deepOrange,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            'แอปพลิเคชันร้านหมูกระทะ',
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.020,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Text(
            'เพื่อคนไทย',
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.020,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Text(
            'โดยเด็กไทย',
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.020,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Text(
            'สนใจแอปพลิเคชันติดต่อ',
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.020,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Text(
            'เด็กไอที SAU',
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.040,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Image.asset(
            'assets/images/sauqr.png',
            width: MediaQuery.of(context).size.width * 0.35,
          ),
        ],
      )),
    );
  }
}
