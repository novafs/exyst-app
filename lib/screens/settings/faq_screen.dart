import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<FAQItem> _faqItems = [
    FAQItem(
      question: 'How do I enroll in a course?',
      answer:
          'To enroll in a course, navigate to the course details page and click on the "Buy Now" or "Enroll" button. Follow the checkout process to complete your enrollment.',
    ),
    FAQItem(
      question: 'Can I download courses for offline viewing?',
      answer:
          'Yes, once enrolled in a course, you can download individual lessons for offline viewing. Look for the download icon next to each lesson in the course player.',
    ),
    FAQItem(
      question: 'How do I get a certificate after completing a course?',
      answer:
          'Certificates are automatically generated once you complete all required lessons in a course. You can find your certificates in the "Certificates" section of your profile.',
    ),
    FAQItem(
      question: 'What payment methods are accepted?',
      answer:
          'We accept credit/debit cards, PayPal, and various e-wallets depending on your region. All payment options will be displayed during checkout.',
    ),
    FAQItem(
      question: 'How do I become an instructor?',
      answer:
          'To become an instructor, go to your profile page and click on "Become an Instructor". Fill out the application form with your qualifications and expertise, and our team will review your application.',
    ),
    FAQItem(
      question: 'What is the refund policy?',
      answer:
          'We offer a 30-day money-back guarantee for most courses. If you\'re unsatisfied with a course, you can request a refund within 30 days of purchase, provided you haven\'t completed more than 30% of the course.',
    ),
    FAQItem(
      question: 'How do I contact support?',
      answer:
          'You can contact our support team through the "Contact Support" option in your profile menu. Alternatively, you can email us at support@exylearn.com.',
    ),
    FAQItem(
      question: 'Can I change my username or email?',
      answer:
          'Yes, you can change your username and email in the Settings section. Go to Profile > Settings > Profile Information to update your details.',
    ),
    FAQItem(
      question: 'How do I track my progress in a course?',
      answer:
          'Your progress is automatically tracked as you complete lessons. You can view your overall progress on the course player page or in the "My Courses" section.',
    ),
    FAQItem(
      question: 'Are there any free courses available?',
      answer:
          'Yes, we offer both free and paid courses. You can filter courses by price in the Explore section to find free courses.',
    ),
  ];

  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frequently Asked Questions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search FAQs...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) {
                // Implement search functionality
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _faqItems.length,
              itemBuilder: (context, index) {
                return _buildFAQItem(_faqItems[index], index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Still have questions?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A3251),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contact-support');
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
                      'Contact Support',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(FAQItem item, int index) {
    final isExpanded = _expandedIndex == index;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            _expandedIndex = expanded ? index : -1;
          });
        },
        title: Text(
          item.question,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A3251),
          ),
        ),
        trailing: Icon(
          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: const Color(0xFF0A3251),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              item.answer,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
