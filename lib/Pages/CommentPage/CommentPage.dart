import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Formatting/Colors.dart';

import 'CommentTile.dart';

class CommentsPage extends StatefulWidget {

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final List<String> _comments = ['wefwefwef'];
  final TextEditingController _controller = TextEditingController();
  final List<int> _likes = [1];
  final List<List<String>> _replies = [['efwefwef']];
  int? _replyIndex;

  void _addComment() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        if (_replyIndex != null) {
          _replies[_replyIndex!].add(_controller.text);
          _replyIndex = null;
        } else {
          _comments.add(_controller.text);
          _likes.add(0);
          _replies.add([]);
        }
        _controller.clear();
      });
    }
  }

  void _likeComment(int index) {
    setState(() {
      _likes[index]++;
    });
  }

  void _deleteComment(int index) {
    setState(() {
      _comments.removeAt(index);
      _likes.removeAt(index);
      _replies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comments',
          style: TextStyle(color: CustomTheme.appBarTextColor),
        ),
        backgroundColor: CustomTheme.appBodyColor,
      ),
      backgroundColor: CustomTheme.appBodyColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return CommentTile();
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: CustomTheme.postTextColor),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomTheme.appBarBackgroundColor,
                        labelText: _replyIndex != null ? 'Reply' : 'Add a comment',
                        labelStyle: TextStyle(color: CustomTheme.postTextColor),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addComment,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                    child: Text(_replyIndex != null ? 'Reply' : 'Post'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
