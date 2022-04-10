import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome !',
              body:
                  '''Worried about managing exepenses in groupe travel ? Here you go ''',
              image: buildImage('assets/logo.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '''Manage your trip   Expense !''',
              body: '''Get glimpse everyon's exepense  managed in realtime ''',
              image: buildImage('assets/logo1.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Let's Go Travel ",
              body: '''Enjoy every moment with your friend and family  ''',
              image: buildImage('assets/plane.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: const Text('Start',
              style: const TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: const Text('Skip'),
          onSkip: () => goToHome(context),
          next: const Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          //globalBackgroundColor: Theme.of(context).primaryColor,
          //skipFlex: 0,
          // nextFlex: 0,
          // isProgressTap: true,
          // isProgress: true,
          showNextButton: false,
          // freeze: true,
          // animationDuration: 10,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        //color: const Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  // ignore: prefer_const_constructors
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: const TextStyle(fontSize: 20),
        //descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        // pageColor: Colors.white,
      );
}
