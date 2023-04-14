import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangakuy_layout/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: const Color(0xff2d272e),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 300,
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('img/logo-app.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Container(
              height: 551,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 25, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Welcome!',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Sign in to your account',
                              style: GoogleFonts.poppins(
                                letterSpacing: 2.0,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 25, top: 25, right: 25),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1.5, color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1.5, color: Colors.black),
                                  ),
                                  labelText: 'Username',
                                  labelStyle: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 25, top: 25, right: 25),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 5)),
                            TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1.5, color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1.5, color: Colors.black),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget Password',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  // BUTTON

                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: Column(
                      children: [
                        TextButton(
                          child: Text(
                            'LOGIN',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xff2d272e),
                            fixedSize: const Size(double.maxFinite, 40),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (m) => const HomeScreen()));
                          },
                        )
                      ],
                    ),
                  ),

                  // OR

                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 25),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        Text(
                          ' OR ',
                          style: GoogleFonts.poppins(
                            letterSpacing: 2.0,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        )
                      ],
                    ),
                  ),

                  // GOOGLE TWEET FB

                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: SvgPicture.asset(
                            '/svg/google-svgrepo-com.svg',
                            height: 30,
                            width: 30,
                            fit: BoxFit.scaleDown,
                          ),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 25)),
                        Container(
                          child: SvgPicture.asset(
                            '/svg/facebook-svgrepo-com.svg',
                            height: 30,
                            width: 30,
                            fit: BoxFit.scaleDown,
                          ),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 25)),
                        Container(
                          child: SvgPicture.asset(
                            '/svg/twitter-svgrepo-com.svg',
                            height: 30,
                            width: 30,
                            fit: BoxFit.scaleDown,
                          ),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Sign UP
                  Container(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't Have an account ?",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
