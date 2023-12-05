import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/main_navigation/widgets/like_reaction.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size44,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size24,
          vertical: Sizes.size12,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 45,
                  child: Stack(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.moon,
                        size: Sizes.size36,
                      ),
                      Positioned(
                          left: 22,
                          bottom: 3,
                          child: FaIcon(FontAwesomeIcons.circlePlus)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("pubity"),
                              FaIcon(FontAwesomeIcons.circleCheck),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("2m"),
                              FaIcon(FontAwesomeIcons.ellipsis),
                            ],
                          ),
                        ],
                      ),
                      Text("Vine after seeing the Threads logo unvelied"),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.heart),
                    FaIcon(FontAwesomeIcons.infinity),
                    FaIcon(FontAwesomeIcons.infinity),
                    FaIcon(FontAwesomeIcons.fly),
                  ],
                ),
                LikeReaction(),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.white,
        elevation: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(FontAwesomeIcons.house),
            FaIcon(FontAwesomeIcons.magnifyingGlass),
            FaIcon(FontAwesomeIcons.message),
            FaIcon(FontAwesomeIcons.heart),
            FaIcon(FontAwesomeIcons.user),
          ],
        ),
      ),
    );
  }
}
