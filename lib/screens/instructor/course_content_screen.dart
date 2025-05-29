import 'package:flutter/material.dart';

class CourseContentScreen extends StatefulWidget {
  const CourseContentScreen({Key? key}) : super(key: key);

  @override
  State<CourseContentScreen> createState() => _CourseContentScreenState();
}

class _CourseContentScreenState extends State<CourseContentScreen> {
  final List<Section> _sections = [
    Section(
      title: 'Introduction',
      lessons: [
        Lesson(
          title: 'Welcome to the Course',
          type: LessonType.video,
          duration: '5:30',
        ),
        Lesson(
          title: 'Course Overview',
          type: LessonType.video,
          duration: '8:45',
        ),
      ],
    ),
    Section(
      title: 'Getting Started',
      lessons: [
        Lesson(
          title: 'Setting Up Your Environment',
          type: LessonType.video,
          duration: '12:20',
        ),
        Lesson(
          title: 'Basic Concepts',
          type: LessonType.video,
          duration: '15:10',
        ),
        Lesson(
          title: 'First Project Setup',
          type: LessonType.project,
          duration: '20:00',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Content'),
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
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Course Content',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Add sections and lessons to your course',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _showAddSectionDialog();
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Section'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0A3251),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                _sections.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _sections.length,
                      itemBuilder: (context, index) {
                        return _buildSectionCard(_sections[index], index);
                      },
                    ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: const Color(0xFF0A3251)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/course-pricing');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A3251),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Next: Pricing & Publishing'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.video_library, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No content yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add sections and lessons to your course',
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              _showAddSectionDialog();
            },
            icon: const Icon(Icons.add),
            label: const Text('Add First Section'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A3251),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(Section section, int sectionIndex) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF0A3251),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Section ${sectionIndex + 1}: ${section.title}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    _showEditSectionDialog(section, sectionIndex);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: () {
                    _showDeleteSectionDialog(sectionIndex);
                  },
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: section.lessons.length,
            itemBuilder: (context, index) {
              return _buildLessonItem(
                section.lessons[index],
                sectionIndex,
                index,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                _showAddLessonDialog(sectionIndex);
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Lesson'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: const Color(0xFF0A3251),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonItem(Lesson lesson, int sectionIndex, int lessonIndex) {
    IconData iconData;

    switch (lesson.type) {
      case LessonType.video:
        iconData = Icons.videocam;
        break;
      case LessonType.quiz:
        iconData = Icons.quiz;
        break;
      case LessonType.project:
        iconData = Icons.assignment;
        break;
      case LessonType.document:
        iconData = Icons.article;
        break;
    }

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF0A3251).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(iconData, color: const Color(0xFF0A3251)),
      ),
      title: Text(
        lesson.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3251),
        ),
      ),
      subtitle: Text(
        '${lesson.type.name} • ${lesson.duration}',
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _showEditLessonDialog(lesson, sectionIndex, lessonIndex);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteLessonDialog(sectionIndex, lessonIndex);
            },
          ),
        ],
      ),
    );
  }

  void _showAddSectionDialog() {
    final TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Section'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Section Title',
              hintText: 'Enter a title for this section',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    _sections.add(
                      Section(title: titleController.text, lessons: []),
                    );
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A3251),
              ),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditSectionDialog(Section section, int sectionIndex) {
    final TextEditingController titleController = TextEditingController(
      text: section.title,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Section'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Section Title',
              hintText: 'Enter a title for this section',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    _sections[sectionIndex].title = titleController.text;
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A3251),
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteSectionDialog(int sectionIndex) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Section'),
          content: const Text(
            'Are you sure you want to delete this section and all its lessons? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _sections.removeAt(sectionIndex);
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showAddLessonDialog(int sectionIndex) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController durationController = TextEditingController();
    LessonType selectedType = LessonType.video;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add New Lesson'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Lesson Title',
                        hintText: 'Enter a title for this lesson',
                      ),
                      autofocus: true,
                    ),
                    const SizedBox(height: 16),
                    const Text('Lesson Type'),
                    DropdownButton<LessonType>(
                      value: selectedType,
                      isExpanded: true,
                      onChanged: (LessonType? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedType = newValue;
                          });
                        }
                      },
                      items:
                          LessonType.values.map((LessonType type) {
                            return DropdownMenuItem<LessonType>(
                              value: type,
                              child: Text(type.name),
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: durationController,
                      decoration: const InputDecoration(
                        labelText: 'Duration',
                        hintText: 'e.g., 10:30',
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        durationController.text.isNotEmpty) {
                      setState(() {
                        _sections[sectionIndex].lessons.add(
                          Lesson(
                            title: titleController.text,
                            type: selectedType,
                            duration: durationController.text,
                          ),
                        );
                      });
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A3251),
                  ),
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showEditLessonDialog(Lesson lesson, int sectionIndex, int lessonIndex) {
    final TextEditingController titleController = TextEditingController(
      text: lesson.title,
    );
    final TextEditingController durationController = TextEditingController(
      text: lesson.duration,
    );
    LessonType selectedType = lesson.type;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Lesson'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Lesson Title',
                        hintText: 'Enter a title for this lesson',
                      ),
                      autofocus: true,
                    ),
                    const SizedBox(height: 16),
                    const Text('Lesson Type'),
                    DropdownButton<LessonType>(
                      value: selectedType,
                      isExpanded: true,
                      onChanged: (LessonType? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedType = newValue;
                          });
                        }
                      },
                      items:
                          LessonType.values.map((LessonType type) {
                            return DropdownMenuItem<LessonType>(
                              value: type,
                              child: Text(type.name),
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: durationController,
                      decoration: const InputDecoration(
                        labelText: 'Duration',
                        hintText: 'e.g., 10:30',
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        durationController.text.isNotEmpty) {
                      setState(() {
                        _sections[sectionIndex].lessons[lessonIndex] = Lesson(
                          title: titleController.text,
                          type: selectedType,
                          duration: durationController.text,
                        );
                      });
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A3251),
                  ),
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showDeleteLessonDialog(int sectionIndex, int lessonIndex) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Lesson'),
          content: const Text(
            'Are you sure you want to delete this lesson? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _sections[sectionIndex].lessons.removeAt(lessonIndex);
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class Section {
  String title;
  List<Lesson> lessons;

  Section({required this.title, required this.lessons});
}

class Lesson {
  String title;
  LessonType type;
  String duration;

  Lesson({required this.title, required this.type, required this.duration});
}

enum LessonType { video, quiz, project, document }
