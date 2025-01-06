import 'package:flutter/material.dart';

import '../../../Themes/appTheme.dart';
import 'Borrowing/BusinessLoanApplicationPage.dart';
import 'Borrowing/CrowdFundingApplicationPage.dart';
import 'Borrowing/InvoiceDiscountingApplicationPage.dart';
import 'Borrowing/NCDApplicationPage.dart';

class BorrowScreen extends StatelessWidget {
  const BorrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Borrowing Options', style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF264653),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'NBFC'),
              Tab(text: 'NBFCP2P'),
            ],
            labelStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(color: Colors.white),
          ),
        ),
        body: TabBarView(
          children: [
            BorrowingOptionsList(
              category: 'NBFC',
              borrowings: [
                BorrowingOption('Business Loan', 'Apply for a business loan', BusinessLoanApplicationPage()),
                BorrowingOption('Invoice Discounting', 'Apply for invoice discounting', InvoiceDiscountingApplicationPage()),
                BorrowingOption('NCDs', 'Apply for NCDs', NCDApplicationPage()),
              ],
            ),
            BorrowingOptionsList(
              category: 'NBFCP2P',
              borrowings: [
                BorrowingOption('Crowd Funding', 'Apply for crowd funding', CrowdFundingApplicationPage()),
                BorrowingOption('Invoice Discounting', 'Apply for invoice discounting', InvoiceDiscountingApplicationPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BorrowingOptionsList extends StatelessWidget {
  final String category;
  final List<BorrowingOption> borrowings;

  const BorrowingOptionsList({
    Key? key,
    required this.category,
    required this.borrowings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
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
          subtitle: Text(borrowing.description, style: TextStyle(color: Colors.white70)),
          trailing: Icon(Icons.chevron_right, color: AppTheme.greenAccentColor),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => borrowing.page),
          ),
          ),
        ),
      )).toList(),
    );
  }
}

class BorrowingOption {
  final String name;
  final String description;
  final Widget page;

  BorrowingOption(this.name, this.description, this.page);
}