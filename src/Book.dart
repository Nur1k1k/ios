class Book {
  String title;
  String author;
  int year;
  int pageCount;

  // Constructor
  Book(this.title, this.author, this.year, this.pageCount);

  // Method to display information about the book
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

  // Method to add a book to the library
  void addBook(Book book) {
    books.add(book);
    print("${book.title} has been added to the library.");
  }

  // Method to remove a book from the library
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
  // Creating instances of books
  var book1 = Book("Book1", "Author1", 2000, 300);
  var book2 = Book("Book2", "Author2", 2010, 250);
  var book3 = Book("Book3", "Author3", 2020, 400);

  // Creating an instance of the library
  var library = Library();

  // Adding books to the library
  library.addBook(book1);
  library.addBook(book2);

  // Displaying library information
  library.displayBooks();

  // Removing a book from the library
  library.removeBook("Book1");

  // Displaying updated library information
  library.displayBooks();

  // Adding another book to the library
  library.addBook(book3);
  library.displayBooks();
}
