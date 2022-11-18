import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shoe_cart/view/user_login/login_screen.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.black,
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      showBackButton: false,
      next: const Text('Next'),
      skip: const Text('Skip'),
      done: const Text('Get Started'),
      onDone: () {
        Get.offAll(() =>  LoginScreen());
      },
      onSkip: () {},
      pages: getPage(),
    );
  }
}

List<PageViewModel> getPage() {
  return [
    PageViewModel(
      title: '',
      bodyWidget: const Padding(
        padding: EdgeInsets.symmetric(vertical: 250),
        child: Text(
          'Flutter',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
      decoration: const PageDecoration(pageColor: Colors.black),
    ),
    PageViewModel(
      title: 'Welcome to  My Shop',
      body:
          'The best sneakers & shoes e-commerce app of the century for your fashion needs!',
      image: Lottie.network(
        'https://assets8.lottiefiles.com/private_files/lf30_9kdbftpx.json',
      ),
      decoration: const PageDecoration(
          imageFlex: 2,
          bodyFlex: 1,
          bodyAlignment: Alignment.topLeft,
          imageAlignment: Alignment.center,
          titlePadding: EdgeInsets.all(0),
          contentMargin: EdgeInsets.all(0),
          pageColor: Color.fromARGB(253, 6, 218, 251)),
    ),
    PageViewModel(
      title: '',
      body: " Let's fullfill your fashion needs with  shoea right now!",
      image: Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_bivaxhip.json',
      ),
      decoration: const PageDecoration(
          imageFlex: 3,
          bodyFlex: 1,
          bodyAlignment: Alignment.topLeft,
          imageAlignment: Alignment.center,
          titlePadding: EdgeInsets.all(0),
          contentMargin: EdgeInsets.all(10),
          pageColor: Color.fromARGB(253, 6, 218, 251)),
    ),
  ];
}
