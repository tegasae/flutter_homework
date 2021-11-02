//Упражнение 8
//Создайте класс User, у которого есть поле email. Реализуйте два наследника
//данного класса AdminUser и GeneralUser. Реализуйте mixin над классом User,
//у которого будет метод getMailSystem, который возвращает значение из email,
//которое находится после @. Например, если email пользователя user@mail.ru,
//то данный метод вернёт mail.ru. Используйте данный миксин на AdminUser.
//Далее реализуйте класс UserManager<T extends User>, у которого будет
//храниться список пользователей и будут методы добавления или удаления их.
//Также в UserManager реализуйте метод, который выведет почту всех
//пользователей, однако если пользователь admin, будет выведено
//значение после @. Проверьте реализованные методы на практике.

class User {
  final String _email;

  User(this._email);
  String get email => this._email;

  @override
  String toString() {
    return email;
  }
}

mixin UserGetMail on User {
  String getMainSystem() {
    return _email.split('@')[1];
  }
}

class AdminUser extends User with UserGetMail {
  AdminUser(String email) : super(email);
  String get email=>this.getMainSystem();
}

class GeneralUser extends User {
  GeneralUser(String email):super(email);
}

class  UserManager<T extends User> {
  Map<int,T> _users={};
  List<String> _emails=[];

  void addUser(T user) {
    _users[user.hashCode]=user;
  }

  void delUser(T user) {
    _users.remove(user.hashCode);
  }

  @override
  String toString() {
    return _users.toString();
  }
  List <String> getEmails() {
    this._emails=[];
    for (final u in _users.keys) {
      this._emails.add(_users[u].toString());
    }
    return this._emails;
  }
}
