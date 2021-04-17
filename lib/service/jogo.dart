
import 'dart:math';

const PEDRA = 'pedra';
const PAPEL = 'papel';
const TESOURA = 'tesoura';

const GANHOU = "Ganhou";
const DERROTA = "Derrota";
const EMPATE = "Empate";

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
    var opcoes = [PEDRA, PAPEL, TESOURA ];    
    var escolha = Random().nextInt(opcoes.length);
    return opcoes[escolha];
  }

  Resultado verificarResultado(String jogador, String inimigo){

    if (jogador == inimigo)
      return Resultado(EMPATE, inimigo);

    bool jogadorGanhaComPedra = (jogador == PEDRA && inimigo == TESOURA);
    bool jogadorGanhaComTesoura = (jogador == TESOURA && inimigo == PAPEL);
    bool jogadorGanhaComPapel = (jogador == PAPEL && inimigo == PEDRA);
    if (jogadorGanhaComPedra || jogadorGanhaComTesoura || jogadorGanhaComPapel)
      return Resultado(GANHOU, inimigo);
    
    return Resultado(DERROTA, inimigo);
  }
}
