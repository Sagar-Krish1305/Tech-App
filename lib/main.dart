import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home%20Page/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/Providers/UserProvider.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:provider/provider.dart';

import 'Pages/AuthenticationPage/LoginPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserProvider()
        )
      ],
      child: const MaterialApp(
          home: LoginPage()
      ),
    );
  }
}
