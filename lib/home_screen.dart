import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'cart_screen.dart';
import 'app_theme.dart';
import 'mock_data.dart'; // Import your data
import 'laptop.dart';    // Import your model

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Get the list directly from your MockData class
    final List<Laptop> laptops = MockData.laptops;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laptop Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: laptops.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.70, // Adjusted to fit image and text
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final laptop = laptops[index];

            return Card(
              color: AppTheme.midnightBlue,
              clipBehavior: Clip.antiAlias, // Makes sure image stays inside rounded corners
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 2. Display Image from URL
                  Expanded(
                    child: Image.network(
                      laptop.imageUrl,
                      fit: BoxFit.cover,
                      // Shows an icon if the internet image fails to load
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                            child: Icon(Icons.laptop, size: 50, color: AppTheme.neonCyan)
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          laptop.name, // Using 'name' from your MockData
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$${laptop.price.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.neonCyan,
                            foregroundColor: Colors.black,
                            minimumSize: const Size(double.infinity, 36),
                          ),
                          onPressed: () {
                            // 3. CORRECT WAY: Pass the specific 'laptop' object to addItem
                            Provider.of<CartProvider>(context, listen: false)
                                .addItem(laptop);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${laptop.name} added to cart!'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          child: const Text('Add to Cart'),
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
    );
  }
}