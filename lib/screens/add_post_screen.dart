import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/resources/firestore_methods.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/utils.dart';
import 'package:provider/provider.dart';



class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  Uint8List? _file;

  final TextEditingController _desciptionController = TextEditingController();


  postImage(String uid, String username, String profImage) async {


    try{
      String res = await FirestoreMehtods().uploadPost(_desciptionController.text, _file!, uid, username, profImage);
      if(res == "success")
        {
          showSnackBar("Posted Successfully!", context);
        }
      else
        {
          showSnackBar(res, context);
        }
      
      
    }catch(e){
      showSnackBar(e.toString(), context);
    }


  }


  _selectImage(BuildContext context) async{


    return showDialog(context: context, builder: (context) {

      return SimpleDialog(
        title: Text('Create a post'),
        children: [
          SimpleDialogOption(
            padding: EdgeInsets.all(20),
            child: Text('Take a photo'),
            onPressed: () async{


              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera);

              setState(() {
                _file = file;

              });



            },
          ),
          SimpleDialogOption(
            padding: EdgeInsets.all(20),
            child: Text('Choose from gallary'),
            onPressed: () async{


              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery);

              setState(() {
                _file = file;

              });



            },
          ),

          SimpleDialogOption(
            padding: EdgeInsets.all(20),
            child: Text('Cancel'),
            onPressed: () {


              Navigator.of(context).pop();

            },
          )
        ],
      );

    }
    );

  }


  @override
  void dispose() {

    super.dispose();
    _desciptionController.dispose();

  }







  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<UserProvider>(context).getUser;

    return _file == null? Center(
      child: IconButton(
        color: Colors.white,
        icon: Icon(Icons.upload), onPressed: () => _selectImage(context),
      ),
    )
        :

    Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){

          },
        ),
        title: Text('Post To '),
        actions: [
          TextButton(

              onPressed: () => postImage(user.uid,user.username,user.photoUrl),


              child: Text(
            'Post', style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          ))
        ],
      ),


      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl),
              ),

              
              SizedBox(

                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  controller: _desciptionController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Write a caption.. ',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),


              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487/451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(_file!),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      )
                    ),
                  ),
                ),
              ),


              Divider(),















            ],
          )
        ],
      )



    );


  }
}
