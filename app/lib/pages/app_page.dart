import 'package:app/pages/skip_page.dart';
import 'package:flutter/material.dart';

import '../widgets/change_theme_widget.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text("trip exepense manager "),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/logo.png',
            width: 255,
            height: 250,
          ),
          // const Image(image: AssetImage("")),
          const SizedBox(
            height: 70,
          ),
          TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Colors.purple.shade200,
                elevation: 5,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OnBoardingPage()));
              },
              child: Text(
                "get started ",
                style: Theme.of(context).textTheme.button,
              ))
        ],
      )),
    );
  }
}
