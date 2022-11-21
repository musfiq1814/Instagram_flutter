

/*

this is my fully build instagram application
goto github
got settings
develper settings
tokens
personal access tokens
generate new token (classic)
copy that
git init
git add .
git remote add origin https://github.com/musfiq1814/Instagram_flutter.git
git push -u origin master
username : musfiq1814
pass: mrs1210900445
git commit -m "messege"


yo yo
 */





import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:provider/provider.dart';
import 'responsive/responsive_layout_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
      ],
      
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        //home: SignupScreen(),


        home: StreamBuilder(



          stream: FirebaseAuth.instance.authStateChanges(), // whenevver user signs inor signs out

          builder: (context,snapshot){




            if(snapshot.connectionState == ConnectionState.active){

              if(snapshot.hasData){
                return ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(),);
              }
              else if(snapshot.hasError){
                return Center(child: Text('${snapshot.hasError}'),);
              }


            }

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,

                ),
              );
            }


            return LoginScreen();

          },
        ),








        ),
    );
  }
}
