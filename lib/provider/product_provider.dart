import 'package:flutter/material.dart';

//purpose: this class will be used to manage and notify listener about the change
class ProductProvider extends ChangeNotifier {
  //this map will store the products related information
  Map<String, dynamic> productData = {};

  //this method will be used to update the product related fields
  getFormData(
      {String? productName,
      double? productPrice,
      int? quantity,
      String? category,
      String? description,
      DateTime? scheduleDate,
      List<String>? imageUrlList,
      bool? chargeShipping,
      int? shippingCharge, String? brandName, List<String>? sizeList}) {
    //check if productName is not null

    //purpose : ensure that only non null values where added
    if (productName != null) {
      productData['productName'] = productName;
    }
    if (productPrice != null) {
      productData['productPrice'] = productPrice;
    }
    if (quantity != null) {
      productData['quantity'] = quantity;
    }
    if (category != null) {
      productData['category'] = category;
    }
    if (description != null) {
      productData['description'] = description;
    }
    if (scheduleDate != null) {
      productData['scheduleDate'] = scheduleDate;
    }
    if (imageUrlList != null) {
      productData['imageUrlList'] = imageUrlList;
    }
    if (chargeShipping != null) {
      productData['chargeShipping'] = chargeShipping;
    }
    if (shippingCharge != null) {
      productData['shippingCharge'] = shippingCharge;
    }
    if (brandName != null) {
      productData['brandName'] = brandName;
    }
    if (sizeList != null) {
      productData['sizeList'] = sizeList;
    }

    notifyListeners();
  }

  clearData(){
    productData.clear();
    notifyListeners();
  }
}
