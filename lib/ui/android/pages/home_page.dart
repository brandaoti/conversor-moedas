import 'package:flutter/material.dart';
import 'package:conversor_moedas/controller/txt_field_controller.dart';

import '../../../api/finance_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var request = new FinanceApi();
  var fieldCtrl = FieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        centerTitle: true,
      ),

      // Aqui chamando a request da api dentro do body

      body: FutureBuilder<Map>(
        future: request.getDate(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.waiting:
              return Center(
                child: Text("Carregando dados..."),
              );

            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Erro ao carregar dados!"),
                );
              } else {
                
                // passando as variaveis da consulta da api
                fieldCtrl.dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                fieldCtrl.euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                
                return SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    top: 30.0,
                    right: 20.0,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                        Icons.attach_money, // Se necessario, trocar!
                        color: Theme.of(context).primaryColor,
                        size: 100.0,
                      ),

                      //Instanciando os campos de texto 
                      SizedBox(height: 20.0),
                      buildTextField(
                      "Reais", "R\$ ", 
                      fieldCtrl.realController,
                      fieldCtrl.realChanged,
                      ),

                      SizedBox(height: 20.0),
                      buildTextField(
                      "Dólares", "US\$ ",
                      fieldCtrl.dolarController,
                      fieldCtrl.dolarChanged,
                      ),

                      SizedBox(height: 20.0),
                      buildTextField(
                      "Euros", "£ ",
                      fieldCtrl.euroController,
                      fieldCtrl.euroChanged,
                      ),
                      
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
