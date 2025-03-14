import 'dart:io'; // Importa a biblioteca para entrada e saída no terminal

void main() {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ' ')); // Cria um tabuleiro 3x3 vazio
  String currentPlayer = 'X'; // Define o jogador inicial como 'X'
  bool gameWon = false; // Variável para controlar se o jogo foi vencido

  while (!gameWon && !isBoardFull(board)) { // Continua o jogo até que haja um vencedor ou empate
    printBoard(board); // Exibe o tabuleiro
    playerMove(board, currentPlayer); // Captura a jogada do jogador atual
    gameWon = checkWinner(board, currentPlayer); // Verifica se o jogador atual venceu
    if (gameWon) {
      printBoard(board); // Exibe o tabuleiro final
      print('Jogador $currentPlayer venceu!'); // Exibe a mensagem de vitória
      break;
    }
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X'; // Alterna o jogador
  }

  if (!gameWon) { // Se ninguém ganhou, exibe mensagem de empate
    printBoard(board);
    print('Empate!');
  }
}

void printBoard(List<List<String>> board) { // Função para exibir o tabuleiro
  for (int i = 0; i < 3; i++) {
    print(' ${board[i][0]} | ${board[i][1]} | ${board[i][2]} '); // Exibe uma linha do tabuleiro
    if (i < 2) print('-----------'); // Adiciona separador entre linhas
  }
}

void playerMove(List<List<String>> board, String player) { // Função para capturar a jogada do jogador
  int row, col;
  while (true) {
    stdout.write('Jogador $player, escolha linha e coluna (0-2): '); // Solicita a entrada do jogador
    List<String> input = stdin.readLineSync()?.split(' ') ?? []; // Lê e divide a entrada
    if (input.length == 2) { // Verifica se foram inseridos dois valores
      row = int.tryParse(input[0]) ?? -1; // Converte a linha para inteiro
      col = int.tryParse(input[1]) ?? -1; // Converte a coluna para inteiro
      if (row >= 0 && row < 3 && col >= 0 && col < 3 && board[row][col] == ' ') { // Verifica se a jogada é válida
        board[row][col] = player; // Marca a jogada no tabuleiro
        break;
      }
    }
    print('Jogada inválida, tente novamente.'); // Exibe mensagem de erro se a jogada for inválida
  }
}

bool checkWinner(List<List<String>> board, String player) { // Função para verificar se um jogador venceu
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == player && board[i][1] == player && board[i][2] == player) return true; // Verifica linhas
    if (board[0][i] == player && board[1][i] == player && board[2][i] == player) return true; // Verifica colunas
  }
  if (board[0][0] == player && board[1][1] == player && board[2][2] == player) return true; // Verifica diagonal principal
  if (board[0][2] == player && board[1][1] == player && board[2][0] == player) return true; // Verifica diagonal secundária
  return false;
}

bool isBoardFull(List<List<String>> board) { // Função para verificar se o tabuleiro está cheio
  for (var row in board) {
    if (row.contains(' ')) return false; // Se houver espaço vazio, o tabuleiro não está cheio
  }
  return true; // Retorna verdadeiro se todas as casas estiverem preenchidas
}
