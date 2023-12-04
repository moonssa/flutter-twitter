import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/create_account_screen.dart';
import 'package:twitter/features/authentication/widgets/authentication_button.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  void _onCreateAccountTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle blueTextStyle = TextStyle(
      fontSize: Sizes.size16,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).primaryColor,
    );

    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size44,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size24,
          vertical: Sizes.size24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.v72,
            const Text(
              "See what's happening in the world right now",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v80,
            const AuthButton(
              text: "Continue with Google",
              icon: FaIcon(FontAwesomeIcons.google),
              isReversed: false,
            ),
            Gaps.v16,
            const AuthButton(
              text: "Continue with Apple",
              icon: FaIcon(FontAwesomeIcons.apple),
              isReversed: false,
            ),
            Gaps.v16,
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
                const Text("  or  ",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    )),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onCreateAccountTap,
              child: const AuthButton(
                text: "CreateAccount",
                isReversed: true,
              ),
            ),
            Gaps.v20,
            FractionallySizedBox(
              widthFactor: 1,
              child: Wrap(
                runSpacing: 2,
                children: [
                  const Text(
                    "By signing up, you agree to our ",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Text("Terms", style: blueTextStyle),
                  const Text(
                    ", ",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  ),
                  Text(
                    "Privacy Policy",
                    style: blueTextStyle,
                  ),
                  const Text(
                    ", and ",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Text(
                    "Cookie Use",
                    style: blueTextStyle,
                  ),
                  const Text(
                    ".",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: Row(
            children: [
              const Text(
                "Have an account already?",
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.h10,
              Text(
                "Log in",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
