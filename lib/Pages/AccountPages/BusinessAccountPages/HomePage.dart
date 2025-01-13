import 'package:flutter/material.dart';
import '../../../Themes/appTheme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController controller = PageController();

  final List<BorrowingOption> borrowingOptions = [
    BorrowingOption(
      title: 'P2P',
      description: 'Borrow from verified lenders',
      interestRate: '18-24% p.a.',
      content: P2PContent(),
    ),
    BorrowingOption(
      title: 'Invoice Discounting',
      description: 'Finance your invoices',
      interestRate: '14-20% p.a.',
      content: InvoiceContent(),
    ),
    BorrowingOption(
      title: 'NCDs',
      description: 'Raise funds through corporate bonds',
      interestRate: '12-18% p.a.',
      content: NCDContent(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('Explore Borrowing Options', style: TextStyle(color: AppTheme.textColor)),
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
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentSection(
            title: 'P2P',
            content: [
              'Borrow from verified lenders through a peer-to-peer lending platform.',
            ],
          ),
          ContentSection(
            title: 'Interest Rate',
            content: [
              '18-24% p.a.',
            ],
          ),
          ContentSection(
            title: 'Why Borrow?',
            content: [
              'Quick access to funds',
              'Competitive interest rates',
              'Flexible terms',
              'No collateral required',
            ],
          ),
          ContentButton(onPressed: () {}),
        ],
      ),
    );
  }
}

class InvoiceContent extends StatelessWidget {
  const InvoiceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentSection(
            title: 'Invoice Discounting',
            content: [
              'Finance your invoices to improve cash flow and working capital. It allows you to borrow against your unpaid invoices.',
            ],
          ),
          ContentSection(
            title: 'Interest Rate',
            content: [
              '14-20% p.a.',
            ],
          ),
          ContentSection(
            title: 'Why Borrow?',
            content: [
              'Immediate cash flow',
              'No collateral required',
              'Improves working capital',
              'Flexible terms',
            ],
          ),
          ContentButton(onPressed: () {}),
        ],
      ),
    );
  }
}

class NCDContent extends StatelessWidget {
  const NCDContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentSection(
            title: 'NCDs',
            content: [
              'Raise funds through corporate bonds',
            ],
          ),
          ContentSection(
            title: 'Interest Rate',
            content: [
              '12-18% p.a.',
            ],
          ),
          ContentSection(
            title: 'Why Borrow?',
            content: [
              'Access to large funds',
              'Fixed interest rates',
              'Longer repayment terms',
              'No dilution of ownership',
            ],
          ),
          ContentButton(onPressed: () {}),
        ],
      ),
    );
  }
}

class ContentSection extends StatelessWidget {
  final String title;
  final List<String> content;

  const ContentSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        SizedBox(height: 6),
        ...content.map((item) => Row(
          children: [
            if (content.length > 1) Icon(Icons.check_circle, color: AppTheme.primaryColor, size: 20),
            SizedBox(width: 8),
            Expanded(child: Text(item, style: TextStyle(fontSize: 16))),
          ],
        )).toList(),
        SizedBox(height: 16),
      ],
    );
  }
}

class ContentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ContentButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners
        ),
        backgroundColor: AppTheme.primaryColor, // Set the background color
      ),
      child: Text('Borrow Now',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
        title: Text(option.title, style: TextStyle(color: AppTheme.textColor)),
        backgroundColor: AppTheme.primaryColor,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: option.content),
          ],
        ),
      ),
    );
  }
}