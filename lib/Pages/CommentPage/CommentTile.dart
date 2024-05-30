import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Formatting/Colors.dart';

class CommentTile extends StatefulWidget {
  const CommentTile({super.key});

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: CustomTheme.appBarBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/600/400'),
            radius: 20.0,
          ),

          Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'username',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                  color: CustomTheme.appBarTextColor
                              )
                            ),
                            TextSpan(
                                text: 'comment description',
                            )
                          ]
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 4),
                        child:  const Text(
                          '24-32-2123',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: CustomTheme.appBarTextColor
                          ),
                        ),
                    ),
                  ],
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.favorite, size: 16,),
          )
        ],
      ),
    );
  }
}
