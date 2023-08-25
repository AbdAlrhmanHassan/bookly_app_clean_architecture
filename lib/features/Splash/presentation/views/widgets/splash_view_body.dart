import 'package:bookly_app_advanced_course/constants.dart';
import 'package:bookly_app_advanced_course/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.kAppPrimaryLogoPath,
          width: 50,
          height: 50,
        ),
        const SizedBox(height: 6),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2.5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(kTranstionDuration, () {
      GoRouter.of(context).push('/homeView');
    });
  }
}
