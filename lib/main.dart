import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/homescreen/home_screen_provider.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../utils/theme.dart';

void main() {
  runApp(const CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenProvider(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: const OnboardingScreen(),
        );
      },
    );
  }
}
