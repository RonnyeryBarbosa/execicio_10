import 'package:flutter/material.dart';
import 'package:internal_storege/form_controller.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final controller = ControllerForm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  constraints: BoxConstraints(
                      maxHeight: 300,
                      maxWidth: 500,
                      minWidth: 250,
                      minHeight: 300),
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Flexible(
                        child: Text(
                          "Validar Usuário",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(hintText: "nome"),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Nome é obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: sobrenomeController,
                          decoration: InputDecoration(hintText: "Sobrenome"),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Sobrenome é obrigatorio';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FutureBuilder<String>(
                          future: controller.fullname,
                          builder: (context, snapshot) {
                            return Text(snapshot.data ?? '');
                          }),
                      SizedBox(
                        height: 24,
                      ),
                      Flexible(
                          child: ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState?.validate();
                          if (isValid ?? false) {
                            controller.updateName(nameController.text);
                            controller.updateSurname(sobrenomeController.text);
                            controller.saveUser();

                            return;

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                        '${nameController.text} ${sobrenomeController.text}'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Ok'))
                                    ],
                                  );
                                });
                          }
                          print(isValid);
                        },
                        child: Text('Validar'),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
