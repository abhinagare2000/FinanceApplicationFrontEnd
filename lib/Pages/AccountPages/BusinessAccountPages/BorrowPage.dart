import 'package:flutter/material.dart';

import 'Borrowing/BusinessLoanApplicationPage.dart';
import 'Borrowing/CrowdFundingApplicationPage.dart';
import 'Borrowing/InvoiceDiscountingApplicationPage.dart';
import 'Borrowing/NCDApplicationPage.dart';

class BorrowScreen extends StatelessWidget {
  const BorrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrow'),
        backgroundColor: Color(0xFF264653),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Borrowing Options',
              style: TextStyle(
                color: Color(0xFF264653),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            BorrowingCategory(
              category: 'NBFC',
              borrowings: [
                BorrowingOption('Business Loan', 'Apply for a business loan', BusinessLoanApplicationPage()),
                BorrowingOption('Invoice Discounting', 'Apply for invoice discounting', InvoiceDiscountingApplicationPage()),
                BorrowingOption('NCDs', 'Apply for NCDs', NCDApplicationPage()),
              ],
            ),
            BorrowingCategory(
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

class BorrowingCategory extends StatelessWidget {
  final String category;
  final List<BorrowingOption> borrowings;

  const BorrowingCategory({
    Key? key,
    required this.category,
    required this.borrowings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF264653),
              ),
            ),
            const SizedBox(height: 8),
            ...borrowings.map((borrowing) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                title: Text(borrowing.name),
                subtitle: Text(borrowing.description),
                trailing: Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => borrowing.page),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class BorrowingOption {
  final String name;
  final String description;
  final Widget page;

  BorrowingOption(this.name, this.description, this.page);
}