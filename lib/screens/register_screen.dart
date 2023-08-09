import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mangakuy_layout/screens/home_screen.dart';
import 'package:mangakuy_layout/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangakuy_layout/services/firebase_auth_method.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mangakuy_layout/utilities/showSnackBar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create credentials
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth!.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            // New user handling
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signUpUser() async {
    try {
      // Call the signUpWithEmail method and wait for it to complete
      await FireBaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: email.text,
        password: password.text,
        username: username.text,
        context: context,
      );
       
    } catch (e) {
      // Handle any errors that occur during the registration process
      print('Error during user registration: $e');
    }
    
      
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: const Color(0xff2d272e),
        child: ListView(
          children: [
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Container(
            //     width: double.infinity,
            //     height: 300,
            //     alignment: Alignment.center,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           image: const DecorationImage(
            //             image: AssetImage('img/logoapp.png'),
            //             fit: BoxFit.cover,
            //           ),
            //           border: Border.all(color: Colors.white, width: 1),
            //           borderRadius:
            //               const BorderRadius.all(Radius.circular(100))),
            //       height: 150,
            //       width: 150,
            //     ),
            //   ),
            // ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(50),
                //     topRight: Radius.circular(50)),
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
                              'Hi!',
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
                              'Create a new account.',
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
                            TextFormField(
                              controller: username,
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
                            TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              enableSuggestions: true,
                              autocorrect: true,
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
                                  labelText: 'Email',
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
                            TextFormField(
                              controller: password,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
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
                  // Container(
                  //   padding:
                  //       const EdgeInsets.only(top: 15, left: 25, right: 25),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           Text(
                  //             'Forget Password',
                  //             style: GoogleFonts.poppins(
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.black),
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),

                  // BUTTON

                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: Column(
                      children: [
                        TextButton(
                          child: Text(
                            'REGISTER',
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
                          onPressed: signUpUser,
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
                        InkWell(
                          onTap: () {
                            signInWithGoogle(context);
                          },
                          child: Container(
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

                  //Sign In
                  Container(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        GestureDetector(
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (m) => const LoginScreen()));
                          },
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
