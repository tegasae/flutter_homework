class User {
  final int id;
  final String name;
  final String telegramId;
  final int role;

  User(this.id, this.name, this.telegramId, this.role);
}

abstract class Users {
  late List<User> users=[];

  Users();

  void fetchUsers();

  List<User> getUser() {
    return users;
  }

  List<User> getUserByName() {
    List<User> sortUser=List<User>.from(users)
        ..sort((a, b) => a.name.compareTo(b.name));
    return sortUser;
  }

}


class PredefinedUsers extends Users{
  PredefinedUsers() {
    fetchUsers();
  }
  @override
  void fetchUsers() {
    users=[User(1, 'Имя 1', '1', 0),
           User(2, 'Ааааа', '1', 0),
           User(3, 'Иииии', '1', 0),
           User(4, 'БББББ', '1', 0),
           User(5, 'кцаукаук', '1', 0),
           User(6, 'Имя 1', '1', 0),
           User(7, 'Имя 1', '1', 0),
           User(8, 'КПепепкеп', '1', 0),
           User(9, 'ЦКакак', '1', 0),
           User(10, 'Каукаука4ка', '1', 0)
    ];
  }


}