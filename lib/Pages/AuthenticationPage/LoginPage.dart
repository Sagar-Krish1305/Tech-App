import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Formatting/Colors.dart';
import 'package:flutter_app/Pages/AuthenticationPage/SignUpPage.dart';
import 'package:flutter_app/Pages/Home%20Page/homepage.dart';
import 'package:provider/provider.dart';
import '../../Providers/UserProvider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _usernameTextEditingController = TextEditingController();
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

            SizedBox(height: 55,),

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
              height: 75,
            ),

            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(CustomTheme.secondaryBackgroundColor),
                ),
                onPressed: () async{
                  String username = _usernameTextEditingController.text;
                  String password = _passwordTextEditingController.text;
                  if(username == '' || password == '') return;

                  try{
                    QuerySnapshot userSearchQuery = await _firestore
                        .collection('user')
                        .where('username', isEqualTo: username)
                        .get();

                    print('Successful Search');
                    if(userSearchQuery.docs.isEmpty){
                      print('No User Found');
                      return;
                    }

                    String email = userSearchQuery.docs[0]['email'];

                    // await _auth.signInWithEmailAndPassword(
                    //     email: email,
                    //     password: password
                    // );
                    context.read<UserProvider>().changeUsername(
                        newUsername: username
                    );
                    print('Login Successful');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        )
                    );

                  }catch(e){
                    print(e.toString());
                  }
                },
                child: Text(
                    'Login',
                  style: TextStyle(
                    color: CustomTheme.mainTextColor,
                    fontSize: 18
                  ),
                )
            ),
            const SizedBox(height: 45,),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(CustomTheme.secondaryBackgroundColor),
                ),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()
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
                onPressed: () async {
                  String username = _usernameTextEditingController.text;
                  String password= _passwordTextEditingController.text;
                  
                  if(username.isEmpty || password.isEmpty){
                    // TODO: Add Toast for filling all credentials
                    return;
                  }
                  try{
                    QuerySnapshot q = await _firestore
                        .collection('user')
                        .where('username', isEqualTo: username)
                        .get();

                    if (q.docs.isEmpty) {
                      // TODO: Add Toast That no user Found
                      return;
                    }

                    String email = q.docs.first['email'];

                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password
                    );

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const HomePage()
                        ));
                  }catch(e){
                    print(e.toString());
                  }
                },
                child: const Text(
                    'Forgot Password?',
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
