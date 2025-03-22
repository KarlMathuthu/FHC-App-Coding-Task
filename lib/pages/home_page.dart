import 'package:fhc_app_task/models/competition.dart';
import 'package:fhc_app_task/pages/tabs/explore_tab.dart';
import 'package:fhc_app_task/pages/tabs/home_tab.dart';
import 'package:fhc_app_task/pages/tabs/leaderboards_tab.dart';
import 'package:fhc_app_task/pages/tabs/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CompetitionModel> competitions = [];

  late List<Widget> pages;

  List<String> tabsSvgIcons = [
    "assets/icons/home.svg",
    "assets/icons/leaderboard.svg",
    "assets/icons/explore.svg",
    "assets/icons/settings.svg",
  ];

  @override
  void initState() {
    super.initState();
    pages = [HomeTab(), LeaderboardsTab(), ExploreTab(), SettingsPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("FH Creatives"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Leaderboard"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Settings"),
        ],
      ),
    );
  }
}
