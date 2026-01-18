import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myHome.dart';
import 'controller/store_controller.dart';
import 'controller/cart_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // IMPORTANT: Wrap everything in MultiProvider so controllers are available
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StoreController()),
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const myHome(), // Calls your myHome.dart
      ),
    );
  }
}