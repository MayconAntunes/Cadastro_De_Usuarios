import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        //Tamanho da Linha
        width: 100,
        child: Row(
          children: <Widget>[
            // Botão Editar
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.yellow[800],
                onPressed: () {}),
            // Botão Excluir
            IconButton(
                icon: Icon(Icons.delete), color: Colors.red, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
