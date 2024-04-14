import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_bot/feauters/views/search_page.dart';

import 'package:shopping_bot/feauters/views/widgedts/SlidingWidget.dart';

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
    navigateToHome();
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(animationController);
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });

    // Start the animation
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingWidget(slidingAnimation: slidingAnimation),
        const SizedBox(
          height: 4,
        ),

        //  position: slidingAnimation,
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(() => SearchPage());
        //     // calculations
        //     transition: Transition.fade,
        //     duration: kTranstionDuration);

        // GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
