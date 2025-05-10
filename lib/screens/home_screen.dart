import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        drawer: _buildDrawer(context),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'الرئيسية',
            style: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGreetingSection(),
              const SizedBox(height: 20),
              _buildAccountsSection(),
              const SizedBox(height: 20),
              _buildTransferSection(context),
              const SizedBox(height: 20),
              _buildCardsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // The drawer
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.red),
            child: Text(
              'مرحبًا بك 👋',
              style: GoogleFonts.tajawal(fontSize: 18, color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('الرئيسية'),
            onTap: () => Navigator.pushReplacementNamed(context, '/main'),
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('البطاقات'),
            onTap: () => Navigator.pushNamed(context, '/cards'),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('المدفوعات'),
            onTap: () => Navigator.pushNamed(context, '/payment'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('الملف الشخصي'),
            onTap: () => Navigator.pushNamed(context, '/profile'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('تسجيل الخروج'),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'الخميس، مايو ٨',
          style: GoogleFonts.tajawal(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          'مساء الخير،أميرة',
          textAlign: TextAlign.right,
          style: GoogleFonts.tajawal(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildAccountsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الحسابات',
          style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildAccountCard('الجاري', '738.13'),
            const SizedBox(width: 12),
            _buildAccountCard('استثمار', '8.32'),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountCard(String title, String amount) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.tajawal(fontSize: 16)),
            const SizedBox(height: 8),
            Text(
              '$amount ريال',
              style: GoogleFonts.tajawal(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        Text(
          'تحويل',
          style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/quick_transfer'),
              child: _buildTransferItem(Icons.attach_money, 'تحويل سريع'),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/beneficiaries'),
              child: _buildTransferItem(Icons.group, 'المستفيدون'),
            ),
            const Spacer(),
            _buildTransferItem(Icons.folder_shared, 'ملفات المستفيدين'),
          ],
        ),
      ],
    );
  }

  Widget _buildTransferItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE5E5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.red, size: 20),
        ),
        const SizedBox(height: 6),
        Text(label, style: GoogleFonts.tajawal(fontSize: 12)),
      ],
    );
  }

  Widget _buildCardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'البطاقات',
          style: GoogleFonts.tajawal(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/images/mycard.png'),
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
