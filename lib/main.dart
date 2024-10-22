// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> _atividades = [];

  //MÉTODO PARA EDITAR ATIVIDADE
  void _editarAtividade(
      int index, String nome, String descricao, String data, String imagem) {
    setState(() {
      _atividades[index] = {
        'nome': nome,
        'descricao': descricao,
        'data': data,
        'imagem': imagem
      };
    });
  }

  //MÉTODO ADICIONAR ATIVIDADE
  void _adicionarAtividade(
      String nome, String descricao, String data, String imagem) {
    setState(() {
      _atividades.add({
        'nome': nome,
        'descricao': descricao,
        'data': data,
        'imagem': imagem
      });
    });
  }

  //MÉTODO PARA CADASTRAR ATIVIDADE
  void modalCadastrar(BuildContext context) {
    //VARIAVEIS PARA FORMULARIO
    final TextEditingController nomeAtividade = TextEditingController();
    final TextEditingController descricaoAtividade = TextEditingController();
    final TextEditingController dataAtividade = TextEditingController();
    final TextEditingController urlAtividade = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cadastrar Atividade',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //ELEMENTO DO FORMULÁRIO
                  //LABEL E INPUT
                  TextField(
                    controller: nomeAtividade,
                    decoration: InputDecoration(labelText: 'Nome da Atividade'),
                  ),
                  TextField(
                    controller: descricaoAtividade,
                    decoration:
                        InputDecoration(labelText: 'Descricão da Atividade'),
                  ),
                  TextField(
                    controller: dataAtividade,
                    decoration: InputDecoration(labelText: 'Data da Atividade'),
                  ),
                  TextField(
                    controller: urlAtividade,
                    decoration: InputDecoration(labelText: 'Url da Atividade'),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        _adicionarAtividade(
                            nomeAtividade.text,
                            descricaoAtividade.text,
                            dataAtividade.text,
                            urlAtividade.text);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Cadastrar"))
                ],
              ),
            ),
          );
        });
  }

  //MODAL EDITAR ATIVIDADE
  //MÉTODO PARA CADASTRAR ATIVIDADE
  void modalEditar(BuildContext context, int index) {
    //VARIAVEIS PARA FORMULARIO
    final TextEditingController nomeAtividade =
        TextEditingController(text: _atividades[index]['nome']);
    final TextEditingController descricaoAtividade =
        TextEditingController(text: _atividades[index]['descricao']);
    final TextEditingController dataAtividade =
        TextEditingController(text: _atividades[index]['data']);
    final TextEditingController urlAtividade =
        TextEditingController(text: _atividades[index]['imagem']);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Editar Atividade',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //ELEMENTO DO FORMULÁRIO
                  //LABEL E INPUT
                  TextField(
                    controller: nomeAtividade,
                    decoration: InputDecoration(labelText: 'Nome da Atividade'),
                  ),
                  TextField(
                    controller: descricaoAtividade,
                    decoration:
                        InputDecoration(labelText: 'Descricão da Atividade'),
                  ),
                  TextField(
                    controller: dataAtividade,
                    decoration: InputDecoration(labelText: 'Data da Atividade'),
                  ),
                  TextField(
                    controller: urlAtividade,
                    decoration: InputDecoration(labelText: 'Url da Atividade'),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        _editarAtividade(
                            index,
                            nomeAtividade.text,
                            descricaoAtividade.text,
                            dataAtividade.text,
                            urlAtividade.text);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.save),
                      label: const Text("Salvar Alteração"))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Agenda DS 2024',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 214, 130, 61),
      ),
      body: ListView.builder(
          itemCount: _atividades.length,
          itemBuilder: (context, index) {
            return Atividades(
              _atividades[index]['nome']!,
              _atividades[index]['imagem']!,
              () => modalEditar(context, index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalCadastrar(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Atividades extends StatelessWidget {
  //variavel para o nome da atividade
  final String nome;
  final String imagem;
  final VoidCallback onEdit;

  const Atividades(this.nome, this.imagem, this.onEdit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: Color.fromARGB(221, 42, 138, 4),
        child: Stack(
          children: [
            Container(
              color: Color.fromARGB(255, 179, 11, 25),
              height: 140,
            ),
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Color.fromARGB(255, 241, 226, 6),
                    width: 72,
                    height: 100,
                    child: Image.network(
                      imagem,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      nome,
                      style: TextStyle(
                          fontSize: 16, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onEdit,
                    child: Icon(Icons.edit),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
