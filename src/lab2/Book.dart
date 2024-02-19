class Book {
  String title;
  String author;
  int year;
  int pageCount;


  Book(this.title, this.author, this.year, this.pageCount);

  void displayInfo() {
    print("Title: $title");
    print("Author: $author");
    print("Year: $year");
    print("Page Count: $pageCount");
    print("----------------------");
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
    print("${book.title} has been added to the library.");
  }

  void removeBook(String title) {
    var removedBook = books.firstWhere((book) => book.title == title);
    if (removedBook != null) {
      books.remove(removedBook);
      print("$title has been removed from the library.");
    } else {
      print("$title is not found in the library.");
    }
  }

  // Method to display information about all books in the library
  void displayBooks() {
    if (books.isEmpty) {
      print("The library is empty.");
    } else {
      print("Books in the library:");
      books.forEach((book) => book.displayInfo());
    }
  }
}

void main() {
  var book1 = Book("Book1", "Author1", 2000, 300);
  var book2 = Book("Book2", "Author2", 2010, 250);
  var book3 = Book("Book3", "Author3", 2020, 400);

  var library = Library();

  library.addBook(book1);
  library.addBook(book2);
  library.displayBooks();


  library.removeBook("Book1");
  library.displayBooks();

  library.addBook(book3);
  library.displayBooks();
}
