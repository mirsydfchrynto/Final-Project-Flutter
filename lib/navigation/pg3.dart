import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pg3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            // Profile Picture
            Positioned(
              top: 79,
              left: MediaQuery.of(context).size.width / 2 - 50, // Center horizontally
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/screens/pp.png'),
              ),
            ),
            // Title
            Positioned(
              top: 184,
              left: 105,
              right: 105,
              child: Text(
                'Mobile Flutter',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Email
            Positioned(
              top: 221,
              left: 111,
              right: 111,
              child: Text(
                'MobileKotlin@mail.com',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Card Container
            Positioned(
              top: 270,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 542,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 38.6,
                      spreadRadius: 0,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 188,
                right: 30,
                left: 30,
                child: Container(
                  child: Text(
                    "Settings & Preferences",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                      fontFamily: 'Sora',
                    ),
                  ),
            )
            )
          ],
        ),
      ),
    );
  }
}
