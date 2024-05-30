import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Formatting/Colors.dart';

class DescriptionComponent extends StatefulWidget {
  final String description;
  final int offsetLength;

  const DescriptionComponent({
    required this.description,
    required this.offsetLength,
    super.key,
  });

  @override
  State<DescriptionComponent> createState() => _DescriptionComponentState();
}

class _DescriptionComponentState extends State<DescriptionComponent> {
  bool readMore = false;
  late String content;

  @override
  void initState() {
    super.initState();
    content = widget.description.substring(
      0,
      min(widget.description.length, widget.offsetLength),
    );
  }

  void handleReadMoreClick() {
    setState(() {
      readMore = !readMore;
      if (readMore) {
        content = widget.description;
      } else {
        content = widget.description.substring(
          0,
          min(widget.description.length, widget.offsetLength),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          text: content,
          style: const TextStyle(color: CustomTheme.postTextColor, fontSize: 18),
          children: <TextSpan>[
              TextSpan(
                text: readMore ? '... Read less' : '... Read more',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()..onTap = handleReadMoreClick,
              ),
          ],
        ),
      ),
    );
  }
}
