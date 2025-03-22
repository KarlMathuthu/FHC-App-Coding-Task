import 'package:fhc_app_task/models/competition.dart';
import 'package:fhc_app_task/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<CompetitionModel> competitions = [
    CompetitionModel(
      name: "Win a Trip to Cape Town",
      category: "Travel",
      startDate: "2025-03-01",
      endDate: "2025-03-31",
      description: "Enter to win a luxurious trip for two to Cape Town!",
    ),
    CompetitionModel(
      name: "Tech Gadget Giveaway",
      category: "Technology",
      startDate: "2025-03-15",
      endDate: "2025-04-15",
      description:
          "Win the latest smartphone by entering this exciting giveaway.",
    ),
    CompetitionModel(
      name: "Fitness Challenge",
      category: "Health & Wellness",
      startDate: "2025-02-15",
      endDate: "2025-03-20",
      description:
          "Participate in the challenge to win exclusive gym memberships.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            // Currently featured / trending competitions.
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage("assets/images/travel.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withOpacity(0.0), Colors.black],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          "A trip to Cape Town!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Enter to win a luxurious trip for two to Cape Town!",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // filtering section.
            Row(
              children: [
                SizedBox(width: 16),
                Text(
                  "Trending",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/filter.svg",
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            // Competitions list.
            // Expired competitions
          ],
        ),
      ),
    );
  }
}


// Created by https://www.github.com/KarlMathuthu