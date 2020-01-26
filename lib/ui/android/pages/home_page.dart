import 'package:flutter/material.dart';
import 'package:conversor_moedas/ui/android/pages/build_txt_field.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: 20.0, top: 30.0, right: 20.0), //Alterar posição
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.monetization_on, // Se necessario, trocar!
              color: Colors.purple,
              size: 100.0,
            ),

            SizedBox(height: 20.0),
            buildTextField("Reais", "R\$ "),
            SizedBox(height: 20.0),
            buildTextField("Dólares", "US\$ "),
            SizedBox(height: 20.0),
            buildTextField("EUROS", "£ "),

          ],
        ),
      ),
    );
  }
}
