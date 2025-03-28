class Book {
  String title;
  String author;
  String genre;
  bool isAvalaible;

  Book(this.title, this.author, this.genre, {this.isAvalaible = true});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      json['title'],
      json['author'],
      json['genre'],
      isAvalaible: json['isAvalaible'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'genre': genre,
      'isAvalaible': isAvalaible,
    };
  }

  void displayBook() {
    print("Title: $title");
    print("Author: $author");
    print("Genre: $genre");
    print("Available: ${isAvalaible ? 'Yes' : 'No'}");
  }
}
