import 'package:flutter/material.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/attribute_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/general_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/image_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/shipping_screen.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade900,
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(child: Text('General'),),
            Tab(child: Text('Shipping'),),
            Tab(child: Text('Attribute'),),
            Tab(child: Text('Images'),),
          ]),
        ),
        body: TabBarView(
          children: [
            GeneralScreen(),
            ShippingScreen(),
            AttributeScreen(),
            ImageScreen(),
          ],
        ),
      ),
    );
  }
}
