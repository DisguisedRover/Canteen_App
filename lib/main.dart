import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test01/pages/home_page.dart';
import 'package:test01/pages/intro_page.dart';
import 'package:test01/pages/menu_page.dart';
import 'package:test01/firebase_options.dart';
import 'package:test01/models/canteen.dart';
import 'package:test01/services/auth/auth_gate.dart';
import 'package:test01/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        // Theme Proveider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        //canteen provider
        ChangeNotifierProvider(create: (context) => Canteen()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
        theme: Provider.of<ThemeProvider>(context).themeData,
        routes: {
          '/intropage': (context) => const IntroPage(),
          '/homepage': (context) => const HomePage(),
          '/menupage': (context) => const MenuPage(),
        });
  }
}
