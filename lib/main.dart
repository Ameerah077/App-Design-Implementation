import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/pin_login_screen.dart';
import 'screens/main_layout.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/cards_screen.dart';
import 'screens/payments_screen.dart';
import 'screens/beneficiaries_screen.dart';
import 'screens/quick_transfer.dart';

void main() {
  runApp(const MyBankApp());
}

class MyBankApp extends StatelessWidget {
  const MyBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Bank',
      theme: ThemeData(fontFamily: 'SF Pro'),

      home: const SplashScreen(),

      routes: {
        '/pin': (context) => const PinLoginScreen(),
        '/main': (context) => const MainLayout(),
        '/beneficiaries': (context) => const BeneficiariesScreen(),
        '/quick_transfer': (context) => const QuickTransferScreen(),
        '/cards': (context) => const CardsScreen(),
        '/payment': (context) => const PaymentsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
