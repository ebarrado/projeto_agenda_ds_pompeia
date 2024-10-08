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
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Agenda DS 2024',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 214, 130, 61),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Atividades('Atividade 1 - Criando Aplicação no Flutter'),
              Atividades('Atividade 2'),
              Atividades('Atividade 3'),
              Atividades('Atividade 4'),
              Atividades('Atividade 5'),
              Atividades('Atividade 6'),
              Atividades('Atividade 7')
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
        ));
  }
}

class Atividades extends StatefulWidget {
  //variavel para o nome da atividade
  final String nome;
  const Atividades(this.nome, {Key? key}) : super(key: key);

  @override
  State<Atividades> createState() => _AtividadesState();
}

class _AtividadesState extends State<Atividades> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        color: Colors.black87,
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
                    color: Colors.black26,
                    width: 72,
                    height: 100,
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      widget.nome,
                      style: TextStyle(
                          fontSize: 16, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
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


