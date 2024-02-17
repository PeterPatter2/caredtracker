class User {
  final String name;
  final String surname;
  final int age;
  final DateTime birthDate;

  User({required this.name, required this.surname, required this.age, required this.birthDate});

  String get fullName => '$name $surname';

}
