import 'package:flutter/material.dart';
import 'package:try_amazon_app/common/widget/custom_button.dart';
import 'package:try_amazon_app/common/widget/custom_textfield.dart';
import 'package:try_amazon_app/constants/global_variable.dart';
import 'package:try_amazon_app/features/auth/services/auth_service.dart';

// signin and sign up value. track of radio button
enum Auth {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  // this string for route main page to auth page
  static const String routeName = '/auth-screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // calling auth service object
  final AuthService authService = AuthService();
  // set radio button default value
  Auth _auth = Auth.signup;
  // this is use for form validations
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // prevent any memory leak. so, dispose controller
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // sign up methods controller manage user input
  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  // sign in user
  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // changing gray bg color from global color
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // app bar text start in left corner
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // creating sign up part
              ListTile(
                /// set tile color. when signup radio btn is selected, then
                /// sign up tile color white. and sign in tile color gray
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,

                title: const Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      // set sign signup state, radio button clicking
                      _auth = val!;
                    });
                  },
                ),
              ),

              /// radio btn state is sign up, then show this
              /// [_signUpFormKey] is control form validation
              /// [Column] contain edit text view
              if (_auth == Auth.signup)
                Form(
                  key: _signUpFormKey,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Column(
                      children: [
                        // calling custon text field with controller param
                        CustomTextField(
                          controller: _nameController,
                          hintTxt: "Name",
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailController,
                          hintTxt: "Email",
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintTxt: "Password",
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            // validating user input. empty or null
                            if (_signUpFormKey.currentState!.validate()) {
                              // calling rest api
                              signUpUser();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),

              /// creating sign in part
              ListTile(
                /// set tile color. when signup radio btn is selected, then
                /// sign up tile color white. and sign in tile color gray
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Sign-in.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      // set sign signup state, radio button clicking
                      _auth = val!;
                    });
                  },
                ),
              ),

              /// radio btn state is sign in, then show this
              /// [_signInFormKey] is control form validation
              /// [Column] contain edit text view
              if (_auth == Auth.signin)
                Form(
                  key: _signInFormKey,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: GlobalVariables.backgroundColor,
                    child: Column(
                      children: [
                        // calling custon text field with controller param
                        CustomTextField(
                          controller: _emailController,
                          hintTxt: "Email",
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintTxt: "Password",
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
