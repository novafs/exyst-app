import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A3251),
              ),
            ),
            Text(
              'Last Updated: May 23, 2025',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            _buildSection(
              '1. Introduction',
              'At ExyLearn, we respect your privacy and are committed to protecting your personal data. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application, website, and services.',
            ),
            _buildSection(
              '2. Information We Collect',
              'We collect several types of information from and about users of our services, including:\n\n• Personal identifiers (name, email address, phone number)\n• Account credentials\n• Payment information\n• Profile information\n• Course progress and activity\n• Device and usage information\n• Communications with us or other users',
            ),
            _buildSection(
              '3. How We Collect Information',
              'We collect information directly from you when you:\n\n• Register for an account\n• Purchase a course\n• Complete your profile\n• Participate in courses or discussions\n• Contact our support team\n\nWe also collect information automatically through cookies and similar technologies when you use our services.',
            ),
            _buildSection(
              '4. How We Use Your Information',
              'We use your information to:\n\n• Provide and improve our services\n• Process transactions\n• Personalize your experience\n• Communicate with you\n• Monitor and analyze usage patterns\n• Protect our services and users\n• Comply with legal obligations',
            ),
            _buildSection(
              '5. Sharing Your Information',
              'We may share your information with:\n\n• Service providers who perform services on our behalf\n• Instructors (limited to course-related information)\n• Business partners with your consent\n• Legal authorities when required by law\n• Other users as directed by you',
            ),
            _buildSection(
              '6. Data Security',
              'We implement appropriate technical and organizational measures to protect your personal information from unauthorized access, disclosure, alteration, and destruction.',
            ),
            _buildSection(
              '7. Your Privacy Rights',
              'Depending on your location, you may have certain rights regarding your personal information, including:\n\n• Access to your personal information\n• Correction of inaccurate information\n• Deletion of your information\n• Restriction of processing\n• Data portability\n• Objection to processing',
            ),
            _buildSection(
              '8. Children\'s Privacy',
              'Our services are not intended for children under 13 years of age, and we do not knowingly collect personal information from children under 13.',
            ),
            _buildSection(
              '9. International Data Transfers',
              'Your information may be transferred to and processed in countries other than the country in which you reside. These countries may have different data protection laws than your country of residence.',
            ),
            _buildSection(
              '10. Changes to This Privacy Policy',
              'We may update this Privacy Policy from time to time. If we make material changes, we will notify you by email or through our services before the changes become effective.',
            ),
            _buildSection(
              '11. Contact Us',
              'If you have any questions about this Privacy Policy or our privacy practices, please contact us at privacy@exylearn.com.',
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A3251),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'I Understand and Accept',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3251),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
