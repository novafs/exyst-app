import 'package:flutter/material.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final List<HelpCategory> _categories = [
    HelpCategory(
      title: 'Account & Profile',
      icon: Icons.person,
      color: Colors.blue[100]!,
      articles: [
        'How to change your password',
        'Updating profile information',
        'Deleting your account',
        'Managing notification settings',
        'Linking social media accounts',
      ],
    ),
    HelpCategory(
      title: 'Courses & Learning',
      icon: Icons.school,
      color: Colors.green[100]!,
      articles: [
        'How to enroll in a course',
        'Accessing course materials',
        'Downloading videos for offline viewing',
        'Completing quizzes and assignments',
        'Getting course certificates',
      ],
    ),
    HelpCategory(
      title: 'Payments & Billing',
      icon: Icons.payment,
      color: Colors.purple[100]!,
      articles: [
        'Payment methods accepted',
        'Refund policy and process',
        'Subscription management',
        'Invoice and receipt requests',
        'Troubleshooting payment issues',
      ],
    ),
    HelpCategory(
      title: 'Technical Issues',
      icon: Icons.build,
      color: Colors.orange[100]!,
      articles: [
        'App crashes and freezes',
        'Video playback problems',
        'Download issues',
        'Login troubles',
        'Connectivity problems',
      ],
    ),
    HelpCategory(
      title: 'Instructor Support',
      icon: Icons.record_voice_over,
      color: Colors.red[100]!,
      articles: [
        'Becoming an instructor',
        'Creating and publishing courses',
        'Managing course content',
        'Understanding revenue sharing',
        'Instructor dashboard guide',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF0A3251),
            child: Column(
              children: [
                const Text(
                  'How can we help you?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for help...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    // Implement search functionality
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Browse by Category',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3251),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      return _buildCategoryItem(_categories[index]);
                    },
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Popular Articles',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3251),
                      ),
                    ),
                  ),
                  _buildPopularArticle(
                    'How to reset your password',
                    'Account & Profile',
                    '2 min read',
                  ),
                  _buildPopularArticle(
                    'Downloading courses for offline viewing',
                    'Courses & Learning',
                    '3 min read',
                  ),
                  _buildPopularArticle(
                    'Requesting a refund',
                    'Payments & Billing',
                    '2 min read',
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Still need help?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A3251),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/contact-support',
                                  );
                                },
                                icon: const Icon(Icons.email),
                                label: const Text('Contact Us'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0A3251),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/faq');
                                },
                                icon: const Icon(Icons.question_answer),
                                label: const Text('FAQs'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: const Color(0xFF0A3251),
                                  side: const BorderSide(
                                    color: Color(0xFF0A3251),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(HelpCategory category) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: category.color,
          shape: BoxShape.circle,
        ),
        child: Icon(category.icon, color: const Color(0xFF0A3251)),
      ),
      title: Text(
        category.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3251),
        ),
      ),
      subtitle: Text(
        '${category.articles.length} articles',
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFF0A3251),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HelpCategoryDetailScreen(category: category),
          ),
        );
      },
    );
  }

  Widget _buildPopularArticle(String title, String category, String readTime) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3251),
        ),
      ),
      subtitle: Text(
        '$category • $readTime',
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFF0A3251),
      ),
      onTap: () {
        // Navigate to article detail
      },
    );
  }
}

class HelpCategoryDetailScreen extends StatelessWidget {
  final HelpCategory category;

  const HelpCategoryDetailScreen({Key? key, required this.category})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: category.articles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                category.articles[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3251),
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF0A3251),
              ),
              onTap: () {
                // Navigate to article detail
              },
            ),
          );
        },
      ),
    );
  }
}

class HelpCategory {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> articles;

  HelpCategory({
    required this.title,
    required this.icon,
    required this.color,
    required this.articles,
  });
}
