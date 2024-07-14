import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor2/vendor/views/screens/main_vendor_screen.dart';
import 'package:provider/provider.dart';
import 'package:multi_vendor2/provider/product_provider.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/attribute_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/general_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/image_screen.dart';
import 'package:multi_vendor2/vendor/views/screens/upload_tap_screens/shipping_screen.dart';
import 'package:uuid/uuid.dart';


class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider = Provider.of<ProductProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Form(
        key: _formKey,
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
              onPressed: () async{
                if(_formKey.currentState!.validate()){
                  final productId = Uuid().v4();
                  await _firestore.collection('products').doc(productId).set({
                    'productId' : productId,
                    'productName' : _productProvider.productData['productName'],
                    'productPrice' : _productProvider.productData['productPrice'],
                    'quantity' : _productProvider.productData['quantity'],
                    'category' : _productProvider.productData['category'],
                    'description' : _productProvider.productData['description'],
                    'imageUrlList' : _productProvider.productData['imageUrlList'],
                    'scheduleDate' : _productProvider.productData['scheduleDate'],
                    'chargeShipping' : _productProvider.productData['chargeShipping'],
                    'shippingCharge' : _productProvider.productData['shippingCharge'],
                    'brandName' : _productProvider.productData['brandName'],
                    'sizeList' : _productProvider.productData['sizeList'],
                  }).whenComplete((){
                    _productProvider.clearData();
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MainVendorScreen();
                    },));
                  });

                  // print(_productProvider.productData['productName']);
                  // print(_productProvider.productData['productPrice']);
                  // print(_productProvider.productData['quantity']);
                  // print(_productProvider.productData['category']);
                  // print(_productProvider.productData['description']);
                  // print(_productProvider.productData['imageUrlList']);
                }

              }, child: Text('Save'),
            ),
          ),
        ),
      ),
    );
  }
}
