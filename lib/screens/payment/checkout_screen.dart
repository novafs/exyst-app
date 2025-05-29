import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedPaymentMethod = 0;
  int _selectedEWallet = -1;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 120,
                      height: 120,
                      color: const Color(0xFF0A3251),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF5733),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
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
                        const Text(
                          'Course Title',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A3251),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'By Owner',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '\$ 89.99',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3251),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3251),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Item Price',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0A3251),
                        ),
                      ),
                      Text(
                        '\$ 89.99',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0A3251),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Tax',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0A3251),
                        ),
                      ),
                      Text(
                        '\$ 8.99',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0A3251),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3251),
                        ),
                      ),
                      Text(
                        '\$ 97.99',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3251),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3251),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildPaymentMethodItem(
                    0,
                    'Credit Card',
                    Icons.credit_card,
                    Colors.blue[100]!,
                  ),
                  const SizedBox(height: 8),
                  if (_selectedPaymentMethod == 0) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _cardNumberController,
                            decoration: const InputDecoration(
                              hintText: 'Card Number',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _expiryDateController,
                                  decoration: const InputDecoration(
                                    hintText: 'MM/YY',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  controller: _cvvController,
                                  decoration: const InputDecoration(
                                    hintText: 'CVV',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  _buildPaymentMethodItem(
                    1,
                    'PayPal',
                    Icons.payment,
                    Colors.white,
                  ),
                  const SizedBox(height: 8),
                  _buildPaymentMethodItem(
                    2,
                    'E-Wallet',
                    Icons.account_balance_wallet,
                    Colors.blue[100]!,
                  ),
                  const SizedBox(height: 8),
                  if (_selectedPaymentMethod == 2) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          _buildEWalletItem(
                            0,
                            'Gopay',
                            'assets/images/gopay.png',
                          ),
                          const SizedBox(height: 8),
                          _buildEWalletItem(1, 'OVO', 'assets/images/ovo.png'),
                          const SizedBox(height: 8),
                          _buildEWalletItem(
                            2,
                            'Dana',
                            'assets/images/dana.png',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Process payment
            Navigator.pushReplacementNamed(context, '/home');
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
            'Pay Now',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodItem(
    int index,
    String title,
    IconData icon,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = index;
          if (index != 2) {
            _selectedEWallet = -1;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                _selectedPaymentMethod == index
                    ? const Color(0xFF0A3251)
                    : Colors.grey[300]!,
            width: _selectedPaymentMethod == index ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Radio(
              value: index,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value as int;
                  if (value != 2) {
                    _selectedEWallet = -1;
                  }
                });
              },
              activeColor: const Color(0xFF0A3251),
            ),
            const SizedBox(width: 8),
            Icon(icon, color: const Color(0xFF0A3251)),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A3251),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEWalletItem(int index, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedEWallet = index;
        });
      },
      child: Row(
        children: [
          Radio(
            value: index,
            groupValue: _selectedEWallet,
            onChanged: (value) {
              setState(() {
                _selectedEWallet = value as int;
              });
            },
            activeColor: const Color(0xFF0A3251),
          ),
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                title[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3251),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A3251),
            ),
          ),
        ],
      ),
    );
  }
}
