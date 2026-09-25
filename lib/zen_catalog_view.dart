import 'package:flutter/material.dart';

class MeditationCatalogScreen extends StatelessWidget {
  const MeditationCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Meditate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black, size: 26),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildChip('All', isSelected: true),
                    _buildChip('Bible In a Year'),
                    _buildChip('Dailies'),
                    _buildChip('Minutes'),
                    _buildChip('November'),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // 1. СВЕРХУ: Солнце и месяц (A Song of Moon)
              _buildBigCard(
                imagePath: 'assets/images/img3.png',
                title: 'A Song of Moon',
                subtitle: 'Start with the basics',
                meta: '9 Sessions',
              ),
              const SizedBox(height: 16),

              // 2. СРЕДНИЙ РЯД: 
              // Слева: оранжевый фон (The Sleep Hour)
              // Справа: месяц в облаке (Easy on the Mission)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSmallCard(
                      imagePath: 'assets/images/img1.png',
                      title: 'The Sleep Hour',
                      subtitle: 'Ashna Mukherjee',
                      meta: '3 Sessions',
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildSmallCard(
                      imagePath: 'assets/images/img2.png',
                      title: 'Easy on the Mission',
                      subtitle: 'Peter Mach',
                      meta: '5 minutes',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 3. НИЖНИЙ РЯД:
              // Слева: синее небо с планетой (Relax with Me)
              // Справа: бирюзовый пейзаж (Sun and Energy)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSmallCard(
                      imagePath: 'assets/images/img4.png',
                      title: 'Relax with Me',
                      subtitle: 'Amanda James',
                      meta: '3 Sessions',
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildSmallCard(
                      imagePath: 'assets/images/img5.png',
                      title: 'Sun and Energy',
                      subtitle: 'Micheal Hiu',
                      meta: '5 minutes',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF039EA1) : const Color(0xFFE5F7F7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF039EA1),
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildBigCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required String meta,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: AspectRatio(
            aspectRatio: 1.9,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_border, size: 14, color: Colors.grey.shade500),
                const SizedBox(width: 4),
                Text(meta, style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
              ],
            ),
            const Text(
              'Start >',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required String meta,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 1.6,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_border, size: 12, color: Colors.grey.shade500),
                const SizedBox(width: 4),
                Text(meta, style: TextStyle(color: Colors.grey.shade500, fontSize: 10)),
              ],
            ),
            const Text(
              'Start >',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}