import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'المدفوعات الحكومية',
            style: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            labelStyle: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'المدفوعات'),
              Tab(text: 'استرداد'),
              Tab(text: 'طلبات الاسترداد'),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        body: const TabBarView(
          children: [_PaymentsTab(), _RefundTab(), _RequestsTab()],
        ),
      ),
    );
  }
}

class _PaymentsTab extends StatelessWidget {
  const _PaymentsTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.receipt_long, size: 60, color: Colors.grey),
          SizedBox(height: 10),
          Text('لا توجد مدفوعات حالياً', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _RefundTab extends StatelessWidget {
  const _RefundTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.undo, size: 60, color: Colors.grey),
          SizedBox(height: 10),
          Text('لا توجد عمليات استرداد', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _RequestsTab extends StatelessWidget {
  const _RequestsTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.help_outline, size: 60, color: Colors.grey),
          SizedBox(height: 10),
          Text('لا توجد طلبات استرداد', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
