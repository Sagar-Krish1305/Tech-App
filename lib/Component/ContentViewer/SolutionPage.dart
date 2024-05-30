import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Component/ContentViewer/ContentViewer.dart';
import 'package:flutter_app/Component/DescriptionComponent/DescriptionComponent.dart';
import 'package:flutter_app/Formatting/Colors.dart';

class SolutionPage extends StatefulWidget {
  const SolutionPage({Key? key}) : super(key: key);

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.appBodyColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: CustomTheme.appBarTextColor,
        ),
        title: const Text(
          'Solution Page',
          style: TextStyle(color: CustomTheme.appBarTextColor),
        ),
        backgroundColor: CustomTheme.appBarBackgroundColor,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
              color: CustomTheme.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Username',
                  style: TextStyle(color: CustomTheme.postTextColor),),
                  const Text('23-13-2022'),
                  Row(
                    children: [
                      const Text('0',
                    style: TextStyle(color: CustomTheme.postTextColor),
                      ),
                      IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(
                              Icons.arrow_upward,
                            color: CustomTheme.postTextColor,
                          )
                      )
                    ],
                  )
                ],
              ),
              leading: const CircleAvatar(radius: 20),
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DescriptionComponent(
                        description: 'ejbfwbcqoijqbelfqbelfbqlwdqqebfoqibwfoqibwdoiqbwldibqwqefbqowibdfoqiwbdqpiwbdsbdcoqibeofwbeofbweofibwoiefbwoiebfoqwlbsdlqbeflejbfwbcqoijqbelfqbelfbqlwdqqebfoqibwfoqibwdoiqbwldibqwqefbqowibdfoqiwbdqpiwbd',
                        offsetLength: 200,
                      ),
                      const SizedBox(height: 10),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.4,
                        ),
                        child: const ContentViewer(
                            imagesURL: ['https://picsum.photos/600/600', 'https://picsum.photos/600/600']
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
