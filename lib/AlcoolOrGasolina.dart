import 'package:flutter/material.dart';
import 'dart:io';

class AlcoolGasolina extends StatefulWidget {
  @override
  _AlcoolOuGasolinaState createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolGasolina> {
  TextEditingController _percurso = TextEditingController();
  TextEditingController _kmAlcool = TextEditingController();
  TextEditingController _kmGasolina = TextEditingController();
  TextEditingController _valorAlcool = TextEditingController();
  TextEditingController _valorGasolina = TextEditingController();
  String _resultado = "";

  void _melhorCustoBeneficio(){
    if((double.tryParse(_percurso.text) != null && double.tryParse(_kmAlcool.text) != null &&
        double.tryParse(_kmGasolina.text) != null && double.tryParse(_valorAlcool.text) != null &&
        double.tryParse(_valorGasolina.text) != null)){
      var qtLitroDeAlcool = (double.tryParse(_percurso.text) / double.tryParse(_kmAlcool.text));
      var qtLitroDeGasolina = (double.tryParse(_percurso.text) / double.tryParse(_kmGasolina.text));
      if((qtLitroDeAlcool*double.tryParse(_valorAlcool.text)) >=(qtLitroDeGasolina*double.tryParse(_valorGasolina.text)))
        setState(() {
          _resultado = "Melhor Abastecer com Gasolina!\nGasolina: ${qtLitroDeGasolina.toStringAsPrecision(2)} litros, total R\$ ${(qtLitroDeGasolina*double.tryParse(_valorGasolina.text)).toStringAsPrecision(4)}"+
          "\nAlcool:  ${qtLitroDeAlcool.toStringAsPrecision(2)} litros, totalizando R\$ ${(qtLitroDeAlcool*double.tryParse(_valorAlcool.text)).toStringAsPrecision(4)}";
        });
      else
        setState(() {
          _resultado = "Melhor Abastecer com Alcool!\nAlcool: ${qtLitroDeAlcool.toStringAsPrecision(2)} litros, totalizam R\$ ${(qtLitroDeAlcool*double.tryParse(_valorAlcool.text)).toStringAsPrecision(4)}"+
              "\nGasolina: ${qtLitroDeGasolina.toStringAsPrecision(2)} litros, totalizando R\$ ${(qtLitroDeGasolina*double.tryParse(_valorGasolina.text)).toStringAsPrecision(4)}";
        });
    }
    else setState(() {
      _resultado = "Pelo menos um dos números é inválido, informe números maiores que zero e utilizando(.)";
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
      ),

      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Image.asset("images/logo.png", height: 60,),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:
                Text("Saiba qual é a melhor opção para o abastecimento do seu carro.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
              ),

              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Informe o Percurso em KM"
                  ),
                  controller: _percurso,
                ),

              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Normalmente sue carro faz quanto KM por litro de Alcool"
                  ),
                  controller: _kmAlcool,
                ),

              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Normalmente sue carro faz quanto KM por litro de Gasolina"
                  ),
                  controller: _kmGasolina,
                ),

              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço litro de Alcool, Ex. 1.22"
                  ),
                  controller: _valorAlcool,
                ),

              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço litro de Gasolina, Ex. 1.59"
                  ),
                  controller: _valorGasolina,
                ),

              Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child:
                  RaisedButton(
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: _melhorCustoBeneficio,
                  )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2),
                child:
                Text(_resultado,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
