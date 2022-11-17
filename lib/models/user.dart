




import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  final String username;
  final String uid;
  final String photoUrl;
  final String email;
  final String bio;
  final List followers;
  final List following;



  User({
    required this.email,
    required this.username,
    required this.uid,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,

});

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "bio": bio,
    "followers": followers,
    "following": following,
  };

  //taking document snapshot return usermodel

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot['username'],
      email: snapshot['email'],
      bio: snapshot['bio'],
      uid: snapshot['uid'],
      followers: [],
      following: [],
      photoUrl: snapshot['photoUrl'],
    );
  }


}