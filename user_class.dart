import 'dart:io';

class User {
  String username;
  String password;

  User(this.username, this.password);
}

class UserManager {
  List<User> users = [];

  void signup() {
    stdout.write("Enter a new username: ");
    String? username = stdin.readLineSync();

    stdout.write("Enter a new password: ");
    String? password = stdin.readLineSync();

    if (username!.isEmpty || password!.isEmpty) {
      print(" Username and password cannot be empty.");
      return;
    }

    users.add(User(username, password));
    print(" Signup successful! You can now login.");
  }

  bool login() {
    stdout.write("Enter your username: ");
    String? username = stdin.readLineSync();

    stdout.write("Enter your password: ");
    String? password = stdin.readLineSync();

    for (var user in users) {
      if (user.username == username && user.password == password) {
        print(" Login successful! Welcome, $username!");
        return true;
      }
    }

    print(" Invalid credentials. Try again.");
    return false;
  }
}
