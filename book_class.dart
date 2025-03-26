class Book {
  String title;
  String author;
  String genre;
  bool isAvalaible;

  Book(this.title, this.author, this.genre, {this.isAvalaible = true});

  void displayBook() {
    print('Title: $title');
    print('Author: $author');
    print('Genre: $genre');
    print('Is avalaible: $isAvalaible');
  }
}
