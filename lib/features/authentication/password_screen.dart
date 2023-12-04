import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/widgets/app_bar.dart';
import 'package:twitter/features/authentication/widgets/form_button.dart';
import 'package:twitter/features/onboarding/interest_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _password = false;

  String? _isPasswordValid(String? value) {
    if (value != null) {
      if (value.isNotEmpty && value.length > 8) {
        setState(() {
          _password = true;
        });
        return null;
      }
    }
    setState(() {
      _password = false;
    });
    return "more than 8 characters";
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onSubmitTab() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InterestScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v72,
              const Text(
                "You'll need a password",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v16,
              const Text(
                "Make sure it's 8 characters or more.",
                style: TextStyle(
                  fontSize: Sizes.size16 + Sizes.size2,
                  color: Colors.black54,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
                      obscureText: _obscureText,
                      validator: _isPasswordValid,
                      decoration: InputDecoration(
                        label: const Text("Password"),
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: _toggleObscureText,
                              child: FaIcon(
                                _obscureText
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                color: Colors.grey.shade500,
                                size: Sizes.size24,
                              ),
                            ),
                            Gaps.h6,
                            FaIcon(
                              FontAwesomeIcons.circleCheck,
                              size: Sizes.size24,
                              color: _password
                                  ? Colors.green
                                  : Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gaps.v32,
                    GestureDetector(
                      onTap: _onSubmitTab,
                      child: FormButton(disabled: !_password, text: "Next"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
