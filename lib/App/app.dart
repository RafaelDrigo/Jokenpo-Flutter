import 'package:flutter/material.dart';
import './../service/jogo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Game createState() => _Game();
}

class _Game extends State<MyHomePage> {
  Resultado resultadoGame = Resultado("1° jogada", "banner");

  int pointsJogador = 0;
  int pointsInimigo = 0;

  void jogar(String escolhajogador) {
    Resultado resultadoPartida = Jogo().jogar(escolhajogador);

    if (resultadoPartida.resultado == Vitoria)
      pointsJogador++;
    else if (resultadoPartida.resultado == Derrota) pointsInimigo++;

    setState(() {
      this.resultadoGame = resultadoPartida;
      this.pointsJogador = pointsJogador;
      this.pointsInimigo = pointsInimigo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pontos do adversário: $pointsInimigo !'),
            Text('Seus pontos: $pointsJogador !'),
            Text('Resultado: ${resultadoGame.resultado}!'),
            Text('Escolha do Adversário!'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  "assets/images/${resultadoGame.escolhaInimigo}.png",
                  height: 200,
                ),
              ],
            ),
            Text('Sua escolha !'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () => jogar(Pedra),
                  child: Image.asset("assets/images/pedra.png", width: 100),
                ),
                InkWell(
                  onTap: () => jogar(Papel),
                  child: Image.asset(
                    "assets/images/papel.png",
                    width: 100,
                  ),
                ),
                InkWell(
                  onTap: () => jogar(Tesoura),
                  child: Image.asset("assets/images/tesoura.png", width: 100),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
