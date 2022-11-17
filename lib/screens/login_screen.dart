
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';

import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';

import '../utils/utils.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;


  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void logInUser() async{

    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().logInUser(email: _emailController.text, password: _passwordController.text);

    if(res == "success"){

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => ResponsiveLayout(mobileScreenLayout: MobileScreenLayout())

          )
      );
    }
    else
      {
        showSnackBar(res, context);
      }

    setState(() {
      _isLoading = false;
    });

  }


  void NavigatetoSignUp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen(),),);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 32),

          width: double.infinity,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Flexible(child: Container(),flex: 2,),

              //image

              SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor,height: 64,),


              SizedBox(height: 64),

              // textfield for email


              TextFieldInput(
                hintText: 'Enter Your Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,

              ),
              SizedBox(height: 20),

              TextFieldInput(
                hintText: 'Enter Your Password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),

              SizedBox(height: 20),


              InkWell(
                onTap: logInUser,
                child: Container(

                  child: _isLoading ? Center(
                      child: CircularProgressIndicator(
                    color: primaryColor,
                  )): Text('Log In'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))
                    )
                  ),

                ),
              ),

              SizedBox(height: 200),



              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    child: Text(

                      "Don't have an account ?",
                      style: TextStyle(
                        fontSize: 15
                      ),

                    ),

                    decoration: ShapeDecoration(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))
                        )
                    ),

                    padding: EdgeInsets.symmetric(vertical: 5),

                  ),

                  SizedBox(width: 5),

                  GestureDetector(

                    onTap: NavigatetoSignUp,


                    child: Container(
                      child: Text(

                        "Sign Up",
                        style: TextStyle(
                            fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),

                      ),

                      decoration: ShapeDecoration(
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4))
                          )
                      ),

                      padding: EdgeInsets.symmetric(vertical: 5),

                    ),
                  )



                ],

              ),
              SizedBox(height: 50),




            ],

          ),

        ),

      )
    );
  }
}
