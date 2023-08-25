import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import '../utils/colors.dart';
import '../widget/textfield_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoading = false;
  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    final provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Screen",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: myHeight * 0.4,
              child: Column(
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 0,
                      child: TextFieldInput(
                        hintText: 'Enter your username',

                        textEditingController: _userNameController,
                        // textInputType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 0,
                      child: TextFieldInput(
                        hintText: 'Enter your password',
                        textEditingController: _passwordController,
                        textInputType: TextInputType.text,
                        isPass: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () async {
                      await Provider.of<UserProvider>(context, listen: false)
                          .getUserLogin(_userNameController.text,
                              _passwordController.text);
                      debugPrint("username.. ${_userNameController.text}");
                      debugPrint("password.. ${_passwordController.text}");

                      if (provider.userModel!.message == "Login Successfully") {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          color: yellowColor,
                        ),
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              )
                            : const Text(
                                "Log in",
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
