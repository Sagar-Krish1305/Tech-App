
import 'package:flutter/material.dart';
import 'package:flutter_app/Component/PageIndicator/PageIndicator.dart';
import 'package:flutter_app/Formatting/Colors.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ContentViewer extends StatefulWidget {
  final List<String> imagesURL;

  const ContentViewer({super.key, required this.imagesURL});

  @override
  State<ContentViewer> createState() => _ContentViewerState();
}

class _ContentViewerState extends State<ContentViewer> with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;
  int _currPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: widget.imagesURL.length, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void handlePageViewChange(int idx) {
    setState(() {
      _currPageIndex = idx;
    });
    _tabController.animateTo(idx);
  }

  void onUpdateCurrentPageIndex(int updatedIndex) {
    _pageController.animateToPage(
      updatedIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageController,
          onPageChanged: handlePageViewChange,
          children: widget.imagesURL.map(
              (url) => Center(
                  child: Image(
                    image: NetworkImage(url),
                  )
              )
          ).toList(),
        ),
        PageIndicator(
          tabController: _tabController,
          currPageIndex: _currPageIndex,
          onUpdateCurrentPageIndex: onUpdateCurrentPageIndex,
        ),
      ],
    )
    );
  }
}
