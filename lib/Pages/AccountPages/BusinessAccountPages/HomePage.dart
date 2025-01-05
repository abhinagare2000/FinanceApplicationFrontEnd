import 'package:flutter/material.dart';
import '../../../Themes/appTheme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController controller = PageController();

  final List<BorrowingOption> borrowingOptions = [
    BorrowingOption(
      title: 'P2P',
      description: 'Borrow from verified lenders',
      interestRate: '12-18% p.a.',
      content: P2PContent(),
    ),
    BorrowingOption(
      title: 'Invoice Discounting',
      description: 'Finance your invoices',
      interestRate: '10-14% p.a.',
      content: InvoiceContent(),
    ),
    BorrowingOption(
      title: 'NCDs',
      description: 'Raise funds through corporate bonds',
      interestRate: '8-12% p.a.',
      content: NCDContent(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('Explore Borrowing Options', style: TextStyle(color: AppTheme.accentColor)),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8), // Adjust padding if necessary
          child: Container(
            decoration: AppTheme.iconBackGroundDecoration,
            child: IconButton(
              icon: Icon(Icons.explore_outlined, color: AppTheme.greenAccentColor), // Back arrow color
              onPressed: () {
                Navigator.pop(context); // Handle back navigation
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: borrowingOptions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0), // Add vertical space
                child: BorrowingCard(option: borrowingOptions[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class P2PContent extends StatelessWidget {
  const P2PContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'P2P Lending Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Borrow from verified lenders through P2P platforms. This option allows businesses to access funds quickly with competitive interest rates.',
          style: TextStyle(fontSize: 16),
        ),
        // Add more details or widgets as needed
      ],
    );
  }
}

class InvoiceContent extends StatelessWidget {
  const InvoiceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Invoice Discounting Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Finance your invoices by selling them to a third party at a discount. This option helps businesses improve cash flow by getting immediate funds.',
          style: TextStyle(fontSize: 16),
        ),
        // Add more details or widgets as needed
      ],
    );
  }
}

class NCDContent extends StatelessWidget {
  const NCDContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NCD Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          'Raise funds through Non-Convertible Debentures (NCDs). This option allows businesses to issue bonds to investors and pay interest over time.',
          style: TextStyle(fontSize: 16),
        ),
        // Add more details or widgets as needed
      ],
    );
  }
}

class BorrowingCard extends StatelessWidget {
  final BorrowingOption option;

  const BorrowingCard({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(option: option)),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.18, // Adjust the height
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF14514D), Color(0xFF264653)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  option.title,
                  style: TextStyle(
                    color: AppTheme.accentColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  option.description,
                  style: TextStyle(color: Colors.white70),
                ),
                Spacer(),
                Text(
                  'Interest Rate: ${option.interestRate}',
                  style: TextStyle(
                    color: AppTheme.accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BorrowingOption {
  final String title;
  final String description;
  final String interestRate;
  final Widget content;

  BorrowingOption({
    required this.title,
    required this.description,
    required this.interestRate,
    required this.content,
  });
}

class DetailScreen extends StatelessWidget {
  final BorrowingOption option;

  const DetailScreen({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(option.title),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              option.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              option.description,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Text(
              'Interest Rate: ${option.interestRate}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(child: option.content),
          ],
        ),
      ),
    );
  }
}