import 'package:flutter/material.dart';
import 'package:flutter_application_1/payment3.dart';

class Androidlarge21Widget extends StatefulWidget {
  const Androidlarge21Widget({Key? key}) : super(key: key);

  @override
  _Androidlarge21WidgetState createState() => _Androidlarge21WidgetState();
}

class _Androidlarge21WidgetState extends State<Androidlarge21Widget> {
  bool _showUPIInput = false;

  void _toggleUPIInput() {
    setState(() {
      _showUPIInput = !_showUPIInput;
    });
  }

  void _navigateToCongratulationsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CongratulationsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEE0C6), // Background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 8),
                Text(
                  'Payment',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF303030),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'You are almost there...Choose your payment method',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24),
            paymentMethodItem(context, 'Visa', 'assets/images/payment1/visa.png'),
            GestureDetector(
              onTap: _toggleUPIInput,
              child: paymentMethodItem(context, 'UPI Payment', 'assets/images/payment1/upi.png'),
            ),
            if (_showUPIInput) ...[
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter UPI ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
            SizedBox(height: 16),
            GestureDetector(
              onTap: _navigateToCongratulationsPage,
              child: paymentMethodItem(context, 'Cash on Delivery', 'assets/images/payment1/cash.png'),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Color(0xFF5B645F),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/payment1/rupee.png',
                      width: 24,
                      height: 24,
                      semanticLabel: 'currency_rupee',
                    ),
                    SizedBox(width: 5),
                    Text(
                      '1250',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Color(0xFF5B645F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: _navigateToCongratulationsPage,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFC9A070), // Button color
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'PAY & CONFIRM YOUR ORDER',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget paymentMethodItem(BuildContext context, String title, String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          if (title == 'Visa') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CardDetailsPage()),
            );
          } else if (title == 'UPI Payment') {
            _toggleUPIInput();
          } else if (title == 'Cash on Delivery') {
            _navigateToCongratulationsPage();
          }
        },
        child: Row(
          children: [
            Image.asset(
              asset,
              width: 36,
              height: 36,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Color(0xFF1F1F1F),
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

class CardDetailsPage extends StatelessWidget {
  const CardDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card'),
      ),
      backgroundColor: Color(0xFFEEE0C6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Holder Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Expire Date',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC9A070),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'ADD CARD',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
