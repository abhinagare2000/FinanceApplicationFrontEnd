import 'package:flutter/material.dart';

import '../../../Themes/appTheme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController controller = PageController();

  final List<InvestmentOption> investmentOptions = [
    InvestmentOption(
      title: 'P2P Lending',
      description: 'Start lending to verified businesses',
      returns: '12-18% p.a.',
      content: P2PContent(),
    ),
    InvestmentOption(
      title: 'Invoice Discounting',
      description: 'Finance verified invoices',
      returns: '10-14% p.a.',
      content: InvoiceContent(),
    ),
    InvestmentOption(
      title: 'NCDs',
      description: 'Invest in corporate bonds',
      returns: '8-12% p.a.',
      content: NCDContent(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('Explore Investment Options', style: TextStyle(color: AppTheme.accentColor)),
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
            itemCount: investmentOptions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 5.0), // Add vertical space
                child: InvestmentCard(option: investmentOptions[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class InvestmentCard extends StatelessWidget {
  final InvestmentOption option;

  const InvestmentCard({super.key, required this.option});

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
                  'Returns: ${option.returns}',
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

class DetailScreen extends StatelessWidget {
  final InvestmentOption option;

  const DetailScreen({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(option.title),
      ),
      body: option.content,
    );
  }
}

class InvestmentOption {
  final String title;
  final String description;
  final String returns;
  final Widget content;

  InvestmentOption({
    required this.title,
    required this.description,
    required this.returns,
    required this.content,
  });
}

class ContentSection extends StatelessWidget {
  final String title;
  final String content;

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
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 24),
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
        foregroundColor: Colors.black,
      ),
      child: Text('Start Investing',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
            title: 'What is P2P Lending?',
            content:
                'P2P lending enables direct lending to verified businesses through a platform. It cuts out traditional intermediaries, allowing for higher returns.',
          ),
          ContentSection(
            title: 'Risks',
            content:
                '• Default risk from borrowers\n• Limited liquidity\n• Regulatory changes\n• Platform risk',
          ),
          ContentSection(
            title: 'Why Invest?',
            content:
                '• Higher returns (12-18% p.a.)\n• Portfolio diversification\n• Monthly returns\n• Start with ₹10,000',
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
            title: 'What is Invoice Discounting?',
            content:
                'Invoice discounting lets you purchase verified invoices at a discount, earning returns when businesses pay their invoices.',
          ),
          ContentSection(
            title: 'Risks',
            content:
                '• Payment delays\n• Invoice authenticity\n• Business performance\n• Short-term nature',
          ),
          ContentSection(
            title: 'Why Invest?',
            content:
                '• Secured by invoices\n• Short duration (30-90 days)\n• Regular returns\n• Start with ₹50,000',
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
            title: 'What are NCDs?',
            content:
                'Non-Convertible Debentures are fixed-income instruments issued by corporations to raise funds, offering regular interest payments.',
          ),
          ContentSection(
            title: 'Risks',
            content:
                '• Credit risk\n• Interest rate risk\n• Market liquidity\n• Company performance',
          ),
          ContentSection(
            title: 'Why Invest?',
            content:
                '• Fixed returns\n• Regular interest payments\n• Higher than FD rates\n• Start with ₹10,000',
          ),
          ContentButton(onPressed: () {}),
        ],
      ),
    );
  }
}
