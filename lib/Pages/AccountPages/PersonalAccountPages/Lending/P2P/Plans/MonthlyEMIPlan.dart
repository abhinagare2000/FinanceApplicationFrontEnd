import 'package:flutter/material.dart';

import '../../../../../../Themes/appTheme.dart';

class MonthlyEMIPlanScreen extends StatelessWidget {
  final List<EMIPlan> activePlans = [
    EMIPlan(
      title: "Health Horizon 1",
      minAmount: 25000,
      interestRate: "9%-13%",
      duration: "6 months",
      description: "Lend for better health with no-cost EMI loans, supporting wellness for a brighter future.",
      progress: 0.7,
      isSubscribed: true,
    ),
    EMIPlan(
      title: "Rising Star 1",
      minAmount: 25000,
      interestRate: "11%-13%",
      duration: "8 months",
      description: "Lend for educational growth with no-cost EMI loans, fostering opportunities for tomorrow's leaders.",
      progress: 0.65,
      isSubscribed: false,
    ),
  ];

  final List<EMIPlan> closedPlans = [
    EMIPlan(
      title: "Health Horizon 1",
      minAmount: 25000,
      interestRate: "9%-13%",
      duration: "6 months",
      description: "Lend for better health with no-cost EMI loans, supporting wellness for a brighter future.",
      progress: 1.0,
      isSubscribed: true,
    ),
    EMIPlan(
      title: "Rising Star 1",
      minAmount: 25000,
      interestRate: "11%-13%",
      duration: "8 months",
      description: "Lend for educational growth with no-cost EMI loans, fostering opportunities for tomorrow's leaders.",
      progress: 1.0,
      isSubscribed: true,
    ),
    EMIPlan(
      title: "Health Plus 2",
      minAmount: 25000,
      interestRate: "9%-13%",
      duration: "9 months",
      description: "Invest in wellness with zero-interest EMI loans, empowering healthier and happier futures.",
      progress: 1.0,
      isSubscribed: true,
    ),
  ];
  MonthlyEMIPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.primaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monthly EMI Plan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.accentColor),
              ),
              Text(
                'Lend to pre-qualified borrowers',
                style: TextStyle(fontSize: 14, color: AppTheme.accentColor),
              ),
            ],
          ),
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.all(8), // Adjust padding if necessary
            child: Container(
              decoration: AppTheme.iconBackGroundDecoration,
              child: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: AppTheme.accentColor), // Back arrow color
                onPressed: () {
                  Navigator.pop(context); // Handle back navigation
                },
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: AppTheme.iconBackGroundDecoration,
                padding: EdgeInsets.all(8),
                child: Icon(Icons.access_time, color: AppTheme.accentColor),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Container(
              color: AppTheme.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem("Active", "0"),
                  _buildTabItem("Closed", "9"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildPlansList(activePlans, isActive: true),
            _buildPlansList(closedPlans, isActive: false),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, String count) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: TextStyle(color: Colors.white)),
          Text(" • $count", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildPlansList(List<EMIPlan> plans, {required bool isActive}) {
    return plans.isEmpty
        ? Center(
      child: Text(
        "All issues are closed as of now",
        style: TextStyle(color: Colors.grey[600], fontSize: 16),
      ),
    )
        : ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        return _buildPlanCard(plans[index], isActive);
      },
    );
  }

  Widget _buildPlanCard(EMIPlan plan, bool isActive) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  plan.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${plan.interestRate} p.a.",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Min Amount: ₹${plan.minAmount}",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Text(
                  plan.duration,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              plan.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Fully subscribed",
                    style: TextStyle(color: Colors.red[300], fontSize: 12),
                  ),
                ),
                Spacer(),
                if (!isActive)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "Issue closed",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 12),
            LinearProgressIndicator(
              value: plan.progress,
              backgroundColor: Colors.grey[200],
              color: Colors.green,
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${(plan.progress * 100).toInt()}%",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EMIPlan {
  final String title;
  final int minAmount;
  final String interestRate;
  final String duration;
  final String description;
  final double progress;
  final bool isSubscribed;

  EMIPlan({
    required this.title,
    required this.minAmount,
    required this.interestRate,
    required this.duration,
    required this.description,
    required this.progress,
    required this.isSubscribed,
  });
}