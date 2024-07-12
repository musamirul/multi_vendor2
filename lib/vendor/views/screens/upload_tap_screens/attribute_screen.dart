import 'package:flutter/material.dart';

class AttributeScreen extends StatelessWidget {
  const AttributeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Brand',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  width: 100,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Size'),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add'),
                style:
                    ElevatedButton.styleFrom(primary: Colors.yellow.shade900),
              )
            ],
          )
        ],
      ),
    );
  }
}
