import 'package:flutter/material.dart';

Widget buildTextField(String label, String prefix) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      //labelStyle: TextStyle(fontSize: 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      prefixText: prefix,
    ),
    style: TextStyle(color: Colors.purple),
  );
}
