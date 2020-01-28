import 'package:flutter/material.dart';

class FieldController {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  // Variaveis que vai receber as consultas da api
  double dolar;
  double euro;

  void _clearField(){
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  //Funções responsavel pela conversão de valores.
  void realChanged(String text) {
    if(text.isEmpty){
      _clearField();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void dolarChanged(String text) {
    if(text.isEmpty){
      _clearField();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void euroChanged(String text) {
    if(text.isEmpty){
      _clearField();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }
}

// Widget responsavel pela construção dos campos de texto
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
      color: Colors.green,
    ),
    controller: controller,
    onChanged: onChange,
  );
}
