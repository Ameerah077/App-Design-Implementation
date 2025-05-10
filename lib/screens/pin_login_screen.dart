import 'package:flutter/material.dart';

class PinLoginScreen extends StatefulWidget {
  const PinLoginScreen({super.key});

  @override
  State<PinLoginScreen> createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  String pin = ''; // store the pin from user

  void _onKeyPress(String value) {
    if (pin.length < 5) {
      setState(() {
        pin += value; // increesing if the user add pin .. until equel 5
      });

      if (pin.length == 5) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.pushReplacementNamed(context, '/main');
        });
      }
    }
  }

  void _onDelete() {
    if (pin.isNotEmpty) {
      // if the pin not empty the user can use botton delet
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFFEFEFEF),
              child: Text(
                'أ',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            const SizedBox(height: 12),

            // The date for today
            const Text(
              'الخميس، مايو ٨',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 6),

            const Text(
              'أهلًا بعودتك\nاميره',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final filled = index < pin.length;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: filled ? Colors.black : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  physics:
                      const NeverScrollableScrollPhysics(), //Don't need the scroll
                  itemBuilder: (context, index) {
                    if (index < 9) {
                      return _buildKey((index + 1).toString());
                    } else if (index == 9) {
                      return _buildBiometricKey();
                    } else if (index == 10) {
                      return _buildKey('0');
                    } else {
                      return _buildDeleteKey();
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // forget password
            const Text(
              'نسيت الرقم السري؟',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildKey(String number) {
    return GestureDetector(
      onTap: () => _onKeyPress(number), // go the up method for implement
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          number,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDeleteKey() {
    return GestureDetector(
      onTap: _onDelete,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.close, size: 24),
      ),
    );
  }

  Widget _buildBiometricKey() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.fingerprint, color: Colors.red, size: 30),
      ),
    );
  }
}
