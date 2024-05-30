import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Formatting/Colors.dart';
import 'package:flutter_app/Pages/AuthenticationPage/LoginPage.dart';
import 'package:flutter_app/Pages/Home%20Page/homepage.dart';
import 'package:provider/provider.dart';
import '../../Providers/UserProvider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.mainBackgroundColor,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              // width: 100,
              height: 56,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome To',
                  style: TextStyle(
                      color: CustomTheme.mainTextColor,
                      fontSize: 48,
                      fontFamily: 'Roboto'
                  ),
                ),
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Techsolver',
                      style: TextStyle(
                          color: CustomTheme.mainTextColor,
                          fontSize: 48,
                          fontFamily: 'Open Sans'
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  'Hub',
                  style: TextStyle(
                      color: CustomTheme.thatOrangeColor,
                      fontSize: 48,
                      fontFamily: 'Open Sans'
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 100,
              height: 80,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'email',
                  style: TextStyle(
                    fontSize: 18,
                      color: CustomTheme.mainTextColor
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: CustomTheme.secondaryBackgroundColor
                  ),
                  width: 3*MediaQuery.of(context).size.width/4,
                  child: TextField(
                    controller: _emailTextEditingController,
                    style: const TextStyle(
                        color: CustomTheme.mainTextColor,
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your email...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      hintStyle: const TextStyle(
                        color: CustomTheme.mainTextColor,
                      ),

                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'username',
                  style: TextStyle(
                    fontSize: 18,
                      color: CustomTheme.mainTextColor
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: CustomTheme.secondaryBackgroundColor
                  ),
                  width: 3*MediaQuery.of(context).size.width/4,
                  child: TextField(
                    controller: _usernameTextEditingController,
                    style: const TextStyle(
                        color: CustomTheme.mainTextColor,
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your username...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      hintStyle: const TextStyle(
                        color: CustomTheme.mainTextColor,
                      ),

                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'password',
                  style: TextStyle(
                      fontSize: 18,
                      color: CustomTheme.mainTextColor
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: CustomTheme.secondaryBackgroundColor
                  ),
                  width: 3*MediaQuery.of(context).size.width/4,
                  child: TextField(
                    controller: _passwordTextEditingController,
                    style: const TextStyle(
                        color: CustomTheme.mainTextColor,
                        fontSize: 20
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your username...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: CustomTheme.secondaryBackgroundColor,
                          )
                      ),

                      hintStyle: const TextStyle(
                        color: CustomTheme.mainTextColor,
                      ),

                    ),
                  ),
                ),
              ],
            ),


            const SizedBox(
              width: 100,
              height: 60,
            ),

            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(CustomTheme.secondaryBackgroundColor),
                ),
                onPressed: () async {
                  String username = _usernameTextEditingController.text;
                  String password = _passwordTextEditingController.text;
                  String email = _emailTextEditingController.text;
                  
                  if(username.isEmpty || password.isEmpty || email.isEmpty){
                    // TODO: Add Toast For filling all fields
                    return;
                  }
                  
                  try{
                   await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  }catch(e){
                    print(e.toString());
                  }

                  // TODO: Add Toast for Successful Sign UP and Navigate to Login Page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()
                      ));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: CustomTheme.mainTextColor,
                      fontSize: 18
                  ),
                )
            ),
            const SizedBox(height: 25,),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()
                      ));
                },
                child: const Text(
                  'Already have an Account?',
                  style: TextStyle(
                      color: CustomTheme.mainTextColor,
                      fontSize: 18
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
