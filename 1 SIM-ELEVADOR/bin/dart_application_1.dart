import "dart:io"; //importa a biblioteca dart:io

void main() {
  int andarAtual = 1; //define o andar atual
  const int andarMax = 10; //define o andar máximo 
  const int andarMin = 1; //define um andar mínimo

  while (true) { //define um loop
    print("\n=== Simulado De Elevador ==="); 
    print("Andar Atual $andarAtual");
    print("1 - Subir Andar");
    print("2 - Descer Andar");
    print("3 - Sair");
    stdout.write("Escolha Uma Opção: "); //"input"
    String? Escolha = stdin.readLineSync();
    stdout.write('\x1b[2J\x1b[H');//limpa console

    if (Escolha == "1") {
      stdout.write("Digite O Andar Que Deseja Subir: "); //input
      int? destino = int.tryParse(stdin.readLineSync() ?? "");
      if (destino != null && destino > andarAtual && destino <= andarMax) {
        print("Subindo...");
        for (int i = andarAtual + 1; i <= destino; i++) { //corrigido o erro de sintaxe
          print("andar: $i"); //mostra o andar que está
          sleep(Duration(milliseconds: 500)); //aguarda meio segundo entre andares
          stdin.readLineSync();//pausa console 
          stdout.write('\x1b[2J\x1b[H');//limpa console
        }
        andarAtual = destino; //atualiza o andar atual após a subida
      } else {
        print("Escolha inválida. O andar de destino deve ser maior que o atual e dentro do limite.");
        stdin.readLineSync();//pausa console 
        stdout.write('\x1b[2J\x1b[H');//limpa console 
      }
    }

    else if (Escolha == "2") {
      stdout.write("Digite o andar que deseja descer: ");
      int? destino = int.tryParse(stdin.readLineSync() ?? "");
      if (destino != null && destino < andarAtual && destino >= andarMin) {
        print("Descendo...");
        for (int i = andarAtual - 1; i >= destino; i--) {
          print("andar $i");
          sleep(Duration(milliseconds: 500)); //corrigido o erro de nome da função
          stdin.readLineSync(); //pausa console
          stdout.write('\x1b[2J\x1b[H');//limpa console
        }
        andarAtual = destino; //atualiza o andar atual após a descida
      } else {
        print("Escolha inválida. O elevador não pode descer para esse andar.");
        stdin.readLineSync();//pausa console
        stdout.write('\x1b[2J\x1b[H');//limpa console 
      }
    }
    else if (Escolha == "3") { 
      print("Saindo..."); //mensagem de saída do loop
      stdin.readLineSync();//pausa console 
      stdout.write('\x1b[2J\x1b[H');//limpa console 
      break; //sai do loop
    } else {
      print("Opção inválida... tente novamente");
      stdin.readLineSync();//pausa console 
      stdout.write('\x1b[2J\x1b[H');//limpa console 
    }
  }
}
