import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'mind_welcome_view.dart';
import 'zen_catalog_view.dart';
import 'food_menu_view.dart';
import 'finance_card_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Mockups',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AdaptiveAppShell(),
    );
  }
}

class AdaptiveAppShell extends StatefulWidget {
  const AdaptiveAppShell({super.key});

  @override
  State<AdaptiveAppShell> createState() => _AdaptiveAppShellState();
}

class _AdaptiveAppShellState extends State<AdaptiveAppShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    MedinowWelcomeScreen(),
    MeditationCatalogScreen(),
    PopularMenuScreen(),
    WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mobileContent = Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF039EA1),
        unselectedItemColor: Colors.grey.shade400,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            icon: CustomPaint(
              size: const Size(24, 24),
              painter: _YinYangPainter(color: Colors.grey.shade400),
            ),
            activeIcon: const CustomPaint(
              size: Size(24, 24),
              painter: _YinYangPainter(color: Color(0xFF039EA1)),
            ),
            label: 'Легкий 1',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.headphones_outlined),
            activeIcon: Icon(Icons.headphones_rounded),
            label: 'Легкий 2',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining_outlined),
            activeIcon: Icon(Icons.lunch_dining_rounded),
            label: 'Сложный 1',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            activeIcon: Icon(Icons.credit_card_rounded),
            label: 'Сложный 2',
          ),
        ],
      ),
    );

    if (!kIsWeb) {
      return mobileContent;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(48),
            border: Border.all(color: const Color(0xFF334155), width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 36,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(44),
            child: mobileContent,
          ),
        ),
      ),
    );
  }
}

class _YinYangPainter extends CustomPainter {
  final Color color;

  const _YinYangPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);

    final outlinePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;
    canvas.drawCircle(center, radius - 1, outlinePaint);

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(center.dx, 1)
      ..arcToPoint(
        Offset(center.dx, size.height - 1),
        radius: Radius.circular(radius - 1),
        clockwise: true,
      )
      ..arcToPoint(
        center,
        radius: Radius.circular((radius - 1) / 2),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(center.dx, 1),
        radius: Radius.circular((radius - 1) / 2),
        clockwise: true,
      )
      ..close();
    canvas.drawPath(path, fillPaint);

    final dotRadius = (radius - 1) * 0.18;
    canvas.drawCircle(Offset(center.dx, (radius - 1) * 0.5 + 1), dotRadius, Paint()..color = Colors.white);
    canvas.drawCircle(Offset(center.dx, (radius - 1) * 1.5 + 1), dotRadius, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _YinYangPainter oldDelegate) => oldDelegate.color != color;
}