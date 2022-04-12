import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_const
      drawer: Drawer(
        child: Column(
          children: [],
        ),
      ),
      body: const Center(child: const Text("home page center ")),
    );
  }
}
