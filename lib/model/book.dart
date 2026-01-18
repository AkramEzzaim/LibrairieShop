import 'dart:ui';

class Book {
  final String id;
  final String title;
  final String author;
  final double price;
  final String imageUrl;
  final Color? color;
  final String genre;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.imageUrl,
    this.color,
    required this.genre,
  });
}