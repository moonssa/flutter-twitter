import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/sizes.dart';
/*
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }


}
*/

class LikeReaction extends StatelessWidget {
  const LikeReaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 80,
          height: 60,
          child: Stack(
            children: [
              Positioned(
                bottom: 15,
                child: FaIcon(
                  FontAwesomeIcons.moon,
                  size: Sizes.size36,
                ),
              ),
              Positioned(
                left: 30,
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  size: Sizes.size36,
                ),
              ),
              Positioned(
                left: 30,
                bottom: 3,
                child: FaIcon(FontAwesomeIcons.sun),
              ),
            ],
          ),
        ),
        Text("36 Replis "),
        FaIcon(
          FontAwesomeIcons.solidCircle,
          size: Sizes.size6,
        ),
        Text(" 631 likes"),
      ],
    );
  }
}
