import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor2/vendor/views/screens/earnings_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/edit_product_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/vendor_logout_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/vendor_order_screen.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  int _pageIndex =0;
  List<Widget> _pages = [
    EarningsScreen(),
    UploadScreen(),
    EditProductScreen(),
    VendorOrderScreen(),
    VendorLogoutScreen(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.yellow.shade900,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.money),label: 'EARNINGS'),
          BottomNavigationBarItem(icon: Icon(Icons.upload),label: 'UPLOAD'),
          BottomNavigationBarItem(icon: Icon(Icons.edit),label: 'EDIT'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'ORDERS'),
          BottomNavigationBarItem(icon: Icon(Icons.logout),label: 'LOGOUT'),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
