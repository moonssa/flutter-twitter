import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/password_screen.dart';
import 'package:twitter/features/authentication/widgets/app_bar.dart';
import 'package:twitter/features/authentication/widgets/form_button.dart';

class AuthCodeScreen extends StatefulWidget {
  final Map<String, String> formData;
  const AuthCodeScreen({super.key, required this.formData});

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreenState();
}

class _AuthCodeScreenState extends State<AuthCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FocusNode _codeFocusNode;

  bool _disable = true;
  final List<String> _codeList = ["", "", "", ""];

  bool isAllCodesFilled() {
    return _codeList.every((code) => code.isNotEmpty);
  }

  void _onSubmitTab() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PasswordScreen(),
          ),
        );
        setState(() {
          _disable = true;
        });
        print(_codeList);
      }
    }
  }

  String? _isValid(String? value) {
    print(value);
    if (value == null || value.isEmpty) {
      return "Input the code";
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    _codeFocusNode = FocusNode();
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
              "Create your account",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v32,
            Text(
              "Enter it below to verify\n${widget.formData['email']}",
              style: const TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            Gaps.v52,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onTap: () {
                            _codeFocusNode.requestFocus();
                            // FocusScope.of(context).requestFocus(FocusNode());
                          },
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                            setState(() {
                              _codeList[0] = value;
                              _disable = !isAllCodesFilled();
                            });
                          },
                          decoration: const InputDecoration(),
                          validator: _isValid,
                        ),
                      ),
                      Gaps.h12,
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          // keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                            setState(() {
                              _codeList[1] = value;
                              _disable = !isAllCodesFilled();
                            });
                          },
                          decoration: const InputDecoration(),
                          validator: _isValid,
                        ),
                      ),
                      Gaps.h12,
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          // keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                            setState(() {
                              _codeList[2] = value;
                              _disable = !isAllCodesFilled();
                            });
                          },
                          decoration: const InputDecoration(),
                          validator: _isValid,
                        ),
                      ),
                      Gaps.h12,
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          // keyboardType: TextInputType.number,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                            setState(() {
                              _codeList[3] = value;
                              _disable = !isAllCodesFilled();
                            });
                          },
                          decoration: const InputDecoration(),
                          validator: _isValid,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v32,
                  if (!_disable)
                    const FaIcon(FontAwesomeIcons.circleCheck,
                        size: Sizes.size32, color: Colors.green),
                  Gaps.v96,
                  Text("Din't receve email?",
                      style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor)),
                  GestureDetector(
                    onTap: _onSubmitTab,
                    child: FormButton(disabled: _disable, text: "Next"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
