import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/res/media.dart';
import '../../../../core/route/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String path = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isFaded = false;

  @override
  void initState() {
    super.initState();

    // fade-in effect
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        setState(() {
          _isFaded = true;
        });
      }
    });

    // auto navigation
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
       // debugPrint("👉 Splash finished, navigating to Dashboard...");
        Get.offAndToNamed(AppRoutes.dashboardScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'splash',
                    child: AnimatedOpacity(
                      opacity: _isFaded ? 1 : 0,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeIn,
                      child: Image.asset(
                        Media.splashLogo,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: _isFaded ? 1 : 0,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeIn,
                    child: Text.rich(
                      TextSpan(
                        text: "IN",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "VENTORY",
                            style: TextStyle(
                              color: const Color(0xFF1F75FE),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
