import 'dart:io';
import 'dart:convert';
import 'book_class.dart';

class Library {
  List<Book> books = [];
  final String dataFilePath = 'books.json';

  Library() {
    loadBooks();
  }

  void loadBooks() {
    try {
      final file = File(dataFilePath);
      if (file.existsSync()) {
        String content = file.readAsStringSync();
        List<dynamic> jsonData = jsonDecode(content);
        books = jsonData.map((item) => Book.fromJson(item)).toList();
        print("Books loaded successfully from JSON!");
      }
    } catch (e) {
      print("Error loading books: $e");
    }
  }

  void saveBooks() {
    try {
      final file = File(dataFilePath);
      List<dynamic> jsonData = books.map((book) => book.toJson()).toList();
      file.writeAsStringSync(jsonEncode(jsonData));
      print("Books saved successfully to JSON!");
    } catch (e) {
      print("Error saving books: $e");
    }
  }

  void addBook() {
    stdout.write("Enter Book Title: ");
    String? title = stdin.readLineSync();
    stdout.write("Enter Author: ");
    String? author = stdin.readLineSync();
    stdout.write("Enter Genre: ");
    String? genre = stdin.readLineSync();

    if (title!.isEmpty || author!.isEmpty || genre!.isEmpty) {
      print("All fields are required! Try again.");
      return;
    }

    books.add(Book(title, author, genre));
    saveBooks();
    print("Book added successfully!");
  }

  void listBooks() {
    if (books.isEmpty) {
      print('No books available.');
    } else {
      for (var book in books) {
        book.displayBook();
        print("------------");
      }
    }
  }

  void deleteBook() {
    stdout.write("Enter the title of the book to delete: ");
    String? bookTitle = stdin.readLineSync();

    books.removeWhere((book) => book.title == bookTitle);
    saveBooks();
    print("Book '$bookTitle' deleted successfully!");
  }

  void updateBook() {
    stdout.write("Enter the title of the book to update: ");
    String? bookTitle = stdin.readLineSync();

    bool found = false;
    for (var book in books) {
      if (book.title == bookTitle) {
        found = true;
        stdout.write("Enter New Author: ");
        book.author = stdin.readLineSync()!;
        stdout.write("Enter New Genre: ");
        book.genre = stdin.readLineSync()!;
        saveBooks();
        print("Book details updated successfully!");
        break;
      }
    }

    if (!found) print("Book '$bookTitle' not found!");
  }

  void assignBook() {
    stdout.write("Enter Book Title to Assign: ");
    String? bookTitle = stdin.readLineSync();

    for (var book in books) {
      if (book.title == bookTitle) {
        if (book.isAvalaible) {
          book.isAvalaible = false;
          saveBooks();
          print("Book '$bookTitle' assigned successfully!");
          return;
        } else {
          print("Book '$bookTitle' is already assigned!");
          return;
        }
      }
    }

    print("Book '$bookTitle' not found!");
  }

  void exit() {
    print("Exiting the Library System... Bye!");
    exitCode = 0;
  }
}
