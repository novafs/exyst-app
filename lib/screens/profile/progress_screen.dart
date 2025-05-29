import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  String _selectedPeriod = 'This Month';

  final List<String> _periods = [
    'This Week',
    'This Month',
    'This Year',
    'All Time',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Progress'),
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
              // Period Selector
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedPeriod,
                    isExpanded: true,
                    items:
                        _periods.map((String period) {
                          return DropdownMenuItem<String>(
                            value: period,
                            child: Text(period),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPeriod = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Overall Progress
              _buildSectionTitle('Overall Progress'),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Courses Completed',
                      '12',
                      Icons.check_circle,
                      Colors.green[100]!,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'Hours Learned',
                      '89',
                      Icons.access_time,
                      Colors.blue[100]!,
                      Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Certificates Earned',
                      '8',
                      Icons.workspace_premium,
                      Colors.amber[100]!,
                      Colors.amber[700]!,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'Current Streak',
                      '15 days',
                      Icons.local_fire_department,
                      Colors.orange[100]!,
                      Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Learning Goals
              _buildSectionTitle('Learning Goals'),
              const SizedBox(height: 16),

              _buildGoalCard(
                'Complete 5 courses this month',
                3,
                5,
                'You\'re 60% there! Keep going!',
              ),
              const SizedBox(height: 12),

              _buildGoalCard(
                'Study 20 hours this month',
                14,
                20,
                'Great progress! 6 hours to go.',
              ),
              const SizedBox(height: 12),

              _buildGoalCard(
                'Maintain 30-day streak',
                15,
                30,
                'Halfway there! Don\'t break the chain.',
              ),
              const SizedBox(height: 24),

              // Recent Activity
              _buildSectionTitle('Recent Activity'),
              const SizedBox(height: 16),

              _buildActivityItem(
                'Completed "Introduction to Flutter"',
                'Yesterday',
                Icons.check_circle,
                Colors.green,
              ),
              _buildActivityItem(
                'Started "Advanced Python Programming"',
                '2 days ago',
                Icons.play_circle,
                Colors.blue,
              ),
              _buildActivityItem(
                'Earned Certificate in "Web Development"',
                '3 days ago',
                Icons.workspace_premium,
                Colors.amber[700]!,
              ),
              _buildActivityItem(
                'Completed Quiz in "Data Science Basics"',
                '5 days ago',
                Icons.quiz,
                Colors.purple,
              ),
              const SizedBox(height: 24),

              // Weekly Progress Chart
              _buildSectionTitle('Weekly Learning Time'),
              const SizedBox(height: 16),

              Container(
                height: 200,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Hours per day this week',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3251),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildBarChart('Mon', 2.5, 3),
                          _buildBarChart('Tue', 1.8, 3),
                          _buildBarChart('Wed', 3.2, 3),
                          _buildBarChart('Thu', 2.1, 3),
                          _buildBarChart('Fri', 2.8, 3),
                          _buildBarChart('Sat', 4.1, 3),
                          _buildBarChart('Sun', 1.5, 3),
                        ],
                      ),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0A3251),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color backgroundColor,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: iconColor),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3251),
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget _buildGoalCard(String title, int current, int target, String message) {
    double progress = current / target;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3251),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$current / $target',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3251),
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3251),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: const Color(0xFF0A3251),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    String title,
    String time,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A3251),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(String day, double hours, double maxHours) {
    double heightRatio = hours / maxHours;

    return Column(
      children: [
        Expanded(
          child: Container(
            width: 24,
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 24,
              height: 120 * heightRatio,
              decoration: BoxDecoration(
                color: const Color(0xFF0A3251),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          '${hours}h',
          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
