import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  double screenHeight = 0;
  double screenWidith = 0;

  Color primary = const Color(0xFFEEF444C);

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible = KeyboardVisibilityProvider.isKeyboardVisible(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidith = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          isKeyboardVisible? SizedBox(height: screenHeight / 16,) : Container(
            height: screenHeight / 2.5,
            width: screenWidith,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(70),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.person, 
                color: Colors.white,
                size: screenWidith / 5,
                ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 15,
              bottom: screenWidith / 20,
              ),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: screenWidith / 18,
                fontFamily: "Nexa Bold"
              ),
            )
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidith / 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldTitle("Student Number"),
                customFeild("Enter your Student Number", idController, false),
                fieldTitle("Password"),
                customFeild("Enter your Password", passController, true),
                Container(
                  height: 60,
                  width: screenWidith,
                  margin: EdgeInsets.only(top: screenHeight / 40),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: const BorderRadius.all(Radius.circular(30))
                  ),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontFamily: "Nexa Bold",
                        fontSize: screenWidith /26,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Widget fieldTitle(String title) {
    Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidith / 26 ,
          fontFamily: "Nexa Bold"
        ),
      ),
    );
    throw '';
  }

  Widget customFeild(String hint, TextEditingController controller, bool obscure) {
    Container(
      width: screenWidith,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            offset: Offset(2, 2),                      
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: screenWidith / 10,
            child: Icon(
              Icons.person,
              color: primary,
              size: screenWidith / 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: screenWidith / 12),
              child: TextFormField(
                controller: controller,
                enableSuggestions: false,
                autocorrect: false,                
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHeight / 35,
                  ),
                  border: InputBorder.none,
                  hintText: hint,
                ),
                maxLines: 1,
                obscureText: obscure,
              )
            )
          )
        ],
      ),
    );
    throw '';
  }

}

