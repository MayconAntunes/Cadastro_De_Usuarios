import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  //Metodo para carregar usuarios na tela na hora da aletação dos mesmos
  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Alteração de Usuário
    final User user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        //ações
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );
                //Verifica se as informações dos formularios são validas
                Navigator.of(context).pop();
              }
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
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                //validação do nome
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Favor informar um Nome';
                  }
                  //Quantidade Mina de caracters
                  if (value.trim().length < 3) {
                    return 'O nome deve possuir no minimo 3 letras.';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              //---------------
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Favor informar um E-mail';
                  }
                  //Quantidade Mina de caracters
                  if (value.trim().length < 9) {
                    return 'E-mail invalido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              //---------------
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Favor informar a Url do Avatar';
                  }
                  return null;
                },
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
              //---------------
            ],
          ),
        ),
      ),
    );
  }
}
