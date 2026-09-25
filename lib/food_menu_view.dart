import 'package:flutter/material.dart';

class PopularMenuScreen extends StatelessWidget {
  const PopularMenuScreen({super.key});

  static const Color pink = Color(0xFFFFE3E6);
  static const Color coral = Color(0xFFE8536B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: Row(
                children: [
                  _CircleIconButton(icon: Icons.chevron_left, onTap: () {}),
                  const SizedBox(width: 14),
                  const Text(
                    'Popular Menu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F5),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Search',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                          Icon(Icons.search, color: Colors.grey, size: 20),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _CircleIconButton(icon: Icons.filter_list, onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                children: const [
                  _FoodTile(
                    image: 'assets/images/original_salad.jpg',
                    title: 'Original Salad',
                    subtitle: 'Lovy Food',
                    price: '\$8',
                  ),
                  _FoodTile(
                    image: 'assets/images/fresh_salad.jpg',
                    title: 'Fresh Salad',
                    subtitle: 'Cloudy Resto',
                    price: '\$10',
                  ),
                  _FoodTile(
                    image: 'assets/images/yummie_ice_cream.jpg',
                    title: 'Yummie Ice Cream',
                    subtitle: 'Circlo Resto',
                    price: '\$6',
                  ),
                  _FoodTile(
                    image: 'assets/images/vegan_special.jpg',
                    title: 'Vegan Special',
                    subtitle: 'Haty Food',
                    price: '\$11',
                  ),
                  _FoodTile(
                    image: 'assets/images/mixed_pasta.jpg',
                    title: 'Mixed Pasta',
                    subtitle: 'Recto Food',
                    price: '\$13',
                  ),
                ],
              ),
            ),
            _BottomNav(),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: PopularMenuScreen.pink,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: PopularMenuScreen.coral),
      ),
    );
  }
}

class _FoodTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  const _FoodTile({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 60,
                height: 60,
                color: Colors.grey.shade200,
                child: const Icon(Icons.restaurant, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              color: PopularMenuScreen.coral,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: PopularMenuScreen.pink,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(Icons.home, color: PopularMenuScreen.coral, size: 20),
                SizedBox(width: 6),
                Text(
                  'Home',
                  style: TextStyle(
                    color: PopularMenuScreen.coral,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.shopping_basket, color: PopularMenuScreen.coral),
          const Icon(Icons.message, color: PopularMenuScreen.coral),
          const Icon(Icons.person, color: PopularMenuScreen.coral),
        ],
      ),
    );
  }
}