import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});
  static const String helpPagerouteName = '/HelpPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'How can we help you?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const ExpansionTile(
            title: Text('How to use the app?'),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'To use the app, start by creating an account. Then, explore features like scheduling services, contacting support, and managing your profile.',
                ),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text('How to contact support?'),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'You can contact our support team via email at support@example.com or call us at +123-456-7890.',
                ),
              ),
            ],
          ),
          const ExpansionTile(
            title: Text('What are the available features?'),
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Our app offers features like booking services, tracking progress, and providing feedback on completed tasks.',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Need more help?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              // Add navigation or support logic
            },
            icon: const Icon(Icons.mail),
            label: const Text('Contact Support'),
          ),
        ],
      ),
    );
  }
}
