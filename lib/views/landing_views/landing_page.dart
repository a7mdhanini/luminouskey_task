import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luminouskey_task/constants/app_images.dart';
import 'package:luminouskey_task/constants/sizes.dart';
import 'package:luminouskey_task/shared/background.dart';
import 'package:luminouskey_task/views/home_views/home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ///----Background
          const BackGround(
            image: AppImages.background,
          ),

          ///----Body
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ///----Image Logo
              Image.asset(
                AppImages.doctor,
                scale: Sizes.allSize(context) / 330,
              ),

              ///----ts Logo text
              Text(
                'memits',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.allSize(context) / 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.righteous().fontFamily,
                ),
              ),

              ///----LIFE HEALTH CARE text
              Text(
                'LIFE HEALTH CARE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.allSize(context) / 65,
                  fontFamily: GoogleFonts.righteous().fontFamily,
                ),
              ),

              SizedBox(height: Sizes.height(context) / 15),

              ///----LIFE HEALTH CARE text
              Text(
                'Care And Cure \n Is Our Goals',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.allSize(context) / 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: Sizes.height(context) / 35),

              ///----Get Started Button
              InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => const HomePage());
                  Navigator.push(context, route);
                },
                child: Container(
                  width: Sizes.width(context) / 2,
                  height: Sizes.height(context) / 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: Sizes.allSize(context) / 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: Sizes.height(context) / 10),
            ],
          ),
        ],
      ),
    );
  }
}
