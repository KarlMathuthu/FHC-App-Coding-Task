import 'package:fhc_app_task/pages/tabs/explore_tab.dart';
import 'package:fhc_app_task/pages/tabs/home_tab.dart';
import 'package:fhc_app_task/pages/tabs/leaderboards_tab.dart';
import 'package:fhc_app_task/pages/tabs/settings_page.dart';
import 'package:fhc_app_task/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  late List<Widget> pages;

  List<String> tabsSvgIcons = [
    "assets/icons/home.svg",
    "assets/icons/leaderboard.svg",
    "assets/icons/explore.svg",
    "assets/icons/settings.svg",
  ];

  SvgPicture tabIconWidget(int index) {
    return SvgPicture.asset(
      tabsSvgIcons[index],
      width: 22,
      height: 22,

      colorFilter: ColorFilter.mode(
        index == currentPage
            ? AppColors.primaryColor
            : AppColors.inActiveTabColor,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pages = [HomeTab(), LeaderboardsTab(), ExploreTab(), SettingsPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("FH Creatives", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/bell.svg",
              width: 22,
              height: 22,

              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: pages[currentPage],
      bottomNavigationBar: Theme(
        data: ThemeData(splashColor: Colors.transparent),
        child: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedLabelStyle: GoogleFonts.poppins(),
            unselectedLabelStyle: GoogleFonts.poppins(),
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.inActiveTabColor,
            backgroundColor: AppColors.surfaceColor,
            currentIndex: currentPage,
            onTap: (newPage) {
              setState(() {
                currentPage = newPage;
              });
            },
            items: [
              BottomNavigationBarItem(icon: tabIconWidget(0), label: "Home"),
              BottomNavigationBarItem(icon: tabIconWidget(1), label: "Leading"),
              BottomNavigationBarItem(icon: tabIconWidget(2), label: "Explore"),
              BottomNavigationBarItem(
                icon: tabIconWidget(3),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Created by https://www.github.com/KarlMathuthu