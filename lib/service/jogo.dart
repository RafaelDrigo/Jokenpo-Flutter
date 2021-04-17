
import 'dart:math';

const Pedra = 'pedra';
const Papel = 'papel';
const Tesoura = 'tesoura';

const Vitoria = "Vitória";
const Derrota = "Derrota";
const Empate = "Empate";

class Resultado {
  final String resultado ;
  final String escolhaInimigo;
  Resultado(this.resultado, this.escolhaInimigo);
}

class Jogo {
  
  Resultado jogar(String jogador){
    String escolhaApp = gerarEscolhaAPP();
    Resultado resultado = verificarResultado(jogador , escolhaApp);
    return resultado ;
  }

    String gerarEscolhaAPP() {
    var opcoes = [Pedra, Papel, Tesoura ];    
    var escolha = Random().nextInt(opcoes.length);
    return opcoes[escolha];
  }

  Resultado verificarResultado(String jogador, String inimigo){

    if (jogador == inimigo)
      return Resultado(Empate, inimigo);

    bool jogadorGanhaComPedra = (jogador == Pedra && inimigo == Tesoura);
    bool jogadorGanhaComTesoura = (jogador == Tesoura && inimigo == Papel);
    bool jogadorGanhaComPapel = (jogador == Papel && inimigo == Pedra);
    if (jogadorGanhaComPedra || jogadorGanhaComTesoura || jogadorGanhaComPapel)
      return Resultado(Vitoria, inimigo);
    
    return Resultado(Derrota, inimigo);
  }
}
