import 'gym.dart';

class User {
  String? identification;
  String? name;
  String? surname;
  String? email;
  String? userName;
  String? password;
  Gym? gym;

  User({
    this.identification,
    this.name,
    this.surname,
    this.email,
    this.userName,
    this.password,
    this.gym
  });
}
