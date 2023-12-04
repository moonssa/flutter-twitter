import 'package:flutter/material.dart';
import 'package:twitter/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.onSelected,
  });

  final String interest;
  final VoidCallback onSelected;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onSelected();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(Sizes.size12),
        alignment: Alignment.bottomLeft,
        height: Sizes.size96,
        width: Sizes.size96 + Sizes.size72,
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Sizes.size16),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size16 + Sizes.size2,
          ),
        ),
      ),
    );
  }
}
