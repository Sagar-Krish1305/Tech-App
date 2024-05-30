import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PageIndicator extends StatelessWidget {
  final int currPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currPageIndex,
    required this.onUpdateCurrentPageIndex
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IconButton(
            //     onPressed: (){
            //       print('Pressed');
            //     },
            //     icon: Icon(
            //         Icons.arrow_left_rounded,
            //         size: 40,
            //     )
            // ),

            // Adding the Dots. This is called Tab Page Selector
            TabPageSelector(
              controller: tabController,
              color: Theme.of(context).primaryColor,
              selectedColor: Theme.of(context).canvasColor,
            ),
            // IconButton(
            //     onPressed: (){
            //       print('Pressed');
            //     },
            //     icon: Icon(
            //       Icons.arrow_right_rounded,
            //       size: 40,
            //     )
            // ),
          ],
        ),
    );
  }
}
