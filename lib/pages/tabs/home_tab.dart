import 'package:chip_list/chip_list.dart';
import 'package:fhc_app_task/models/competition.dart';
import 'package:fhc_app_task/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isLoading = false;
  List<String> categories = [];

  int selectedFilter = 0;

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

  void addCategoriesToFilterList() async {
    setState(() {
      isLoading = true;
    });

    categories = competitions.map((e) => e.category).toSet().toList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    addCategoriesToFilterList();
  }

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
                // Filter between upcoming and expired.
                TextButton(
                  onPressed: () {},
                  child: Text("More", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 16),
              ],
            ),

            SizedBox(height: 10),

            // chips filter (categories)
            ChipList(
              listOfChipNames: categories,
              activeBgColorList: [AppColors.primaryColor],
              inactiveBgColorList: const [AppColors.cardColor],
              activeTextColorList: const [Colors.white],
              inactiveTextColorList: [Colors.white],
              listOfChipIndicesCurrentlySelected: [selectedFilter],
              activeBorderColorList: [AppColors.primaryColor],
              inactiveBorderColorList: [AppColors.cardColor],
              supportsMultiSelect: true,
              showCheckmark: false,
            ),
            SizedBox(height: 10),
            // Competitions list.
            ListView.builder(
              itemCount: competitions.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                CompetitionModel eachCompetition = competitions[index];
                return Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          eachCompetition.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          eachCompetition.description,
                          style: TextStyle(color: AppColors.inActiveTabColor),
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(.07),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            eachCompetition.category,
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Ending in 4 days",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            // Expired competitions
          ],
        ),
      ),
    );
  }
}


// Created by https://www.github.com/KarlMathuthu