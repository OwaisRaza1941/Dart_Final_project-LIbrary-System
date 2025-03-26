import 'dart:io';
import 'library_class.dart';
import 'user_class.dart';

class Menu {
  Library library = Library();

  UserManager userManager = UserManager();

  void showMenu() {
    print("\n👤 Welcome! Please Login or Signup to access the Library System.");
    bool isAuthenticated = false;

    while (!isAuthenticated) {
      print("1. Signup");
      print("2. Login");
      stdout.write("Choose an option: ");
      String? choice = stdin.readLineSync();

      if (choice == '1') {
        userManager.signup();
      } else if (choice == '2') {
        isAuthenticated = userManager.login();
      } else {
        print(" Invalid option! Try again.");
      }
    }

    print("\n📚 Library Management System");
    print("1. Add Book");
    print("2. List All Books");
    print("3. Delete Book");
    print("4. Update Book");
    print("5. Assign Book");
    print("6. Exit");
    stdout.write('Choose an your option:');

    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      library.addBook();
    } else if (choice == '2') {
      library.listBooks();
    } else if (choice == '3') {
      library.deleteBook();
    } else if (choice == '4') {
      library.updateBook();
    } else if (choice == '5') {
      library.assignBook();
    } else if (choice == '6') {
      library.exit();
    } else {
      print(" Invalid Option! Try again.");
    }
  }
}
