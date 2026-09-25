import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 26,
                        height: 22,
                        child: CustomPaint(painter: _LogoMarkPainter()),
                      ),
                      const SizedBox(width: 14),
                      const Text(
                        'My E-Wallet',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.search, color: Colors.black, size: 22),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black87, width: 1.2),
                        ),
                        child: const Icon(Icons.more_horiz, color: Colors.black, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              _buildCard(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Transaction History',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ],
              ),
              _buildTxItem(
                'Lawson Chair',
                'Dec 15, 2024 | 10:00 AM',
                '\$120',
                'Orders',
                'assets/images/chair.png',
                isExpense: true,
              ),
              _buildTxItem(
                'Top Up Wallet',
                'Dec 14, 2024 | 16:42 PM',
                '\$400',
                'Top Up',
                null,
                isExpense: false,
              ),
              _buildTxItem(
                'Parabolic Reflector',
                'Dec 14, 2024 | 11:39 AM',
                '\$170',
                'Orders',
                'assets/images/lamps.png',
                isExpense: true,
              ),
              _buildTxItem(
                'Mini Wooden Table',
                'Dec 13, 2024 | 14:46 PM',
                '\$165',
                'Orders',
                'assets/images/table.png',
                isExpense: true,
              ),
              _buildTxItem(
                'Top Up Wallet',
                'Dec 12, 2024 | 09:27 AM',
                '\$300',
                'Top Up',
                null,
                isExpense: false,
              ),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF161616),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _GeometricCubesPainter(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Andrew Ainsley',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'VISA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              fontSize: 22,
                              letterSpacing: -1,
                            ),
                          ),
                          const SizedBox(width: 10),
                          _buildMasterCardLogo(),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildCardNumberDots(),
                  const SizedBox(height: 32),
                  const Text(
                    'Your balance',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '\$9,379',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(24),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomPaint(
                                    size: const Size(15, 14),
                                    painter: _InboxArrowPainter(),
                                  ),
                                  const SizedBox(width: 7),
                                  const Text(
                                    'Top Up',
                                    style: TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardNumberDots() {
    Widget dotsGroup() {
      return Row(
        children: List.generate(
          4,
          (i) => Container(
            margin: const EdgeInsets.only(right: 3),
            width: 4.5,
            height: 4.5,
            decoration: const BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        dotsGroup(),
        const SizedBox(width: 8),
        dotsGroup(),
        const SizedBox(width: 8),
        dotsGroup(),
        const SizedBox(width: 8),
        const Text(
          '3629',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildMasterCardLogo() {
    return SizedBox(
      width: 32,
      height: 20,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                color: Color(0xFFEB001B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: const Color(0xFFFF9800).withValues(alpha: 0.95),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Positioned(
            bottom: -3,
            child: Text(
              'mastercard',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 4.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTxItem(
    String title,
    String date,
    String amount,
    String type,
    String? imageUrl, {
    required bool isExpense,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildTxAvatar(imageUrl, isTopUp: type == 'Top Up'),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(date, style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(type, style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
                  const SizedBox(width: 6),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: isExpense ? const Color(0xFFFFE2E2) : const Color(0xFFDCEBFF),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isExpense ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 10,
                      color: isExpense ? Colors.red : Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTxAvatar(String? imageUrl, {required bool isTopUp}) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Color(0xFFEEEEEE),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: isTopUp
          ? Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E1E),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
                size: 18,
              ),
            )
          : ClipOval(
              child: SizedBox(
                width: 44,
                height: 44,
                child: imageUrl != null
                    ? (imageUrl.startsWith('http')
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                          )
                        : Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ))
                    : const SizedBox.shrink(),
              ),
            ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_outlined, 'Home', selected: false),
          _buildNavItem(Icons.shopping_bag_outlined, 'Cart', selected: false),
          _buildNavItem(Icons.shopping_cart_outlined, 'Orders', selected: false),
          _buildNavItem(Icons.account_balance_wallet, 'Wallet', selected: true),
          _buildNavItem(Icons.person_outline, 'Profile', selected: false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {required bool selected}) {
    final color = selected ? Colors.black : Colors.grey.shade400;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 28,
          child: Icon(
            icon,
            color: color,
            size: 26,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _GeometricCubesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawCube(canvas, Offset(size.width * 0.15, size.height * 0.62), size.width * 0.23);
    _drawCube(canvas, Offset(size.width * 0.68, size.height * 0.28), size.width * 0.27);
    _drawCube(canvas, Offset(size.width * 0.82, size.height * 0.94), size.width * 0.28);
  }

  void _drawCube(Canvas canvas, Offset center, double s) {
    final double dy = s * 0.58;

    final topPath = Path()
      ..moveTo(center.dx, center.dy - dy)
      ..lineTo(center.dx + s, center.dy)
      ..lineTo(center.dx, center.dy + dy)
      ..lineTo(center.dx - s, center.dy)
      ..close();

    final leftPath = Path()
      ..moveTo(center.dx - s, center.dy)
      ..lineTo(center.dx, center.dy + dy)
      ..lineTo(center.dx, center.dy + dy + s * 1.1)
      ..lineTo(center.dx - s, center.dy + s * 1.1)
      ..close();

    final rightPath = Path()
      ..moveTo(center.dx, center.dy + dy)
      ..lineTo(center.dx + s, center.dy)
      ..lineTo(center.dx + s, center.dy + s * 1.1)
      ..lineTo(center.dx, center.dy + dy + s * 1.1)
      ..close();

    canvas.drawPath(topPath, Paint()..color = const Color(0xFF282828));
    canvas.drawPath(leftPath, Paint()..color = const Color(0xFF1E1E1E));
    canvas.drawPath(rightPath, Paint()..color = const Color(0xFF222222));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _InboxArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A1A1A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final tray = Path()
      ..moveTo(0, size.height * 0.35)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.35);
    canvas.drawPath(tray, paint);

    canvas.drawLine(
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height * 0.65),
      paint,
    );

    final arrow = Path()
      ..moveTo(size.width * 0.28, size.height * 0.42)
      ..lineTo(size.width * 0.5, size.height * 0.65)
      ..lineTo(size.width * 0.72, size.height * 0.42);
    canvas.drawPath(arrow, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LogoMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final top = Path()
      ..moveTo(0, size.height * 0.08)
      ..quadraticBezierTo(size.width * 0.55, -size.height * 0.15, size.width, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.8, size.height * 0.4, 0, size.height * 0.35)
      ..close();
    canvas.drawPath(top, paint);

    final mid = Path()
      ..moveTo(0, size.height * 0.48)
      ..quadraticBezierTo(size.width * 0.42, size.height * 0.3, size.width * 0.78, size.height * 0.55)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.72, 0, size.height * 0.72)
      ..close();
    canvas.drawPath(mid, paint);

    final bottom = Path()
      ..moveTo(0, size.height * 0.85)
      ..quadraticBezierTo(size.width * 0.32, size.height * 0.68, size.width * 0.55, size.height * 0.9)
      ..quadraticBezierTo(size.width * 0.38, size.height * 1.05, 0, size.height * 1.0)
      ..close();
    canvas.drawPath(bottom, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}