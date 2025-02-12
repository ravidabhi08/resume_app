import 'package:flutter/material.dart';

class CoolAnimatedButton extends StatefulWidget {
  final void Function()? onPressed;

  const CoolAnimatedButton({super.key, this.onPressed});

  @override
  _CoolAnimatedButtonState createState() => _CoolAnimatedButtonState();
}

class _CoolAnimatedButtonState extends State<CoolAnimatedButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (hovering) {
        setState(() {
          isHovered = hovering;
        });
      },
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isHovered ? Colors.blueAccent.shade700 : Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.4),
                    blurRadius: 15,
                    spreadRadius: 3,
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.download, color: Colors.white),
            const SizedBox(width: 8),
            const Text(
              "Download & Share Resume",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
