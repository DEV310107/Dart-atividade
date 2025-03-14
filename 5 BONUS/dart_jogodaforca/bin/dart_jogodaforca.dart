import 'dart:io'; // Importa a biblioteca para manipulação de entrada e saída no console
import 'dart:math'; // Importa a biblioteca para gerar números aleatórios (utilizada na escolha da palavra secreta)

void main() {
  // Lista de palavras possíveis para o jogo
  List<String> palavras = ['abacaxi', 'banana', 'cachorro', 'elefante', 'rever'];

  // Criando uma instância do Random para selecionar uma palavra aleatória
  Random random = Random();

  // Escolhendo uma palavra secreta aleatória da lista de palavras
  String palavraSecreta = palavras[random.nextInt(palavras.length)];

  // Inicializando a palavra oculta com underscores (_) para cada letra da palavra secreta
  List<String> palavraOculta = List.filled(palavraSecreta.length, '_');

  // Lista para armazenar as letras erradas que o jogador tentou
  List<String> letrasErradas = [];

  // Inicializando o número de tentativas restantes (máximo de 6 tentativas)
  int tentativasRestantes = 6;

  // Mensagem inicial de boas-vindas
  print('Bem-vindo ao Jogo da Forca!');

  // Loop principal do jogo. Continua até que o jogador vença ou perca.
  while (tentativasRestantes > 0) {
    // Exibe o estado atual do jogo (palavra oculta, tentativas restantes e letras erradas)
    exibirJogo(palavraOculta, tentativasRestantes, letrasErradas);

    // Lê a entrada do jogador (uma letra)
    String tentativa = lerEntrada();

    // Verifica se o jogador digitou apenas uma letra válida
    if (tentativa.length != 1 || !RegExp(r'^[a-zA-Z]$').hasMatch(tentativa)) {
      print('Por favor, digite apenas uma letra.');
      continue; // Se a entrada for inválida, o loop continua
    }

    // Verifica se o jogador já tentou essa letra antes
    if (letrasErradas.contains(tentativa) || palavraOculta.contains(tentativa)) {
      print('Você já tentou essa letra.');
      continue; // Se a letra já foi tentada, o loop continua
    }

    // Verifica se a letra digitada está na palavra secreta
    if (palavraSecreta.contains(tentativa)) {
      // Se acertou, atualiza a palavra oculta com a letra correta
      atualizarPalavraOculta(tentativa, palavraSecreta, palavraOculta);

      // Verifica se o jogador adivinhou todas as letras da palavra secreta
      if (!palavraOculta.contains('_')) {
        // Se não houver mais underscores, significa que a palavra foi completamente adivinhada
        exibirJogo(palavraOculta, tentativasRestantes, letrasErradas);
        print('Parabéns! Você venceu! A palavra era "$palavraSecreta".');
        break; // Termina o jogo com vitória
      }
    } else {
      // Se a letra não estiver na palavra, é adicionada à lista de letras erradas
      letrasErradas.add(tentativa);
      // O número de tentativas restantes é reduzido
      tentativasRestantes--;

      // Se as tentativas acabarem, o jogador perdeu
      if (tentativasRestantes == 0) {
        exibirJogo(palavraOculta, tentativasRestantes, letrasErradas);
        print('Você perdeu! A palavra era "$palavraSecreta".');
      }
    }
  }
}

// Função para exibir o estado atual do jogo
void exibirJogo(List<String> palavraOculta, int tentativasRestantes, List<String> letrasErradas) {
  // Exibe a palavra oculta com espaços entre as letras
  print('\nPalavra: ${palavraOculta.join(' ')}');
  // Exibe o número de tentativas restantes
  print('Tentativas restantes: $tentativasRestantes');
  // Exibe as letras erradas tentadas pelo jogador
  print('Letras erradas: ${letrasErradas.join(', ')}');
}

// Função para ler a entrada do jogador (uma letra)
String lerEntrada() {
  // Solicita que o jogador digite uma letra
  stdout.write('Digite uma letra: ');
  // Lê a entrada e converte para minúsculo para uniformizar
  return stdin.readLineSync()!.toLowerCase();
}

// Função para atualizar a palavra oculta com a letra correta
void atualizarPalavraOculta(String letra, String palavraSecreta, List<String> palavraOculta) {
  // Percorre a palavra secreta e substitui os underscores na palavra oculta com a letra correta
  for (int i = 0; i < palavraSecreta.length; i++) {
    if (palavraSecreta[i] == letra) {
      palavraOculta[i] = letra; // Substitui o "_" pela letra acertada
    }
  }
}
