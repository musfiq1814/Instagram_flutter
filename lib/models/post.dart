







import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  final String description;
  final String username;
  final String uid;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;



  Post({

    required this.uid,
    required this.username,
    required this.datePublished,
    required this.description,
    required this.likes,
    required this.postId,
    required this.postUrl,
    required this.profImage,



  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "datePublished": datePublished,
    "description": description,
    "likes": likes,
    "postId": postId,
    "postUrl": postUrl,
    "profImage": profImage,
  };

  //taking document snapshot return postmodel

  static Post fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      profImage: snapshot['profImage'],
      datePublished: snapshot['datePublished'],
      description: snapshot['description'],
      likes: snapshot['likes'],
      postId: snapshot['postId'],
      postUrl: snapshot['postUrl'],
    );
  }


}