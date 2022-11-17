import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';



class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    /*
    return Center(
      child: IconButton(
        icon: Icon(Icons.upload), onPressed: () {  },
      ),
    );

     */

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){},
        ),
        title: Text('Post To '),
        actions: [
          TextButton(onPressed: (){}, child: Text(
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
                //backgroundImage: ,
              )

            ],
          )
        ],
      )



    );
  }
}
