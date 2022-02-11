import 'package:flutter/material.dart';
import 'package:test_leitor/components/button.dart';
import 'package:test_leitor/components/text_field_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Teste Leitor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();
  String _value = '';

  void _limpaField() async {
    setState(() {
      textEditingController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldForm(
                  valueStart: _value,
                  enabled: true,
                  maxLength: 50,
                  label: 'Leitura',
                  counterLabel: '',
                  isObscure: false,
                  textAction: TextInputAction.next,
                  returnSave: (value) {
                    debugPrint('Save');
                    _value = value ?? '';
                  },
                  textInputType: TextInputType.text,
                  validField: (value) {
                    return null;
                  },
                  currentFocus: null,
                  nextFocus: null,
                  onChange: (value) {
                    _value = value;
                  },
                  controllerText: textEditingController,
                ),
                const SizedBox(
                  height: 10,
                ),
                button(
                  context: context,
                  value: const Text(
                    'Limpar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  doButton: _limpaField,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
