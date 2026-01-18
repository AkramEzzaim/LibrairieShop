import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/store_controller.dart';
import '../controller/cart_controller.dart';
import 'cart_screen.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreController>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50], // Light background for contrast
      // Custom minimal AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Librairie Shop" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
        actions: [
          Consumer<CartController>(
            builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: Badge(
                    label: Text(cart.cartItems.length.toString()),
                    backgroundColor: Colors.deepOrange,
                    child: const Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 28),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Premium Header Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              "Découvrez les livres",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),

          // 2. Categories (Genre) Selector
          SizedBox(
            height: 50,

            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: store.genres.length,
              itemBuilder: (context, index) {
                final genre = store.genres[index];
                final isSelected = genre == store.selectedGenre;

                return GestureDetector(
                  onTap: () => store.changeGenre(genre),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.deepOrange : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: isSelected
                          ? [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5))]
                          : [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5, offset: const Offset(0, 2))],
                      border: isSelected ? null : Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(
                      child: Text(
                        genre,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // 3. Filtered Grid of Books
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: store.books.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65, // Taller cards
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final book = store.books[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Book Cover Image
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(book.imageUrl, fit: BoxFit.cover),
                              // Floating Add Button
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    Provider.of<CartController>(context, listen: false).addToCart(book);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("${book.title} ajouté!"), duration: const Duration(milliseconds: 800),)
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add, size: 20, color: Colors.deepOrange),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Book Details
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              book.author,
                              style: TextStyle(color: Colors.grey[500], fontSize: 12),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${book.price} MAD",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.deepOrange
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}