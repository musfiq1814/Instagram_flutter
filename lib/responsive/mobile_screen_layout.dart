import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/global_variable.dart';
import 'package:provider/provider.dart';
import 'package:instagram_flutter/models/user.dart' as model;


class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {



  /*
  String username = "";
  String uid = "";
  String email = "";
  String bio = "";
  String followers = "";
  String following = "";


  void initState(){
    super.initState();
    getData();
  }

  void getData() async{

    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();

    //print(snap.data());
    //print(snap.get('bio'));
    //print(snap.get('email'));
    setState(() {
      username = snap.get('username');
      uid = snap.get('uid');
      email = snap.get('email');
      bio = snap.get('bio');

    });


  }
*/

  int _page = 0;

  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }


  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }


  void onPageChanged(int page){

    setState(() {
      _page = page;
    });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black12,
      body: PageView(


        children: homeScreenItems,
        //physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,

      ),


      bottomNavigationBar: CupertinoTabBar(

        backgroundColor: mobileBackgroundColor,

        items: [

          BottomNavigationBarItem(

              icon: Icon(Icons.home, color: _page==0? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor,



          ),
          BottomNavigationBarItem(

              icon: Icon(Icons.search, color: _page==1? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor,



          ),

          BottomNavigationBarItem(

              icon: Icon(Icons.add_circle, color: _page==2? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor,



          ),
          BottomNavigationBarItem(

              icon: Icon(Icons.favorite, color: _page==3? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor,



          ),
          BottomNavigationBarItem(

              icon: Icon(Icons.person, color: _page==4? primaryColor : secondaryColor,),
            label: '',
            backgroundColor: primaryColor,



          ),





        ],


        onTap: navigationTapped,




      )

      ,



    );





    //model.User user = Provider.of<UserProvider>(context).getUser;
    /*
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('username : '+user.username,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20)),
                Text('uid : '+user.uid),
                Text('email : '+user.email),
                Text('bio : '+user.bio),
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
    */

  }
}
