
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/utils.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async{
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(email: _emailController.text, password: _passwordController.text, username: _usernameController.text, bio: _bioController.text);

    setState(() {
      _isLoading = false;
    });

    if(res !='success'){
      showSnackBar(res, context);
    }

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


                SizedBox(height: 20),


                Stack(
                  children: [

                    CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage('https://i.pinimg.com/736x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg'),
                    ),

                  ],
                ),
                SizedBox(height: 10),

                TextFieldInput(
                  hintText: 'Enter Your UserName',
                  textInputType: TextInputType.text,
                  textEditingController: _usernameController,

                ),
                SizedBox(height: 20),




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

                TextFieldInput(
                  hintText: 'Enter Your Bio',
                  textInputType: TextInputType.text,
                  textEditingController: _bioController,

                ),
                SizedBox(height: 20),



                InkWell(
                  onTap: signUpUser,
                child: Container(

                    child: _isLoading ? Center(child: CircularProgressIndicator(
                      color: primaryColor,
                    )): Text('Sign Up'),
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

                SizedBox(height: 120),



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

                      onTap: (){

                      },


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
