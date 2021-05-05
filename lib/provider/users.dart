import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  //Metodo put inclui e altera um usuario dentro do metodo
  void put(User user) {
    if (user == null) {
      return;
    }

    //Alterar
    if (user.id != null &&
        user.id.trim().isEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: '1000',
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }
    notifyListeners();
  }

  //Excluir
  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
