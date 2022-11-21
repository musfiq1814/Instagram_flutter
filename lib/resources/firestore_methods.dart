

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_flutter/models/post.dart';
import 'package:instagram_flutter/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMehtods{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<String> uploadPost(
      String description,
      Uint8List file,
      String uid,
      String username,
      String profImage,
      ) async{

    String res = "some error occured";

    try{
      
      String photoUrl =  await StorageMethods().uploadImageToStorage('posts', file, true);

      String postId = Uuid().v1();

      Post post = Post(uid: uid, username: username, datePublished: DateTime.now(), description: description, likes: [], postId: postId, postUrl: photoUrl, profImage: profImage);

      _firestore.collection('posts').doc(postId).set(post.toJson());

      res = "success";

      
    }catch(e)
    {
      res = e.toString();
    }

    return res;

  }


}