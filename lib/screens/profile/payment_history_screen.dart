import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  String _selectedFilter = 'All';

  final List<String> _filters = ['All', 'Completed', 'Pending', 'Failed'];

  final List<Map<String, dynamic>> _payments = [
    {
      'courseName': 'Flutter Masterclass',
      'amount': 59.99,
      'date': '2025-05-20',
      'status': 'Completed',
      'paymentMethod': 'Credit Card',
      'transactionId': 'TXN123456789',
    },
    {
      'courseName': 'Python for Beginners',
      'amount': 39.99,
      'date': '2025-05-15',
      'status': 'Completed',
      'paymentMethod': 'PayPal',
      'transactionId': 'TXN123456788',
    },
    {
      'courseName': 'Web Development Bootcamp',
      'amount': 89.99,
      'date': '2025-05-10',
      'status': 'Completed',
      'paymentMethod': 'Credit Card',
      'transactionId': 'TXN123456787',
    },
    {
      'courseName': 'Data Science Fundamentals',
      'amount': 49.99,
      'date': '2025-05-05',
      'status': 'Failed',
      'paymentMethod': 'Credit Card',
      'transactionId': 'TXN123456786',
    },
    {
      'courseName': 'Mobile App Development',
      'amount': 69.99,
      'date': '2025-04-28',
      'status': 'Completed',
      'paymentMethod': 'Apple Pay',
      'transactionId': 'TXN123456785',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredPayments =
        _payments.where((payment) {
          if (_selectedFilter == 'All') return true;
          return payment['status'] == _selectedFilter;
        }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Filter Section
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = _selectedFilter == filter;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xFF0A3251),
                    labelStyle: TextStyle(
                      color:
                          isSelected ? Colors.white : const Color(0xFF0A3251),
                    ),
                  ),
                );
              },
            ),
          ),

          // Summary Section
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0A3251),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Spent',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$309.95',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Courses Purchased',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'This Month',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$149.97',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Payment List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredPayments.length,
              itemBuilder: (context, index) {
                final payment = filteredPayments[index];
                return _buildPaymentItem(payment);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(Map<String, dynamic> payment) {
    Color statusColor;
    IconData statusIcon;

    switch (payment['status']) {
      case 'Completed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        statusIcon = Icons.access_time;
        break;
      case 'Failed':
        statusColor = Colors.red;
        statusIcon = Icons.error;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  payment['courseName'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A3251),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(statusIcon, size: 16, color: statusColor),
                    const SizedBox(width: 4),
                    Text(
                      payment['status'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${payment['amount'].toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3251),
                ),
              ),
              Text(
                payment['date'],
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                payment['paymentMethod'],
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Text(
                payment['transactionId'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          if (payment['status'] == 'Failed') ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Retry payment
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                child: const Text('Retry Payment'),
              ),
            ),
          ],
          if (payment['status'] == 'Completed') ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Download receipt
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('Receipt'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF0A3251),
                      side: const BorderSide(color: Color(0xFF0A3251)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/course-details');
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('View Course'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF0A3251),
                      side: const BorderSide(color: Color(0xFF0A3251)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
