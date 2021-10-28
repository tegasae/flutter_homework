import 'dart:core';

class User {
  final String _email;

  User(this._email);
  String get email => this._email;
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
  List<T> users=[];
  List<String> emails=[];
  void addUser(T user) {
    users.add(user);
  }
  List <String> getEmails() {
    this.emails=[];
    for (final u in users) {
      this.emails.add(u.email);
    }
    return this.emails;
  }
}