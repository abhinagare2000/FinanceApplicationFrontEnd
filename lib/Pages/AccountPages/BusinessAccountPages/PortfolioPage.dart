import 'package:flutter/material.dart';

import '../../../Themes/appTheme.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Borrowings', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF264653),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'NBFC'),
              Tab(text: 'NBFCP2P'),
            ],
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(color: Colors.white),
          ),
        ),
        body: TabBarView(
          children: [
            BorrowingCategory(
              category: 'NBFC',
              borrowings: [
                BorrowingData('Business Loan', '₹500,000', '12%', '₹10,000', '2023-12-01'),
                BorrowingData('Invoice Discounting', '₹300,000', '10%', '₹5,000', '2023-12-05'),
                BorrowingData('NCDs', '₹200,000', '8%', '₹3,000', '2023-12-10'),
              ],
            ),
            BorrowingCategory(
              category: 'NBFCP2P',
              borrowings: [
                BorrowingData('Crowd Funding', '₹150,000', '15%', '₹7,500', '2023-12-15'),
                BorrowingData('Invoice Discounting', '₹100,000', '9%', '₹4,000', '2023-12-20'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BorrowingCategory extends StatelessWidget {
  final String category;
  final List<BorrowingData> borrowings;

  const BorrowingCategory({
    Key? key,
    required this.category,
    required this.borrowings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: borrowings.map((borrowing) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            title: Text(borrowing.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
            subtitle: Text(borrowing.amount, style: TextStyle(color: Colors.white70)),
            trailing: Icon(Icons.chevron_right, color: AppTheme.greenAccentColor),
            onTap: () => _showBorrowingDetails(context, borrowing),
          ),
        ),
      )).toList(),
    );
  }

  void _showBorrowingDetails(BuildContext context, BorrowingData borrowing) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(borrowing.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Loan Amount: ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                    ),
                    TextSpan(
                      text: borrowing.amount,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Interest Rate: ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                    ),
                    TextSpan(
                      text: borrowing.interestRate,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Pending EMIs: ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                    ),
                    TextSpan(
                      text: borrowing.interestRate,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Next EMI Due Date: ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primaryColor),
                    ),
                    TextSpan(
                      text: borrowing.interestRate,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Missing EMI on due date will have an impact on your credit score.',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Understood', style: TextStyle(color: Colors.white)),
            ),
            ),
          ],
        );
      },
    );
  }
}

class BorrowingData {
  final String name;
  final String amount;
  final String interestRate;
  final String pendingEmis;
  final String dueDate;

  BorrowingData(this.name, this.amount, this.interestRate, this.pendingEmis, this.dueDate);
}