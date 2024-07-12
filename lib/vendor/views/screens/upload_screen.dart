import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_vendor2/provider/product_provider.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/attribute_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/general_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/image_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/shipping_screen.dart';


class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider = Provider.of<ProductProvider>(context);
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
        bottomSheet: Padding(
          padding: EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow.shade900,
            ),
            onPressed: (){
              print(_productProvider.productData['productName']);
              print(_productProvider.productData['productPrice']);
              print(_productProvider.productData['quantity']);
              print(_productProvider.productData['category']);
              print(_productProvider.productData['description']);
              print(_productProvider.productData['imageUrlList']);
            }, child: Text('Save'),
          ),
        ),
      ),
    );
  }
}
