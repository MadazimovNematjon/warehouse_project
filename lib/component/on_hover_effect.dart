import 'package:flutter/material.dart';
import 'package:warehouse_project/utility/colors.dart';

class HoverButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color; // Add the color parameter

  HoverButton({
    required this.title,
    required this.onPressed,
    this.color, // Set the default value to null
  });

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          _isHovering = value;
        });
      },
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 100,
        height: 40,
        color: _isHovering ?   widget.title  == "Radetish" ?  Colors.red : (widget.color ?? Colors.grey) : secondaryColor,
        // Use the specified color, or default to Colors.grey
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
