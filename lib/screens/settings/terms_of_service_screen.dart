import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
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
              'Terms of Service',
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
              'Welcome to ExyLearn ("we," "our," or "us"). By accessing or using our mobile application, website, and services, you agree to be bound by these Terms of Service ("Terms"). Please read these Terms carefully before using our services.',
            ),
            _buildSection(
              '2. Definitions',
              '"Content" refers to all materials, information, text, images, videos, and other content available through our services.\n\n"User" refers to any individual who accesses or uses our services.\n\n"Instructor" refers to users who create and offer courses on our platform.',
            ),
            _buildSection(
              '3. Account Registration',
              'To access certain features of our services, you may need to register for an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.',
            ),
            _buildSection(
              '4. User Conduct',
              'You agree not to:\n\n• Use our services for any illegal purpose\n• Violate any applicable laws or regulations\n• Impersonate any person or entity\n• Interfere with the proper functioning of our services\n• Attempt to gain unauthorized access to our systems\n• Engage in any activity that could harm our services or other users',
            ),
            _buildSection(
              '5. Content and Intellectual Property',
              'All content provided through our services is owned by us or our licensors and is protected by intellectual property laws. You may not reproduce, distribute, modify, create derivative works of, publicly display, publicly perform, republish, download, store, or transmit any content without our express written permission.',
            ),
            _buildSection(
              '6. User-Generated Content',
              'By submitting content to our services, you grant us a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, adapt, publish, translate, distribute, and display such content in connection with providing our services.',
            ),
            _buildSection(
              '7. Courses and Enrollment',
              'Course availability and pricing are subject to change without notice. We reserve the right to modify, suspend, or discontinue any course at any time.',
            ),
            _buildSection(
              '8. Payments and Refunds',
              'All payments are processed securely through our payment processors. Prices for courses are as listed on our services and are subject to change. Refunds are subject to our Refund Policy.',
            ),
            _buildSection(
              '9. Instructor Terms',
              'Instructors are independent contractors and not employees of ExyLearn. Instructors are responsible for the content of their courses and must comply with our Instructor Guidelines.',
            ),
            _buildSection(
              '10. Termination',
              'We reserve the right to terminate or suspend your account and access to our services at our sole discretion, without notice, for conduct that we believe violates these Terms or is harmful to other users, us, or third parties, or for any other reason.',
            ),
            _buildSection(
              '11. Disclaimer of Warranties',
              'OUR SERVICES ARE PROVIDED "AS IS" AND "AS AVAILABLE" WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.',
            ),
            _buildSection(
              '12. Limitation of Liability',
              'IN NO EVENT SHALL EXYLEARN BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, INCLUDING WITHOUT LIMITATION, LOSS OF PROFITS, DATA, USE, GOODWILL, OR OTHER INTANGIBLE LOSSES, RESULTING FROM YOUR ACCESS TO OR USE OF OR INABILITY TO ACCESS OR USE THE SERVICES.',
            ),
            _buildSection(
              '13. Governing Law',
              'These Terms shall be governed by and construed in accordance with the laws of the United States, without regard to its conflict of law provisions.',
            ),
            _buildSection(
              '14. Changes to Terms',
              'We reserve the right to modify these Terms at any time. If we make changes, we will provide notice by posting the updated Terms on our services and updating the "Last Updated" date at the top of these Terms.',
            ),
            _buildSection(
              '15. Contact Information',
              'If you have any questions about these Terms, please contact us at legal@exylearn.com.',
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
