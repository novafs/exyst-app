import 'package:flutter/material.dart';

class ProgressCourseCard extends StatelessWidget {
  final String title;
  final String? instructor;
  final int? lessonsRemaining;
  final int? totalLessons;
  final int? completedLessons;
  final String? nextLesson;
  final double progress;
  final VoidCallback? onContinue;
  final VoidCallback? onTap;

  const ProgressCourseCard({
    Key? key,
    required this.title,
    this.instructor,
    this.lessonsRemaining,
    this.totalLessons,
    this.completedLessons,
    this.nextLesson,
    required this.progress,
    this.onContinue,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 100,
                height: 100,
                color: const Color(0xFF0A3251),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF5733),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Center(
                          child: Icon(Icons.play_arrow, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '5 Projects',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (instructor != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'by $instructor',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    '${lessonsRemaining ?? 0} Lessons Remaining',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  if (totalLessons != null || completedLessons != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${completedLessons ?? 0} of ${totalLessons ?? 0} completed',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.grey[300],
                            color: const Color(0xFF0A3251),
                            minHeight: 8,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3251),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Next : ${nextLesson ?? 'No lesson'}',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: onContinue ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB3B6E5),
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Continue'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
