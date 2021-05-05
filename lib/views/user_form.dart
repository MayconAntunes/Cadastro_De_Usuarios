import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        //ações
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              //Verifica se as informações dos formularios são validas

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'nome',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'URL do Avatar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
