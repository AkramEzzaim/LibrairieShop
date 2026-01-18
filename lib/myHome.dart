import 'package:flutter/material.dart';
import 'view/store_screen.dart'; // Imports the view from your folder

// You named it 'myHome' (lowercase m) in your previous snippet
class myHome extends StatelessWidget {
  const myHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Simply returns the StoreScreen we created above
    return const StoreScreen();
  }
}