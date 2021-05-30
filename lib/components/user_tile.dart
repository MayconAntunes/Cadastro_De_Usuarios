import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    //-----------------------------

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        //Tamanho da Linha
        width: 100,
        child: Row(
          children: <Widget>[
            //-----------------------
            // Botão Editar
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            //-----------------------
            // Botão Excluir
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                //Confirmar exclusão do Itém
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Usuário'),
                    content: Text('Confirme exclusão do usuário?'),
                    //Ação a ser tomada
                    actions: <Widget>[
                      //Primeira Ação
                      TextButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      //Segunda Ação
                      TextButton(
                        child: Text('SIm'),
                        onPressed: () {
                          Provider.of<Users>(context, listen: false)
                              .remove(user);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
