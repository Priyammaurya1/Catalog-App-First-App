import 'package:coffee_card/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LogInpage extends StatefulWidget {
  const LogInpage({super.key});

  @override
  State<LogInpage> createState() => _LogInpageState();
}

class _LogInpageState extends State<LogInpage> {
  String name = "";
  bool changeButton = false;

  final forKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (forKey.currentState!.validate()) {  // to check if the form is validated or not.
      setState(() {});
    } else {
      return;
    }
    setState(() {
      changeButton = true; 
    });

    await Future.delayed(
      Duration(seconds: 1),
    ); 
    await Navigator.pushNamed(
      context,
      MyRoutes.homeRoutes,
    ); 
    setState(() {
      changeButton = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: forKey,
          child: Column(
            children: [
              Image.asset("assets/login.png", fit: BoxFit.cover, height: 300),
              SizedBox(height: 20.0),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: context.theme.highlightColor,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter UserName",
                        labelText: "UserName",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true, // to hide the password.
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ), // to give space between the text field and the button.

                    Material(
                      color: context.theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(
                        changeButton ? 50 : 8,
                      ),

                      child: InkWell(
                        splashColor: Colors.red,
                        borderRadius: BorderRadius.circular(
                          changeButton ? 50 : 8,
                        ),
                        onTap: () => moveToHome(context),

                        child: AnimatedContainer(
                          duration: Duration(
                            seconds: 1,
                          ), // to animate the button.
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,

                          child:
                              changeButton
                                  ? Icon(Icons.done, color: Colors.white)
                                  : Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}