import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeneficiariesScreen extends StatelessWidget {
  const BeneficiariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'المستفيدون',
          style: GoogleFonts.tajawal(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          // for flixble
          children: [
            const SizedBox(height: 20),
            Text(
              'إنشاء ملفات مستفيدين',
              textAlign: TextAlign.right,
              style: GoogleFonts.tajawal(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'استمتع بتجربة بنكية مختلفة عبر إضافة أكثر من حساب إلى ملف مستفيد واحد!',
              textAlign: TextAlign.right,
              style: GoogleFonts.tajawal(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            _buildFilterRow(),
            const SizedBox(height: 30),
            _buildBeneficiaryCard('Fahad ', 'مصرف الراجحي'),
            const SizedBox(height: 12),
            _buildBeneficiaryCard('Ameerah ', 'البنك السعودي الفرنسي'),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterRow() {
    final filters = ['دولي', 'محلي ', 'البلاد', 'الكل'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:
          filters.map((filter) {
            final isActive = filter == 'الكل';
            return Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? Colors.red[400] : Colors.grey[200],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                filter,
                style: GoogleFonts.tajawal(
                  color: isActive ? Colors.white : Colors.black87,
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildBeneficiaryCard(String name, String bank) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.arrow_left_sharp, size: 40, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: GoogleFonts.tajawal(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  bank,
                  style: GoogleFonts.tajawal(
                    fontSize: 13,
                    color: const Color.fromARGB(255, 185, 160, 160),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.account_balance, size: 30),
        ],
      ),
    );
  }
}
