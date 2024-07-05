import 'package:flutter/material.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter Product Name'),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter Product Price'),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter Product Qty'),
          ),

        ],
      ),
    ));
  }
}
