import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home%20Page/homepage.dart';

void main(){
  runApp(MaterialApp(
    darkTheme: ThemeData.light(),
    home: App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}
