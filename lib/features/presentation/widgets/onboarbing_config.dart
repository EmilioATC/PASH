import 'package:flutter/material.dart';
import 'package:isar_app/features/presentation/screens/actividades_screen.dart';
import 'package:isar_app/features/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('is_first_time') ?? true;

    if (isFirstTime) {
      // Navegar al Onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnBoardingScreen()),
      );

      // Guardar que ya no es la primera vez
      await prefs.setBool('is_first_time', false);
    } else {
      // Navegar directo al Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ActividadesScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
