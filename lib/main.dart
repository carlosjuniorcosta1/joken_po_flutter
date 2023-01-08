import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Home()));
  }
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
var _imagemApp = AssetImage('images/padrao.png');
var _mensagemPadraoEscolha = "Escolha uma das opções abaixo";
var _mensagemPadraoApp = "Escolha do app";
var _mensagemDerrota = "Você perdeu!";
var _mensagemVitoria = "Você ganhou!";
var _mensagemFinalPartida = "";




void opcoesUsuario(String escolhaUsuario){
  print("Você escolheu: "+ escolhaUsuario);
  List<String> opcoesAuto= ['pedra', 'papel', 'tesoura'];
  int quantidadeLista = opcoesAuto.length;
  int escolhaAuto = Random().nextInt(quantidadeLista);
  var escolhaFinal= opcoesAuto[escolhaAuto];

  switch(escolhaFinal)
  {
    case 'pedra':
      setState(() {
        this._imagemApp = AssetImage("images/pedra.png");
        this._mensagemPadraoEscolha = "Você: " + escolhaUsuario;
        this._mensagemPadraoApp = "Aplicativo: " + escolhaFinal;

                  });
      break;
    case 'papel':
      setState(() {
        this._imagemApp = AssetImage("images/papel.png");
        this._mensagemPadraoEscolha = "Você: " + escolhaUsuario;
        this._mensagemPadraoApp = "Aplicativo: " + escolhaFinal;


      });
      break;
    case 'tesoura':
      setState(() {
        this._imagemApp = AssetImage("images/tesoura.png");
        this._mensagemPadraoEscolha = "Você: " + escolhaUsuario;
        this._mensagemPadraoApp = "Aplicativo " + escolhaFinal;


      });
      break;
  }

  if(
  escolhaUsuario == 'pedra' && escolhaFinal == 'papel' ||
  escolhaUsuario == 'papel' && escolhaFinal == 'tesoura' ||
  escolhaUsuario == 'tesoura' && escolhaFinal == 'pedra'
  )
    { setState(() {
      this._mensagemFinalPartida = this._mensagemDerrota;

    });
    }
  else if(

  escolhaFinal == 'pedra' && escolhaUsuario == 'papel' ||
      escolhaFinal == 'papel' && escolhaUsuario == 'tesoura' ||
      escolhaFinal == 'tesoura' && escolhaUsuario == 'pedra'
  )
  {
    setState(() {
      this._mensagemFinalPartida = this._mensagemVitoria;
    });

  }

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPô', style: TextStyle(fontSize: 30, fontFamily: 'Arial Rounded MT Bold' ),), backgroundColor: Colors.green.shade700,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 50, 10, 15),
child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

    children: [
      Text(this._mensagemFinalPartida, style: TextStyle(
        fontWeight: FontWeight.bold, fontFamily: 'Baskerville',
        fontSize: 22)
      ),

      Padding(padding: EdgeInsets.only(bottom: 20)),
      Text(this._mensagemPadraoApp, style: TextStyle(
          fontFamily: 'Baskerville',
          fontSize: 20),),

     Image(image: this._imagemApp),
      Text(this._mensagemPadraoEscolha, style:
          TextStyle(fontSize: 20, fontFamily: 'Baskerville',
          fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

            GestureDetector(
              onTap: (){
                opcoesUsuario('pedra');
              },
              child:
            Image.asset('images/pedra.png', width: 100,)),
      GestureDetector(
        onTap: () {
          opcoesUsuario('papel');
        },
        child:
                    Image.asset('images/papel.png', width: 100,)),
        GestureDetector(
          onTap: (){
            opcoesUsuario('tesoura');
          },
        child:
        Image.asset('images/tesoura.png', width: 100,))
          ]),
      ],  //children
),

    ),
    );

      }
}
