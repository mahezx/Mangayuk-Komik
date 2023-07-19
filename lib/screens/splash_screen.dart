import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mangakuy_layout/screens/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Random random = Random();
  double tinggi = 300;
  double lebar = 300;
  int splashTime = 40;
  double _width = 50;
  double _height = 50;
  int opacitynya = 0;
  Color _warnaAbu = Color(0xff2d272e);
  Color transparan = Colors.transparent;
  Color transparan2 = Colors.transparent;
  Color putih = Colors.white;
  bool selected = true;
  bool isColor = true;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashTime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.bounceOut,
        alignment: Alignment.center,
        color: isColor ? putih : _warnaAbu,
        child: GestureDetector(
          onTap: () {
            setState(() {
              // _width = random.nextInt(300).toDouble();
              if (selected) {
                lebar = 200;
                tinggi = 200;
                isColor = !isColor;
                _width = 200;
              }
            });
          },
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.bounceInOut,
                    width: lebar,
                    height: tinggi,
                    decoration: BoxDecoration(
                      border: Border.all(color : isColor ? transparan2 : Colors.white),
                        image: DecorationImage(
                            image: AssetImage('/img/logo-app.png')),
                        borderRadius: BorderRadius.circular(100))),
                SizedBox(
                  height: 100,
                ),
                AnimatedContainer(
                  child: DefaultTextStyle(
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: isColor ? transparan2 : Colors.white,
                      ),
                      child:
                          AnimatedTextKit(repeatForever: true, animatedTexts: [
                        TyperAnimatedText("L o a d i n g . . .",
                            speed: Duration(milliseconds: 100)),
                      ])),
                  duration: Duration(seconds: 1),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isColor ? transparan : putih,
                  ),
                  width: _width,
                  height: _height,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
