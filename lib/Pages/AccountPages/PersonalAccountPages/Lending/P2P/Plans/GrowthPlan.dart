import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting numbers
import '../../../../../../Themes/appTheme.dart';

class GrowthPlanScreen extends StatefulWidget {
  const GrowthPlanScreen({super.key});

  @override
  _GrowthPlanScreenState createState() => _GrowthPlanScreenState();
}

class _GrowthPlanScreenState extends State<GrowthPlanScreen> {
  double lendingAmount = 100000;
  final TextEditingController _amountController =
  TextEditingController(text: 'Enter Amount');

  final NumberFormat _numberFormat = NumberFormat('#,##0');
  double minInterestRate = 9.0; // Minimum interest rate in percentage
  double maxInterestRate = 13.0; // Maximum interest rate in percentage

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_updateRepaymentEstimates);
  }

  @override
  void dispose() {
    _amountController.removeListener(_updateRepaymentEstimates);
    _amountController.dispose();
    super.dispose();
  }

  double _calculateRepayment(double amount, double interestRate) {
    return amount + (amount * (interestRate / 100));
  }

  String get _repaymentEstimates {
    final currentAmount = int.tryParse(
        _amountController.text.replaceAll(RegExp(r'[^\d]'), '')) ??
        0; // Default to 0 if parsing fails
    if (currentAmount == 0) {
      return "₹0 - ₹0"; // Default display
    }
    final minRepayment =
    _calculateRepayment(currentAmount.toDouble(), minInterestRate);
    final maxRepayment =
    _calculateRepayment(currentAmount.toDouble(), maxInterestRate);
    return "₹${_numberFormat.format(minRepayment)} - ₹${_numberFormat.format(maxRepayment)}";
  }

  void _updateRepaymentEstimates() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title:
        Text('Growth Plan', style: TextStyle(color: AppTheme.accentColor)),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8), // Adjust padding if necessary
          child: Container(
            decoration: AppTheme.iconBackGroundDecoration,
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: AppTheme.greenAccentColor), // Back arrow color
              onPressed: () {
                Navigator.pop(context); // Handle back navigation
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Text(
                  "Get the benefit of compounded returns by re-lending your monthly repayments to active borrowers.",
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppTheme.primaryColor, width: .5),
                ),
                margin: EdgeInsets.all(12),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lending amount",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      TextField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          prefixText: "₹ ",
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              _amountController.clear();
                            },
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildAmountChip("+ ₹50,000"),
                          _buildAmountChip("+ ₹75,000"),
                          _buildAmountChip("+ ₹1,00,000"),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            "Est. repayment - ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "How it works",
                            style: TextStyle(
                                fontSize: 16, color: AppTheme.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        _repaymentEstimates,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "at ${minInterestRate.toStringAsFixed(0)}-${maxInterestRate.toStringAsFixed(0)}% p.a",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            side: const BorderSide(
                                color: AppTheme.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(16.0),
                          ),
                          child: const Text(
                            'Add Funds',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    "ISSUE OVERVIEW",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _buildOverviewItem(
                icon: Icons.credit_score,
                title: "Min bureau score",
                value: "685 or new to credit",
              ),
              _buildOverviewItem(
                icon: Icons.account_balance_wallet,
                title: "Loan Purpose",
                value: "Multiple",
              ),
              _buildOverviewItem(
                icon: Icons.percent,
                title: "Loan Rate",
                value: "18% - 25% p.a.",
              ),
              _buildOverviewItem(
                icon: Icons.calendar_today,
                title: "Loan tenure",
                value: "Upto 12 mos",
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "*Based on historical performance of underlying loans. Past performance is not a guarantee of future returns. You will receive monthly returns.",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountChip(String amount) {
    return GestureDetector(
      onTap: () {
        final currentAmount = int.tryParse(
            _amountController.text.replaceAll(RegExp(r'[^\d]'), '')) ??
            0; // Removes commas or other non-numeric characters
        final additionAmount =
            int.tryParse(amount.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;

        setState(() {
          _amountController.text =
              _numberFormat.format(currentAmount + additionAmount);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          amount,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildOverviewItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}