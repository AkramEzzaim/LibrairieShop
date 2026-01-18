import 'package:flutter/material.dart';
import '../model/book.dart';

class StoreController extends ChangeNotifier {
  // 1. The full master list of data (Expanded Library)
  final List<Book> _allBooks = [
    // --- TECH ---
    Book(
        id: '1',
        title: 'Crime and Punishment',
        author: 'Fyodor Dostoevsky',
        price: 120.0,
        genre: 'History',
        imageUrl: 'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1382846449i/7144.jpg'
    ),
    Book(
        id: '2',
        title: 'Clean Code',
        author: 'Robert C. Martin',
        price: 100.0,
        genre: 'Tech',
        imageUrl: 'https://m.media-amazon.com/images/I/41xShlnTZTL._SX218_BO1,204,203,200_QL40_FMwebp_.jpg'
    ),
    Book(
        id: '3',
        title: 'The Pragmatic Programmer',
        author: 'Andy Hunt',
        price: 140.0,
        genre: 'Tech',
        imageUrl: 'https://m.media-amazon.com/images/I/51W1sBPO7tL._SX380_BO1,204,203,200_.jpg'
    ),
    Book(
        id: '4',
        title: 'Refactoring',
        author: 'Martin Fowler',
        price: 75.90,
        genre: 'Tech',
        imageUrl: 'https://m.media-amazon.com/images/S/compressed.photo.goodreads.com/books/1386925632i/44936.jpg'
    ),

    // --- FICTION ---
    Book(
        id: '5',
        title: 'The Alchemist',
        author: 'Paulo Coelho',
        price: 150.0,
        genre: 'Fiction',
        imageUrl: 'https://m.media-amazon.com/images/I/51Z0nLAfLmL.jpg'
    ),
    Book(
        id: '6',
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        price: 159.0,
        genre: 'Fiction',
        imageUrl: 'https://m.media-amazon.com/images/I/71FTb9X6wsL.jpg'
    ),
    Book(
        id: '7',
        title: 'To Kill a Mockingbird',
        author: 'Harper Lee',
        price: 140.50,
        genre: 'Fiction',
        imageUrl: 'https://m.media-amazon.com/images/I/81gepf1eMqL.jpg'
    ),
    Book(
        id: '8',
        title: '1984',
        author: 'George Orwell',
        price: 110.0,
        genre: 'Fiction',
        imageUrl: 'https://m.media-amazon.com/images/I/71kxa1-0mfL._AC_UF1000,1000_QL80_.jpg'
    ),

    // --- HISTORY ---
    Book(
        id: '9',
        title: 'Sapiens',
        author: 'Yuval Noah Harari',
        price: 220.0,
        genre: 'History',
        imageUrl: 'https://m.media-amazon.com/images/I/713jIoMO3UL.jpg'
    ),

    // --- SCIENCE / SELF-HELP ---
    Book(
        id: '10',
        title: 'Atomic Habits',
        author: 'James Clear',
        price: 180.0,
        genre: 'Science',
        imageUrl: 'https://m.media-amazon.com/images/I/91bYsX41DVL.jpg'
    ),
    Book(
        id: '11',
        title: 'Thinking, Fast and Slow',
        author: 'Daniel Kahneman',
        price: 180.0,
        genre: 'Science',
        imageUrl: 'https://m.media-amazon.com/images/I/61fdrEuPJwL.jpg'
    ),
  ];

  // 2. State for the currently selected category
  String _selectedGenre = "All";
  String get selectedGenre => _selectedGenre;

  // 3. Getter that returns ONLY the books matching the selected genre
  List<Book> get books {
    if (_selectedGenre == "All") {
      return _allBooks;
    }
    return _allBooks.where((book) => book.genre == _selectedGenre).toList();
  }

  // 4. Getter for the category list
  List<String> get genres {
    return ["All", "Tech", "Fiction", "History", "Science"];
  }

  // 5. Function to change genre
  void changeGenre(String newGenre) {
    _selectedGenre = newGenre;
    notifyListeners();
  }
}