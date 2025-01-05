import 'package:flutter/material.dart';

class NCDApplicationPage extends StatelessWidget {
  const NCDApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NCD Application'),
        backgroundColor: Color(0xFF264653),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Apply for NCDs',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Add form fields for NCD application
          ],
        ),
      ),
    );
  }
}