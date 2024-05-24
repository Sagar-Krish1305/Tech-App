import 'package:flutter/material.dart';
import 'package:flutter_app/Component/ContentViewer/ContentViewer.dart';
import 'package:flutter_app/Formatting/Colors.dart';

class PostComponent extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final String content;
  final List<String> images;
  final int likes;
  final int comments;

  PostComponent({
    required this.username,
    required this.avatarUrl,
    required this.content,
    required this.images,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomTheme.postBackgroundColor,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
            title: Text(username, style: const TextStyle(color: CustomTheme.postTextColor), ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(content, style: const TextStyle(color: CustomTheme.postTextColor),),
          ),
          SizedBox(height: 8.0),
          if (images.isNotEmpty)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4, // Adjust height as needed
              ),
              child: Contentviewer(imagesURL: images),
            ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$likes Likes', style: const TextStyle(color: CustomTheme.postTextColor),),
                Text('$comments Comments', style: const TextStyle(color: CustomTheme.postTextColor),),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.lightbulb, color: CustomTheme.postIconButtonColor,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment, color: CustomTheme.postIconButtonColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_upward, color: CustomTheme.postIconButtonColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
