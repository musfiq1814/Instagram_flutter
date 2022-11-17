import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:provider/provider.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    model.User user = Provider.of<UserProvider>(context).getUser;

    //return Scaffold(body: Container(child: Center(child: Text('profile',style: TextStyle(color: Colors.blue),))));


    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('username : '+user.username,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.blueAccent)),
                Text('uid : '+user.uid,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15,color: Colors.blueAccent)),
                Text('email : '+user.email,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.blueAccent)),
                Text('bio : '+user.bio,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.blueAccent)),
                SizedBox(height: 20),
                Center(child: SizedBox(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                      image: NetworkImage(user.photoUrl),
                      placeholder: NetworkImage(user.photoUrl)
                  ),
                )
                )

              ]),
          /*

              */


      ),
    );

  }
}
