import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/widgets/form_button.dart';

class CustomizedScreen extends StatefulWidget {
  const CustomizedScreen({super.key});

  @override
  State<CustomizedScreen> createState() => _CustomizedScreenState();
}

class _CustomizedScreenState extends State<CustomizedScreen> {
  bool _switchValue = false;

  void _onSubmitTab() {
    Navigator.pop(context, _switchValue);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle blueTextStyle = TextStyle(
      fontSize: Sizes.size16,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).primaryColor,
    );

    const TextStyle blackTextStyle = TextStyle(
      fontSize: Sizes.size16,
    );

    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size44,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "Customize your experience ",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Gaps.v20,
            const Text(
              "Track where you see Twitter content across the web ",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Gaps.v20,
            Row(
              children: [
                const Expanded(
                  child: Text(
                      "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email or phone number.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Switch(
                  activeColor: Colors.white,
                  activeTrackColor: Colors.green,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.shade300,
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            Gaps.v36,
            Wrap(
              runSpacing: 2,
              children: [
                const Text(
                  "By signing up, you agree to our ",
                  style: blackTextStyle,
                ),
                Text("Terms", style: blueTextStyle),
                const Text(
                  ", ",
                  style: blackTextStyle,
                ),
                Text(
                  "Privacy Policy",
                  style: blueTextStyle,
                ),
                const Text(
                  ", and ",
                  style: blackTextStyle,
                ),
                Text(
                  "Cookie Use",
                  style: blueTextStyle,
                ),
                const Text(". Twitter", style: blackTextStyle),
                const Text(
                  "may use your contact information, including your email address and phone number for purpose outlined in Our Privacy Policy.",
                  style: blackTextStyle,
                ),
                Text(
                  "Learn More.",
                  style: blueTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24, vertical: Sizes.size12),
        color: Colors.white,
        elevation: 0,
        child: GestureDetector(
            onTap: _onSubmitTab,
            child: FormButton(disabled: !_switchValue, text: "Next")),
      ),
    );
  }
}
