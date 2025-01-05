import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../Themes/appTheme.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _buildThemeData(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: _buildAppBar(),
          backgroundColor: AppTheme.backgroundColor,
          body: const TabBarView(
            children: [
              P2PInsightsPage(),
              InvoiceInsightsPage(),
              NCDInsightsPage(),
            ],
          ),
        ),
      ),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      tabBarTheme: const TabBarTheme(
        labelColor: AppTheme.greenAccentColor,
        unselectedLabelColor: AppTheme.accentColor,
        indicatorColor: AppTheme.greenAccentColor,
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        backgroundColor: AppTheme.primaryColor,
        bottom: _buildTabBar(),
      ),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(text: 'P2P'),
        Tab(text: 'Invoice Discounting'),
        Tab(text: 'NCD'),
      ],
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      padding: EdgeInsets.symmetric(vertical: 0.4),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}

abstract class BaseInsightsPage extends StatelessWidget {
  const BaseInsightsPage({super.key});

  Widget buildChartSection();
  List<InsightMetric> getMetrics();
  List<TrendItem> getTrends();
  List<String> getNews();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InsightCard(
            title: 'Market Overview',
            content: buildChartSection(),
          ),
          InsightCard(
            title: 'Key Metrics',
            content: MetricsWidget(metrics: getMetrics()),
          ),
          InsightCard(
            title: 'Market Analysis',
            content: TrendsWidget(trends: getTrends()),
          ),
          NewsCard(
            title: 'Latest Updates',
            news: getNews(),
          ),
        ],
      ),
    );
  }
}

class P2PInsightsPage extends BaseInsightsPage {
  const P2PInsightsPage({super.key});

  @override
  Widget buildChartSection() => ChartWidget(
    spots: [
      FlSpot(0, 15),
      FlSpot(1, 16),
      FlSpot(2, 14),
      FlSpot(3, 18),
      FlSpot(4, 16),
      FlSpot(5, 17),
    ],
  );

  @override
  List<InsightMetric> getMetrics() => const [
    InsightMetric('Average Interest Rate', '12%'),
    InsightMetric('Highest Interest Rate', '20%'),
    InsightMetric('Default Rate', '2%'),
  ];

  @override
  List<TrendItem> getTrends() => const [
    TrendItem('Increasing access to credit for businesses'),
    TrendItem('AI-driven risk assessment for better borrowing decisions'),
    TrendItem('Diversified borrowing options for businesses'),
    TrendItem('Growing trust in P2P lending platforms'),
  ];

  @override
  List<String> getNews() => const [
    'RBI unveils borrower-friendly reforms for P2P lending',
    'P2P lending market poised to cross \$10 billion by 2025',
    'AI-driven credit analysis boosts borrower approvals by 30%',
    'Record low default rates strengthen borrower confidence',
    'Businesses drive 60% of new P2P lending activity',
  ];
}

class InvoiceInsightsPage extends BaseInsightsPage {
  const InvoiceInsightsPage({super.key});

  @override
  Widget buildChartSection() => ChartWidget(
    spots: [
      FlSpot(0, 10),
      FlSpot(1, 12),
      FlSpot(2, 14),
      FlSpot(3, 13),
      FlSpot(4, 15),
      FlSpot(5, 14),
    ],
  );

  @override
  List<InsightMetric> getMetrics() => const [
    InsightMetric('Average Discount Rate', '12%'),
    InsightMetric('Average Duration', '60 days'),
    InsightMetric('Success Rate', '99.2%'),
  ];

  @override
  List<TrendItem> getTrends() => const [
    TrendItem('Manufacturing leads adoption growth'),
    TrendItem('Faster payouts through advanced digitization'),
    TrendItem('MSMEs fueling invoice financing demand'),
    TrendItem('Lower default rates boosting borrower trust'),
    TrendItem('Cross-border invoice financing gains traction'),
  ];

  @override
  List<String> getNews() => const [
    'Invoice discounting hits ₹10K Cr milestone',
    'MSMEs gain access to instant funding via TReDS',
    'Blockchain boosts transparency in invoice trade',
    'Record borrower participation in MSME invoices',
    'AI cuts invoice approval time by 40%',
  ];
}

class NCDInsightsPage extends BaseInsightsPage {
  const NCDInsightsPage({super.key});

  @override
  Widget buildChartSection() => ChartWidget(
    spots: [
      FlSpot(0, 8),
      FlSpot(1, 9),
      FlSpot(2, 7),
      FlSpot(3, 10),
      FlSpot(4, 9),
      FlSpot(5, 11),
    ],
  );

  @override
  List<InsightMetric> getMetrics() => const [
    InsightMetric('Average Coupon Rate', '9%'),
    InsightMetric('Average Tenure', '36 months'),
    InsightMetric('Market Size', '₹4.2T'),
  ];

  @override
  List<TrendItem> getTrends() => const [
    TrendItem('Longer tenures attract stable borrowers'),
    TrendItem('High yields drive demand for unsecured NCDs'),
    TrendItem('Green NCDs gain popularity among ESG borrowers'),
    TrendItem('Rising preference for monthly interest payouts'),
    TrendItem('NBFCs lead NCD issuances for business growth'),
  ];

  @override
  List<String> getNews() => const [
    'SEBI eases norms for faster NCD listings',
    'Corporate NCD issuances surge by 25% YoY',
    'Digital platforms make NCDs accessible to retail borrowers',
    'Green NCDs gain traction in the ESG market',
    'Demand for AA+ rated NCDs reaches new highs',
  ];
}

class InsightMetric {
  final String label;
  final String value;

  const InsightMetric(this.label, this.value);
}

class TrendItem {
  final String description;
  final IconData icon;

  const TrendItem(this.description, {this.icon = Icons.trending_up});
}

class InsightCard extends StatelessWidget {
  final String title;
  final Widget content;

  const InsightCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.primaryColor,
      margin: AppTheme.cardPadding,
      child: Padding(
        padding: AppTheme.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTheme.titleStyle),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final List<String> news;

  const NewsCard({
    super.key,
    required this.title,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.primaryColor,
      margin: AppTheme.cardPadding,
      child: Padding(
        padding: AppTheme.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTheme.titleStyle),
            const SizedBox(height: 16),
            ...news.map((item) => _buildNewsItem(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.update, size: 12, color: AppTheme.greenAccentColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(item, style: AppTheme.bodyStyle),
          ),
        ],
      ),
    );
  }
}

class ChartWidget extends StatelessWidget {
  final List<FlSpot> spots;

  const ChartWidget({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              colors: [AppTheme.textColor],
              barWidth: 3,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

class MetricsWidget extends StatelessWidget {
  final List<InsightMetric> metrics;

  const MetricsWidget({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: metrics
          .map((metric) => _buildMetricRow(metric.label, metric.value))
          .toList(),
    );
  }

  Widget _buildMetricRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.itemSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTheme.bodyStyle),
          Text(value, style: AppTheme.bodyStyle.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class TrendsWidget extends StatelessWidget {
  final List<TrendItem> trends;

  const TrendsWidget({super.key, required this.trends});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: trends.map(_buildTrendRow).toList(),
    );
  }

  Widget _buildTrendRow(TrendItem trend) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.itemSpacing),
      child: Row(
        children: [
          Icon(trend.icon, color: AppTheme.greenAccentColor),
          const SizedBox(width: AppTheme.itemSpacing),
          Expanded(
            child: Text(trend.description, style: AppTheme.bodyStyle),
          ),
        ],
      ),
    );
  }
}