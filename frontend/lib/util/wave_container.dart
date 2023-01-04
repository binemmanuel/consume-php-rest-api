import 'package:flutter/material.dart';

class WaveContainer extends StatelessWidget {
  const WaveContainer({
    super.key,
    this.height = 200,
    this.width = double.infinity,
    this.color = Colors.transparent,
    this.child,
  });

  final double height;
  final double width;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _WaveClipper(),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(color: color),
        child: child,
      ),
    );
  }
}

class _WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);

    final startPoint = Offset(size.width / 5, size.height);
    final endPoint = Offset(size.width / 2.25, size.height - 50);

    path.quadraticBezierTo(
      startPoint.dx,
      startPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    final startPoint1 = Offset(
      size.width - (size.width / 3.24),
      size.height - 105,
    );
    final endPoint1 = Offset(size.width, size.height - 10);

    path.quadraticBezierTo(
      startPoint1.dx,
      startPoint1.dy,
      endPoint1.dx,
      endPoint1.dy,
    );

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
