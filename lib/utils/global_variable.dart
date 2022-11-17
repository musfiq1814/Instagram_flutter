

import 'package:flutter/material.dart';
import 'package:instagram_flutter/screens/add_post_screen.dart';
import 'package:instagram_flutter/screens/profile_screen.dart';


const webScreenSize = 600;

const homeScreenItems = [
  Center(child: Text('feed',style: TextStyle(color: Colors.blue),)),
  Center(child: Text('search',style: TextStyle(color: Colors.blue),)),
  AddPost(),
  Center(child: Text('notif',style: TextStyle(color: Colors.blue),)),
  Profile(),
];

