import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 40,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildCategoryHeader(),
              const SizedBox(height: 20),
              _buildCategoryIcons(),
              _buildBestSellingHeader(),
              _buildBestSellingGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'search',
              border: InputBorder.none,
              fillColor: Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        const Icon(Icons.menu),
      ],
    );
  }

  Widget _buildCategoryHeader() {
    return const Text(
      'categores',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _buildCategoryIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryItem(Icons.laptop,"laptop" ),
        _buildCategoryItem(Icons.phone_android_rounded, 'phone'),
        _buildCategoryItem(Icons.electric_bike, 'bike'),
        _buildCategoryItem(Icons.card_giftcard_outlined, 'gift'),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 40),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildBestSellingHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Text(
        'Best Selling',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget _buildBestSellingGrid() {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 230,
      ),
      children: [
        _buildProductCard('image/headphone.png', 'Headphone', 'description1', '1300'),
        _buildProductCard('image/lol.png', 'Boots', 'description2', '1500'),
        _buildProductCard('image/iphone.png', 'iPhone', 'description2', '1500'),
        _buildProductCard('image/plastation.png', 'playstation 5', 'description1', '1300'),
      ],
    );
  }

  Widget _buildProductCard(String imagePath, String title, String description, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetails(title: title, description: description, price: price),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              child: Image.asset(imagePath, fit: BoxFit.fill),
            ),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 2),
            Text(price, style: const TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const ItemDetails({super.key, required this.title, required this.description, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Container(
              height: 200,
              color: Colors.grey[200],
              child: const Center(child: Text('sales')),
            ),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text('200: $price', style: const TextStyle(fontSize: 20, color: Colors.orange)),
          ],
        ),
      ),
    );
  }
}
