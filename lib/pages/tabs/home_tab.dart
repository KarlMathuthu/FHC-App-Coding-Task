import 'package:chip_list/chip_list.dart';
import 'package:fhc_app_task/models/competition.dart';
import 'package:fhc_app_task/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

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

  List<CompetitionModel> filteredCompetitions = [];

  void addCategoriesToFilterList() async {
    setState(() {
      isLoading = true;
    });

    // Simulate a 2-second delay
    await Future.delayed(const Duration(seconds: 2));

    categories = competitions.map((e) => e.category).toSet().toList();
    categories.insert(0, "All");

    setState(() {
      isLoading = false;
      filterCompetitions();
    });
  }

  void filterCompetitions() {
    setState(() {
      if (selectedFilter == 0) {
        filteredCompetitions = competitions;
      } else {
        filteredCompetitions =
            competitions
                .where((comp) => comp.category == categories[selectedFilter])
                .toList();
      }
    });
  }

  int daysLeft(String endDate) {
    DateTime end = DateFormat('yyyy-MM-dd').parse(endDate);
    return end.difference(DateTime.now()).inDays;
  }

  @override
  void initState() {
    super.initState();
    addCategoriesToFilterList();
  }

  Widget buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: AppColors.cardColor,
      highlightColor: AppColors.inActiveTabColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 16),
                Container(width: 100, height: 20, color: Colors.white),
                const Spacer(),
                Container(width: 50, height: 20, color: Colors.white),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                height: 50,
                color: Colors.white,
                margin: const EdgeInsets.only(right: 16),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 10,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 100,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNormalContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
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
                      const Spacer(),
                      Text(
                        "A trip to Cape Town!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
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
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                "Trending",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text("More", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ChipList(
              listOfChipNames: categories,
              activeBgColorList: [AppColors.primaryColor],
              inactiveBgColorList: const [AppColors.cardColor],
              activeTextColorList: const [Colors.white],
              inactiveTextColorList: [Colors.white],
              listOfChipIndicesCurrentlySelected: [selectedFilter],
              activeBorderColorList: [AppColors.primaryColor],
              inactiveBorderColorList: [AppColors.cardColor],
              supportsMultiSelect: false,
              showCheckmark: false,
              extraOnToggle: (index) {
                setState(() {
                  selectedFilter = index;
                  filterCompetitions();
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: filteredCompetitions.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              CompetitionModel eachCompetition = filteredCompetitions[index];
              int days = daysLeft(eachCompetition.endDate);
              return Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                padding: const EdgeInsets.all(8),
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
                      trailing: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor.withOpacity(
                            .05,
                          ),
                        ),
                        child: Text(
                          "View Details",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          days > 0 ? "Ending in $days days" : "Expired",
                          style: TextStyle(
                            color: days > 0 ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: isLoading ? buildShimmerEffect() : buildNormalContent(),
    );
  }
}
// Created by https://www.github.com/KarlMathuthu