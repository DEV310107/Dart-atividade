import 'dart:io'; //importar biblioteca para entrada e saida de dados 

class Produto { //classe poduto para representar um item no estoque
  String nome;
  int quantidade;
  double preco;

  Produto(this.nome, this.quantidade, this.preco);//construtor de classe de produtos
}

class Estoque { //classe de estoque para gerenciar produtos
  List<Produto> produtos = []; //cria uma lista para os produtos cadastrado 

  void cadastrarProduto() { 
    stdout.write("Nome do produto: ");//input do produto
    String nome = stdin.readLineSync()!; //le os dados 
    print("\x1B[2J\x1B[0;0H");
    stdout.write("quantidade inicial: ");
    int quantidade = int.parse(stdin.readLineSync()!);
    print("\x1B[2J\x1B[0;0H");
    stdout.write("preço: ");
    double preco = double.parse(stdin.readLineSync()!);
    print("\x1B[2J\x1B[0;0H");
    produtos.add(Produto(nome, quantidade, preco));
    print("produto cadastrado com sucesso");
    stdin.readLineSync();
    print("\x1B[2J\x1B[0;0H");
  }

  void listarProdutos() {
    if (produtos.isEmpty) {
      print("nenhum produto cadastrado.");
      return;
    }
    print("lista de produtos cadastrados");
    for (var produto in produtos) {
      print("Nome: ${produto.nome} | Preço: R\$${produto.preco.toStringAsFixed(2)}");
    }
    print("");
  }

  void excluirProduto() {
    stdout.write("nome do produto para excluir: ");
    String nome = stdin.readLineSync()!;
    produtos.removeWhere((produto) => produto.nome == nome);
    print("produto removido com sucesso");
    stdin.readLineSync();
    print("\x1B[2J\x1B[0;0H");
  }

  void alterarQuantidade() {
    stdout.write("nome do produto: ");
    String nome = stdin.readLineSync()!;
    Produto? produto = produtos.firstWhere(
      (p) => p.nome == nome,
      orElse: () => Produto("", 0,0.0),
    );

  if (produto.nome.isEmpty) { // Verifica se o produto foi encontrado
      print("Produto não encontrado!\n"); // Exibe mensagem de erro
      stdin.readLineSync();
      print("\x1B[2J\x1B[0;0H");
      return;  
  }

  stdout.write("Quantidade a adicionar (+) ou remover (-): "); // Solicita a quantidade
    int quantidade = int.parse(stdin.readLineSync()!); // Lê e converte para inteiro
    produto.quantidade += quantidade; // Atualiza a quantidade do produto

    if (produto.quantidade < 0) { // Evita quantidade negativa
      produto.quantidade = 0;
    }

    print("Quantidade atualizada: ${produto.quantidade}\n"); // Exibe a nova quantidade
  }
}

void main() {
  Estoque estoque = Estoque();

  while (true) {
    print("1 - cadastrar produto");
    print("2 - Listar Produtos Cadastrados"); // Opção 2
    print("3 - Excluir Produto"); // Opção 3
    print("4 - Adicionar/Remover Quantidade"); // Opção 4
    print("5 - Sair"); // Opção 5
    stdout.write("Escolha uma opção: "); // Solicita a escolha do usuário
    String escolha = stdin.readLineSync()!; // Lê a opção escolhida
    print("\x1B[2J\x1B[0;0H");

    switch (escolha) {
      case '1':
        estoque.cadastrarProduto(); // Chama o método para cadastrar um produto
        break;
      case '2':
        estoque.listarProdutos(); // Chama o método para listar produtos
        break;
      case '3':
        estoque.excluirProduto(); // Chama o método para excluir um produto
        break;
      case '4':
        estoque.alterarQuantidade(); // Chama o método para alterar a quantidade
        break;
      case '5':
        print("Saindo..."); // Mensagem de saída
        return; // Encerra o programa
      default:
        print("Opção inválida!\n"); // Mensagem de erro para opção inválida
    }
  }
}