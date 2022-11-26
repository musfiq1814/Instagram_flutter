
import 'package:flutter/material.dart';

import 'package:instagram_flutter/utils/colors.dart';
import 'package:intl/intl.dart';



class PostCard extends StatelessWidget {
  final snap;
  const PostCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        vertical: 10
      ),

      child: Column(
        children: [

          // header
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16).copyWith(right: 0),
            child: Row(
              children: [




                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    snap['profImage']
                  ),
                ),

                Expanded(child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      
                      Text(snap['username'], style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                    ],
                    
                    
                  ),
                )),

                IconButton(
                  color: Colors.black,
                  onPressed: (){
                  showDialog(
                      context: context, builder: (context)=>
                      Dialog(
                        child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ].map(
                                  (e) => InkWell(
                                    highlightColor: Colors.black,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Text(e),
                            ),
                          )
                          ).toList(),
                        ),
                      )
                  );
                },
                  icon: Icon(Icons.more_vert,color: Colors.white,)

                )
              ],
            ),




          ),

          //Image selection

          SizedBox(
            height: MediaQuery.of(context).size.height*0.35,
            width: double.infinity,

            child: Image.network(snap['postUrl']),

          ),


          // Icon Buttons

          Row(
            children: [

              IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color:  Colors.red,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined,color: Colors.white,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.send,color: Colors.white)),

              Expanded(child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.bookmark_border, color: Colors.white,),
                  onPressed: (){},
                ),
              )
              ),
            ],
          ),

          // comment section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle2!.copyWith( fontWeight: FontWeight.w800),
                    child: Text( '${snap['likes'].length} likes' , style: TextStyle(color: Colors.white))),


                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 8
                  ),

                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: snap['username'],
                          style: TextStyle(fontWeight: FontWeight.bold)
                        ),

                        TextSpan( text: ' '),

                        TextSpan(
                          text: ' ${snap['description']}',

                        ),
                      ]
                    ),

                  ),

                ),




                InkWell(
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: 8
                    ),
                    child: Text('View all 200 comments ',style: TextStyle(fontSize: 16, color: secondaryColor),),
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: 8
                  ),
                  child: Text(DateFormat.yMMMd().format(snap['datePublished'].toDate()),style: TextStyle(fontSize: 16, color: secondaryColor),),
                ),



              ],
            ),
          ),















        ],
      ),

    );
  }
}
