import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_cleaning/firebase_options.dart';
import 'package:house_cleaning/utils/theme_manager.dart';
import 'package:house_cleaning/provider/auth_provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:house_cleaning/provider/theme_provider.dart';
import 'package:house_cleaning/screens/auth/login_screen.dart';
import 'package:house_cleaning/screens/auth/register_screen.dart';
import 'package:house_cleaning/screens/splash/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:house_cleaning/screens/onboarding/on_borading_screen.dart';
import 'package:house_cleaning/screens/auth/continue_registeration_screen.dart';
import 'package:house_cleaning/screens/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:house_cleaning/screens/selection_screen/role_selection_page.dart';

void main() async {
//initialize supabase
  await Supabase.initialize(
    url: 'https://rzpxyksefuzvhdhqxwra.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6cHh5a3NlZnV6dmhkaHF4d3JhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIyMDgyMjIsImV4cCI6MjA0Nzc4NDIyMn0.JQzYF0bif1qWY9fUKzKpIGiSiWFWbbs7WIaQ7PAd6v0',
  );

  //initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
      appleProvider: AppleProvider.debug,
      androidProvider: AndroidProvider.debug);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const HouseCleaningApp());
  });
}

class HouseCleaningApp extends StatefulWidget {
  const HouseCleaningApp({super.key});

  @override
  State<HouseCleaningApp> createState() => _HouseCleaningAppState();
}

class _HouseCleaningAppState extends State<HouseCleaningApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log("'User is currently signed out!'");
      } else {
        log('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AuthProviderr()),
        ],
        child:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              OnboardingScreen.onBoardingRoute: (context) =>
                  const OnboardingScreen(),
              SplashScreen.splashRoute: (context) => const SplashScreen(),
              BottomBarScreen.routeName: (context) => const BottomBarScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              RoleSelectionPage.routeName: (context) =>
                  const RoleSelectionPage(),
              ContinueRegisterationScreen.continueRegisterationRoute:
                  (context) => const ContinueRegisterationScreen(),
            },
            initialRoute: RoleSelectionPage.routeName,
            //SplashScreen.splashRoute,
            theme: ThemeManager.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          );
        }));
  }
}
