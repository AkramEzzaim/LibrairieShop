import 'package:flutter/material.dart';
import '../model/book.dart';

class CartController extends ChangeNotifier {
  final List<Book> _cartItems = [];

  List<Book> get cartItems => _cartItems;

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }

  void addToCart(Book book) {
    _cartItems.add(book);
    notifyListeners();
  }

  void removeFromCart(Book book) {
    _cartItems.remove(book);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}