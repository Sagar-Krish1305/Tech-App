import 'package:flutter/material.dart';
import 'package:flutter_app/Component/ContentViewer/PostComponent.dart';
import '../../Formatting/Colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currPage = 0;
  final widgetList = [
    ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index){
        return PostComponent(
            username: "kri.shhhhh",
            avatarUrl: "https://picsum.photos/600/400",
            content: "One common code problem that developers often encounter is the off-by-one error, particularly in scenarios involving loops and array indexing. This issue arises when the loop iterates one time too many or one time too few, leading to unexpected behavior. For instance, consider a situation where you need to iterate through an array of integers to calculate the sum of its elements. If the array has n elements and the loop runs from 0 to n, instead of 0 to n-1, an off-by-one error occurs, potentially causing an array index out of bounds exception. This mistake is subtle yet prevalent because it typically stems from incorrect loop boundaries or misunderstanding the zero-based indexing system common in many programming languages. Resolving such errors requires careful attention to loop conditions and thorough testing, ensuring that each iteration correctly accesses the intended elements of the array.",
            images: const ['https://picsum.photos/600/600', 'https://picsum.photos/700/600'],
            likes: 1,
            comments: 1);
      },
    ),

    Placeholder(),

    Placeholder(),

    Placeholder(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tech Solver', style: TextStyle(
            color: CustomTheme.appBarTextColor,
            fontFamily: 'DancingScript',
            fontSize: 30,
          ),),
           backgroundColor: CustomTheme.appBarBackgroundColor,
           // You can define colors in the ThemeData
          // and then use them any where. another solution is to make a new file for storing
          // variables for different color
        ),
        backgroundColor: CustomTheme.appBodyColor,
        body: widgetList[_currPage],
        bottomNavigationBar: BottomAppBar(
          color: CustomTheme.appBarBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: CustomTheme.appBarTextColor,),
                onPressed: () {
                  setState(() {
                    _currPage = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.search, color: CustomTheme.appBarTextColor,),
                onPressed: (){
                  setState(() {
                    _currPage = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: CustomTheme.appBarTextColor,),
                onPressed: (){
                  setState(() {
                    _currPage = 2;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: CustomTheme.appBarTextColor,),
                onPressed: (){
                  setState(() {
                    _currPage = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
