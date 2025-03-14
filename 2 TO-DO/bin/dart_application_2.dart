import 'dart:io'; //importa biblioteca que recebe dados 

class Tarefa {
  String titulo;
  String descricao;
  String urgencia;

  Tarefa(this.titulo, this.descricao, this.urgencia);
}

List<Tarefa> listaTarefas = [];// cria uma list

void main() {
  while (true) { //cria um loop para o menu
    print("\n=== GESTÃO DE TAREFAS ===");
    print("1 - Incluir Tarefa");
    print("2 - Listar Todas as Tarefas");
    print("3 - Excluir Tarefa");
    print("4 - Sair");
    
    stdout.write("Escolha uma opção: ");//cria um input para selecionar opção
    String? escolha = stdin.readLineSync();//le a opção de usuario"
    print("\x1B[2J\x1B[0;0H"); 

    if (escolha == "1") { // Se a escolha for "1", chama a função 'incluirTarefa'.
      incluirTarefa();
    } else if (escolha == "2") {// Se a escolha for "2", chama a função 'listarTarefas'.
      listarTarefas();
    } else if (escolha == "3") {// Se a escolha for "3", chama a função 'excluirTarefa'.
      excluirTarefa();
    } else if (escolha == "4") {// Se a escolha for "4", sai do codigo.
      print("Saindo...");
      break;//fecha o loop
    } else {
      print("Opção inválida! Tente novamente.");
    }
  }
}

void incluirTarefa() {
  stdout.write("Título da Tarefa: ");
  String titulo = stdin.readLineSync() ?? "";
  print("\x1B[2J\x1B[0;0H"); 

  stdout.write("Descrição: ");
  String descricao = stdin.readLineSync() ?? "";
  print("\x1B[2J\x1B[0;0H"); 

  stdout.write("Grau de Urgência (Baixa, Média, Alta): ");
  String urgencia = stdin.readLineSync() ?? "";
  print("\x1B[2J\x1B[0;0H"); 

  listaTarefas.add(Tarefa(titulo, descricao, urgencia));

  print("Tarefa adicionada com sucesso!");
  stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H"); 
}

void listarTarefas() {
  if (listaTarefas.isEmpty) {
    print("Nenhuma tarefa cadastrada.");
  } else {
    print("\n=== LISTA DE TAREFAS ===");
    
    for (int i = 0; i < listaTarefas.length; i++) {
      print("\nTarefa ${i + 1}:");
      print("Título: ${listaTarefas[i].titulo}");
      print("Descrição: ${listaTarefas[i].descricao}");
      print("Grau de Urgência: ${listaTarefas[i].urgencia}");
    }
    stdin.readLineSync();
    print("\x1B[2J\x1B[0;0H"); 
  }
}

void excluirTarefa() {
  stdout.write("Digite o título da tarefa a ser excluída: ");
  String titulo = stdin.readLineSync() ?? "";

  listaTarefas.removeWhere((tarefa) => tarefa.titulo.toLowerCase() == titulo.toLowerCase());

  print("Tarefa removida, se existia na lista.");
  stdin.readLineSync();
  print("\x1B[2J\x1B[0;0H"); 
}
