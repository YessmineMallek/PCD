import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final String text;

  const GlowingButton({
    Key?key,
    this.color1 = const Color(0xFF64B5F6), // Bleu doux
    this.color2 = const Color(0xFF81C784), // Vert doux
    required this.text,
  }) : super(key: key);

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  var glowing = true;
  var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: Duration(milliseconds: 200),
        height: 63,
        width: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              widget.color1,
              widget.color2,
            ],
          ),
          boxShadow: glowing
              ? [
            BoxShadow(
              color: widget.color1.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 16,
              offset: Offset(-8, 0),
            ),
            BoxShadow(
              color: widget.color2.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 16,
              offset: Offset(8, 0),
            ),
            BoxShadow(
              color: widget.color1.withOpacity(0.2),
              spreadRadius: 16,
              blurRadius: 32,
              offset: Offset(-8, 0),
            ),
            BoxShadow(
              color: widget.color2.withOpacity(0.2),
              spreadRadius: 16,
              blurRadius: 32,
              offset: Offset(8, 0),
            )
          ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
