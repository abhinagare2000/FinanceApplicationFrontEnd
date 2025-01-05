import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrowing Portfolio'),
        backgroundColor: Color(0xFF264653),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Your Borrowings',
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
                BorrowingData('Business Loan', '₹500,000'),
                BorrowingData('Invoice Discounting', '₹300,000'),
                BorrowingData('NCDs', '₹200,000'),
              ],
            ),
            BorrowingCategory(
              category: 'NBFCP2P',
              borrowings: [
                BorrowingData('Crowd Funding', '₹150,000'),
                BorrowingData('Invoice Discounting', '₹100,000'),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    borrowing.name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    borrowing.amount,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class BorrowingData {
  final String name;
  final String amount;

  BorrowingData(this.name, this.amount);
}