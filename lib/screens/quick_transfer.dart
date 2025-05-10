import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickTransferScreen extends StatefulWidget {
  const QuickTransferScreen({super.key});

  @override
  State<QuickTransferScreen> createState() => _QuickTransferScreenState();
}

class _QuickTransferScreenState extends State<QuickTransferScreen> {
  int selectedMethodIndex = 0;
  final List<String> methods = [
    'آيبان',
    'رقم الهاتف',
    'البريد الإلكتروني',
    'رقم الهوية',
  ];

  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      //for arabic app
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء", style: TextStyle(color: Colors.grey)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'تحويل سريع',
                style: GoogleFonts.tajawal(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // transfer method
              _buildMethodSelector(),

              const SizedBox(height: 20),

              Text(
                "البنك",
                style: GoogleFonts.tajawal(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),

              _buildBankPlaceholder(),
              const Spacer(),

              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMethodSelector() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: List.generate(methods.length, (index) {
          // draw the list in row and count for list equl number in method
          bool isSelected = selectedMethodIndex == index;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedMethodIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.red : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Icon(
                      _getMethodIcon(index),
                      color: isSelected ? Colors.white : Colors.black,
                      size: 20,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      methods[index],
                      style: GoogleFonts.tajawal(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  IconData _getMethodIcon(int index) {
    switch (index) {
      case 0:
        return Icons.account_balance;
      case 1:
        return Icons.phone_android;
      case 2:
        return Icons.email;
      case 3:
        return Icons.badge_outlined;
      default:
        return Icons.info;
    }
  }

  Widget _buildBankPlaceholder() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        "بنك المستفيد",
        style: GoogleFonts.tajawal(color: Colors.grey[600], fontSize: 14),
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      width: double.infinity,
      height: 52,
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          'التالي',
          style: GoogleFonts.tajawal(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
