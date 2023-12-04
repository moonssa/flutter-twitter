import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;
  final bool isReversed;

  const AuthButton({
    super.key,
    required this.text,
    this.icon,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isReversed ? Colors.black : Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(Sizes.size52),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size32,
        vertical: Sizes.size24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon!.icon,
              size: icon!.icon == FontAwesomeIcons.apple
                  ? Sizes.size36
                  : Sizes.size28,
            ),
          if (icon != null) Gaps.h16,
          Text(
            text,
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w800,
              color: isReversed ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
