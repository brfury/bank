abstract class Account {
  final int numeroAgencia;
  final int numeroConta;
  final String numeroTitular;

  Account({required this.numeroAgencia, required this.numeroConta, required this.numeroTitular});

  void abrirConta();
  void fecharConta();
  void set deposito(num n);
  void set saque(num n);
  void pagamento();
  void transferencia();
  num get consultarSaldo;
  String extrato();

}