import 'package:flutter/material.dart';

class CoursePlayerScreen extends StatefulWidget {
  const CoursePlayerScreen({Key? key}) : super(key: key);

  @override
  State<CoursePlayerScreen> createState() => _CoursePlayerScreenState();
}

class _CoursePlayerScreenState extends State<CoursePlayerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentLessonIndex = 0;
  bool _isVideoPlaying = false;

  final List<String> _lessons = [
    'Introduction to the Course',
    'Getting Started with PyTorch',
    'Building Your First Neural Network',
    'Project 1: Image Classification',
    'Project 2: Natural Language Processing',
    'Project 3: Generative Models',
    'Project 4: Reinforcement Learning',
    'Project 5: Deployment',
    'Course Conclusion',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Player'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: const Color(0xFF0A3251),
                ),
                IconButton(
                  icon: Icon(
                    _isVideoPlaying ? Icons.pause_circle : Icons.play_circle,
                    size: 64,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isVideoPlaying = !_isVideoPlaying;
                    });
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Text(
                          '00:00',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 12,
                              ),
                              trackHeight: 4,
                            ),
                            child: Slider(
                              value: 0,
                              onChanged: (value) {},
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '10:30',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(
                            Icons.fullscreen,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PyTorch in 5 Projects',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A3251),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Lesson ${_currentLessonIndex + 1}: ${_lessons[_currentLessonIndex]}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0A3251),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed:
                          _currentLessonIndex > 0
                              ? () {
                                setState(() {
                                  _currentLessonIndex--;
                                });
                              }
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A3251),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Previous'),
                    ),
                    ElevatedButton(
                      onPressed:
                          _currentLessonIndex < _lessons.length - 1
                              ? () {
                                setState(() {
                                  _currentLessonIndex++;
                                });
                              }
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A3251),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF0A3251),
            unselectedLabelColor: Colors.grey,
            indicatorColor: const Color(0xFF0A3251),
            tabs: const [
              Tab(text: 'Overview'),
              Tab(text: 'Q&A'),
              Tab(text: 'Notes'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildOverviewTab(), _buildQATab(), _buildNotesTab()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Course Content',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3251),
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _lessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      _currentLessonIndex == index
                          ? const Color(0xFF0A3251)
                          : Colors.grey[300],
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color:
                          _currentLessonIndex == index
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
                title: Text(
                  _lessons[index],
                  style: TextStyle(
                    fontWeight:
                        _currentLessonIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                    color: const Color(0xFF0A3251),
                  ),
                ),
                subtitle: Text(
                  'Duration: 10:30',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing:
                    _currentLessonIndex > index
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                onTap: () {
                  setState(() {
                    _currentLessonIndex = index;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQATab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Questions & Answers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3251),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Ask a question...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildQuestionItem(
            'How do I install PyTorch on Windows?',
            'John Doe',
            '2 days ago',
            'You can install PyTorch on Windows using pip. Just run "pip install torch torchvision" in your command prompt.',
            'Instructor',
            '1 day ago',
          ),
          const SizedBox(height: 16),
          _buildQuestionItem(
            'What is the difference between PyTorch and TensorFlow?',
            'Jane Smith',
            '1 week ago',
            'PyTorch is more pythonic and has a dynamic computation graph, while TensorFlow has a static computation graph. PyTorch is often preferred for research, while TensorFlow is widely used in production.',
            'Instructor',
            '6 days ago',
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionItem(
    String question,
    String askedBy,
    String askedTime,
    String answer,
    String answeredBy,
    String answeredTime,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 16, backgroundColor: Colors.grey[400]),
              const SizedBox(width: 8),
              Text(
                askedBy,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3251),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                askedTime,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3251),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue[400],
                      child: const Text(
                        'I',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      answeredBy,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3251),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      answeredTime,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(answer, style: const TextStyle(color: Color(0xFF0A3251))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Notes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3251),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TextField(
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                hintText: 'Take notes for this lesson...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A3251),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Save Notes'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
