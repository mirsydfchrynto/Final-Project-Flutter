import 'package:final_project/navigation/home.dart';
import 'package:final_project/navigation/pg1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:final_project/constant/colors.dart';
// import 'package:final_project/screens/login_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
          ),
          Positioned(
              child: Container(
                child: Image.asset('assets/screens/Image Onboarding.png'),
              )),
          Positioned(
              top: 470,
              right: 0,
              left: 0,
              child: Stack(
                children: [
                  Container(
                    child: Image.asset('assets/screens/Shadow Container.png'),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 24, top: 36, right: 24, bottom: 142),
                      child: Column(
                        children: [
                          Text(
                            "Empower Your  \nJourney in IT with  \nPlugin!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sora(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Welcome to Plugin, your gateway to endless \nIT possibilities!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFA2A2A2)),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          SizedBox(
                            height: 56,
                            width: 327,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF6A6A6A),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()),
                                    (route) => false);
                              },
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.sora(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
