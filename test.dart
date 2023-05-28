import 'dart:convert';
import 'dart:io';

void main() {
   Map<String,dynamic> jsn =
  {
    "usuario":"david",
    "senha":"123",
    "permissoes":["adm", "comun"]
  };

  String caminhoArquivo = 'C:/Users/bruno/.vscode/bank/salvarJsonarquivo.json';
  var s = jsonEncode(jsn);
  try {
    File arquivo = File(caminhoArquivo);
    arquivo.writeAsString(s);
    var a = arquivo.open;
    
    print('Arquivo salvo com sucesso.');
  } catch (e) {
    print('Ocorreu um erro ao salvar o arquivo: $e');
  }
}