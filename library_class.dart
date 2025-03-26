import 'dart:io';
import 'book_class.dart';

class Library {
  List<Book> books = [];

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

    bool isDeleted = false;

    for (int i = 0; i < books.length; i++) {
      if (books[i].title == bookTitle) {
        books.removeAt(i);
        isDeleted = true;
        break;
      }
    }

    if (isDeleted) {
      print("Book '$bookTitle' has been deleted.");
    } else {
      print("Book '$bookTitle' not found!");
    }
  }

  void assignBook() {
    stdout.write("Enter Book Title to Assign: ");
    String? bookTitle = stdin.readLineSync();

    bool found = false;

    for (var book in books) {
      if (book.title == bookTitle) {
        found = true;
        if (book.isAvalaible) {
          book.isAvalaible = false;
          print("Book '$bookTitle' assigned successfully!");
        } else {
          print("Book '$bookTitle' is already assigned!");
        }
        break;
      }
    }

    if (!found) {
      print("Book '$bookTitle' not found!");
    }
  }

  void updateBook() {
    stdout.write("Enter the title of the book to update: ");
    String? bookTitle = stdin.readLineSync();

    bool isUpdated = false;

    for (var book in books) {
      if (book.title == bookTitle) {
        isUpdated = true;

        print("Book Found! Enter new details:");
        stdout.write("Enter New Author: ");
        String? newAuthor = stdin.readLineSync();

        stdout.write("Enter New Genre: ");
        String? newGenre = stdin.readLineSync();

        book.author = newAuthor!;
        book.genre = newGenre!;

        print("Book details updated successfully!");
        break;
      }
    }

    if (!isUpdated) {
      print("Book '$bookTitle' not found!");
    }
  }

  void exit() {
    print("Exiting the Library System... Bye! ");
    exitCode = 0;
  }
}
