import 'package:flutter/material.dart';

class FieldController {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double real;
  double dolar;
  double euro;

  void realChanged(String text) {
    real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void dolarChanged(String text) {
    print(text);
  }

  void euroChanged(String text) {
    print(text);
  }
}

Widget buildTextField(String label, String prefix,
    TextEditingController controller, Function onChange) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(fontSize: 14.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      prefixText: prefix,
    ),
    style: TextStyle(
      color: Colors.purple,
    ),
    controller: controller,
    onChanged: onChange,
  );
}
