import 'package:flutter/material.dart';

class LinkedAccountsScreen extends StatefulWidget {
  const LinkedAccountsScreen({Key? key}) : super(key: key);

  @override
  State<LinkedAccountsScreen> createState() => _LinkedAccountsScreenState();
}

class _LinkedAccountsScreenState extends State<LinkedAccountsScreen> {
  bool _googleConnected = true;
  bool _facebookConnected = false;
  bool _twitterConnected = false;
  bool _linkedinConnected = true;
  bool _githubConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linked Accounts'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Connect your social accounts to easily sign in and share your achievements.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildAccountItem(
                'Google',
                'Connect with your Google account',
                Icons.account_circle,
                Colors.red,
                _googleConnected,
                (value) {
                  setState(() {
                    _googleConnected = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildAccountItem(
                'Facebook',
                'Connect with your Facebook account',
                Icons.facebook,
                Colors.blue,
                _facebookConnected,
                (value) {
                  setState(() {
                    _facebookConnected = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildAccountItem(
                'Twitter',
                'Connect with your Twitter account',
                Icons.alternate_email,
                Colors.lightBlue,
                _twitterConnected,
                (value) {
                  setState(() {
                    _twitterConnected = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildAccountItem(
                'LinkedIn',
                'Connect with your LinkedIn account',
                Icons.business,
                Colors.indigo,
                _linkedinConnected,
                (value) {
                  setState(() {
                    _linkedinConnected = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildAccountItem(
                'GitHub',
                'Connect with your GitHub account',
                Icons.code,
                Colors.black,
                _githubConnected,
                (value) {
                  setState(() {
                    _githubConnected = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue[600]),
                        const SizedBox(width: 8),
                        Text(
                          'Privacy & Security',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your linked accounts are used only for authentication and sharing achievements. We never post on your behalf without permission.',
                      style: TextStyle(fontSize: 14, color: Colors.blue[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountItem(
    String name,
    String description,
    IconData icon,
    Color color,
    bool isConnected,
    Function(bool) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A3251),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Switch(
            value: isConnected,
            onChanged: onChanged,
            activeColor: const Color(0xFF0A3251),
          ),
        ],
      ),
    );
  }
}
