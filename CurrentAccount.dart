import 'dart:io';
import 'account.dart';
import 'dart:convert';

class CurrentAccount implements Account {
  final int numeroAgencia;
  final int numeroConta;
  final String numeroTitular;
  num _saldo = 2323.56;

  
  CurrentAccount({required this.numeroAgencia, required this.numeroConta, required this.numeroTitular}){
    print("""numero da conta: $numeroConta,
     \n numero da agencia: $numeroAgencia \n,
     nome do titular: $numeroTitular """);
     
  }

  void abrirConta(){
    Map<String, Map<String,dynamic>> conta = {
      'ContaCorrent':{ 
      'numero agencia': numeroAgencia,
      'numero conta': numeroConta,
      'nome titular': numeroTitular,
      'saldo': consultarSaldo
      }
    };

    String caminhoJson = 'C:/Users/bruno/.vscode/bank/salvarJsonarquivo.json';
    var contaToJson = jsonEncode(conta);
    

    try {
    File arquivo = File(caminhoJson);
    arquivo.writeAsString(contaToJson);
    
    
    print('Arquivo salvo com sucesso.');
  } catch (e) {
    print('Ocorreu um erro ao salvar o arquivo: $e');
  }
  
  }

  void fecharConta(){
   
  String caminhoJson = 'C:/Users/bruno/.vscode/bank/salvarJsonarquivo.json';

  try {
    File arquivo = File(caminhoJson);
    var conteudoJson = arquivo.readAsStringSync();
    var mapaJson = jsonDecode(conteudoJson) as Map<String, dynamic>;
    mapaJson.remove("ContaCorrent");
    var mapaToJson = jsonEncode(mapaJson);
    arquivo.writeAsString(mapaToJson);

    

    print('Conta fechada com sucesso.');
  } catch (e) {
    print('Ocorreu um erro ao fechar a conta: $e');
  }
  
  
    
  }

  void set deposito(num n) => _saldo = _saldo + n;
  void set saque(num n) => _saldo = _saldo - n;

  void pagamento(){

  }
  void transferencia(){

  }
  
  num get consultarSaldo => _saldo;
  
  String extrato() {
    return """numero da conta: $numeroConta,
     numero da agencia: $numeroAgencia,
     nome do titular: $numeroTitular,
     saldo: $consultarSaldo """;
  }

}

void main() {
  CurrentAccount conta = CurrentAccount(
    numeroAgencia: 1234,
    numeroConta: 56789,
    numeroTitular: 'John Doe',
  );

  conta.abrirConta();
  print(conta.consultarSaldo);
  
}