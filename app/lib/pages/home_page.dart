import 'package:app/database/dbhelper.dart';
import 'package:app/pages/category_page.dart';
import 'package:app/pages/settings_pages.dart';
import 'package:app/pages/trip_page.dart';
import 'package:app/provider/categories_provider.dart';
import 'package:app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'categoriesTest.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => CategoriesProvider(),
      child: MaterialApp(
        theme: MyThemes.darkTheme,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Trip Manage Exepense "),
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 20),
                  child: Icon(Icons.search),
                )
              ],
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.category)),
                  Tab(icon: Icon(Icons.settings)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                TripPage(),
                CategoriesTest(),
                SettingPage(),
              ],
            ),
          ),
        ),
      ));
}
