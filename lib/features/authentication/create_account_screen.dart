import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/auth_code_screen.dart';
import 'package:twitter/features/authentication/customized_screen.dart';
import 'package:twitter/features/authentication/widgets/app_bar.dart';
import 'package:twitter/features/authentication/widgets/form_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();

  String _name = "", _email = "", _birth = "";
  bool _agreed = false;

  Map<String, String> formData = {};

  bool _isNameValid() {
    return _name.isNotEmpty;
  }

  bool _isEmailValid() {
    if (_email.isEmpty) return false;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return false;
    }
    return true;
  }

  bool _isBirthValid() {
    return _birth.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _birthController.addListener(() {
      setState(() {
        _birth = _birthController.text;
      });
    });
  }

  void _onSubmitTab() async {
    if (_agreed) {
      print(formData);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AuthCodeScreen(formData: formData),
        ),
      );
    } else {
      if (_formKey.currentState != null) {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          final bool agreed = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CustomizedScreen(),
            ),
          );
          setState(
            () => _agreed = agreed,
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthController.dispose();
    super.dispose();
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
            Gaps.v72,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: _inputDecoration("Name", _isNameValid()),
                    validator: (value) {
                      if (_isNameValid()) return null;
                      return "Input your name";
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['name'] = newValue;
                      }
                    },
                  ),
                  Gaps.v20,
                  TextFormField(
                    controller: _emailController,
                    decoration: _inputDecoration("Email", _isEmailValid()),
                    validator: (value) {
                      if (_isEmailValid()) return null;
                      return "Input your Email";
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['email'] = newValue;
                      }
                    },
                  ),
                  Gaps.v20,
                  TextFormField(
                    controller: _birthController,
                    decoration: _inputDecoration("Birthday", _isBirthValid()),
                    validator: (value) {
                      if (_isBirthValid()) return null;
                      return "Input your Birthday";
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['birth'] = newValue;
                      }
                    },
                  ),
                  Gaps.v28,
                  GestureDetector(
                    onTap: _onSubmitTab,
                    child: FormButton(
                      disabled: !_isNameValid() ||
                          !_isEmailValid() ||
                          !_isBirthValid(),
                      text: _agreed ? "SignUp" : "Next",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String text, bool valid) {
    return InputDecoration(
      hintText: text,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      suffixIcon: FaIcon(
        FontAwesomeIcons.circleCheck,
        color: valid ? Colors.green : Colors.grey.shade400,
      ),
    );
  }
}
