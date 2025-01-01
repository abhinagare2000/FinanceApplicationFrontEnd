import 'package:flutter/material.dart';
import '../../../../Themes/appTheme.dart';
import 'P2P/Plans/GrowthPlan.dart';
import 'P2P/Plans/MonthlyEMIPlan.dart';

class P2POptionsScreen extends StatelessWidget {
  const P2POptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('P2P Lending', style: TextStyle(color: AppTheme.accentColor)),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8), // Adjust padding if necessary
          child: Container(
            decoration: AppTheme.iconBackGroundDecoration,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: AppTheme.greenAccentColor), // Back arrow color
              onPressed: () {
                Navigator.pop(context); // Handle back navigation
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildInvestmentCard(
                        icon: Icons.trending_up,
                        title: 'Growth Plan',
                        description: 'Enjoy the benefit of compounded returns.',
                        minAmount: '₹50,000',
                        returns: '9-13% p.a',
                        tenure: 'upto 12 mos',
                        context: context,
                      ),
                      const SizedBox(height: 16),
                      _buildInvestmentCard(
                        icon: Icons.account_balance_wallet,
                        title: 'Monthly EMI Plan',
                        description: 'Monthly repayments settled to your bank account.',
                        minAmount: '₹25,000',
                        returns: '9-11% p.a',
                        tenure: '8 mos',
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentCard({
    required IconData icon,
    required String title,
    required String description,
    required String minAmount,
    required String returns,
    required String tenure,
    required BuildContext context,
  }) {
    return GestureDetector(
        onTap: () {
      if (title == 'Growth Plan') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GrowthPlanScreen()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MonthlyEMIPlanScreen()),
        );
      }
    },
    child:  Container(
      decoration: BoxDecoration(
        color: const Color(0xFF264653),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color(0x1AFFFFFF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.green,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Color(0xCCFFFFFF),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn('Min Amount', minAmount),
              _buildInfoColumn('Est. returns*', returns),
              _buildInfoColumn('Tenure', tenure),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.verified_user,
                color: Colors.green,
                size: 16,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Powered by RBI regulated NBFC-P2P',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.green[300],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}