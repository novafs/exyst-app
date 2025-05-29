import 'package:flutter/material.dart';

class CertificatesListScreen extends StatefulWidget {
  const CertificatesListScreen({Key? key}) : super(key: key);

  @override
  State<CertificatesListScreen> createState() => _CertificatesListScreenState();
}

class _CertificatesListScreenState extends State<CertificatesListScreen> {
  bool _isGridView = true;

  final List<Map<String, dynamic>> _certificates = [
    {
      'courseName': 'Flutter Masterclass',
      'instructor': 'John Doe',
      'completionDate': '2025-05-20',
      'certificateId': 'EXY-FL-2025-001',
      'category': 'Programming',
    },
    {
      'courseName': 'Python for Data Science',
      'instructor': 'Jane Smith',
      'completionDate': '2025-05-15',
      'certificateId': 'EXY-PY-2025-002',
      'category': 'Data Science',
    },
    {
      'courseName': 'Web Development Bootcamp',
      'instructor': 'Mike Johnson',
      'completionDate': '2025-05-10',
      'certificateId': 'EXY-WD-2025-003',
      'category': 'Web Development',
    },
    {
      'courseName': 'UI/UX Design Fundamentals',
      'instructor': 'Sarah Wilson',
      'completionDate': '2025-05-05',
      'certificateId': 'EXY-UX-2025-004',
      'category': 'Design',
    },
    {
      'courseName': 'Digital Marketing Mastery',
      'instructor': 'David Brown',
      'completionDate': '2025-04-28',
      'certificateId': 'EXY-DM-2025-005',
      'category': 'Marketing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Certificates'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_certificates.length} certificates earned',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Expanded(child: _isGridView ? _buildGridView() : _buildListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: _certificates.length,
      itemBuilder: (context, index) {
        return _buildCertificateGridCard(_certificates[index]);
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: _certificates.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildCertificateListCard(_certificates[index]),
        );
      },
    );
  }

  Widget _buildCertificateGridCard(Map<String, dynamic> certificate) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/certificate', arguments: certificate);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF0A3251), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF0A3251),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: const Center(
                child: Icon(
                  Icons.workspace_premium,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      certificate['courseName'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3251),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'by ${certificate['instructor']}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const Spacer(),
                    Text(
                      certificate['completionDate'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0A3251).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        certificate['category'],
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3251),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificateListCard(Map<String, dynamic> certificate) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/certificate', arguments: certificate);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF0A3251), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF0A3251),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(
                  Icons.workspace_premium,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificate['courseName'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3251),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'by ${certificate['instructor']}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A3251).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          certificate['category'],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A3251),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        certificate['completionDate'],
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    // Download certificate
                  },
                  icon: const Icon(Icons.download, color: Color(0xFF0A3251)),
                ),
                IconButton(
                  onPressed: () {
                    // Share certificate
                  },
                  icon: const Icon(Icons.share, color: Color(0xFF0A3251)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
