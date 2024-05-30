import 'package:flutter/material.dart';
import '../../Formatting/Colors.dart';
import '../../Pages/CommentPage/CommentPage.dart';
import '../../Pages/ProblemResolverPage/ResolverPage.dart';
import '../DescriptionComponent/DescriptionComponent.dart';
import 'ContentTag.dart';
import 'ContentViewer.dart';
import 'SolutionPage.dart';

class PostComponent extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final String content;
  final List<String> images;
  final int likes;
  final int comments;
  final List<String>? tags; // Nullable tags

  PostComponent({
    required this.username,
    required this.avatarUrl,
    required this.content,
    required this.images,
    required this.likes,
    required this.comments,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomTheme.postBackgroundColor,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(color: CustomTheme.postTextColor),
                ),
                const Text(
                  '12/23/2321',
                  style: TextStyle(
                    color: CustomTheme.appBarTextColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DescriptionComponent(
              description: content,
              offsetLength: 200,
            ),
          ),
          const SizedBox(height: 8.0),
          if (tags != null && tags!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8,
                children: tags!
                    .map((tag) => ColoredTag(
                  text: tag,
                  color: CustomTheme.appBodyColor,
                ))
                    .toList(),
              ),
            ),
          const SizedBox(height: 8.0),
          if (images.isNotEmpty)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              child: ContentViewer(imagesURL: images),
            ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$likes Upvotes',
                  style: const TextStyle(color: CustomTheme.postTextColor),
                ),
                Text(
                  '$comments Comments',
                  style: const TextStyle(color: CustomTheme.postTextColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResolverPage()),
                  ),
                  icon: const Icon(
                    Icons.lightbulb,
                    color: CustomTheme.postIconButtonColor,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SolutionPage()),
                  ),
                  icon: const Icon(
                    Icons.pageview,
                    color: CustomTheme.postIconButtonColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CommentsPage()),
                    );
                  },
                  icon: const Icon(
                    Icons.comment,
                    color: CustomTheme.postIconButtonColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Upvote functionality here
                  },
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: CustomTheme.postIconButtonColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
