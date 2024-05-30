import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/Formatting/Colors.dart';
import 'package:image_picker/image_picker.dart';

class ResolverPage extends StatefulWidget {
  const ResolverPage({super.key});

  @override
  State<ResolverPage> createState() => _ResolverPageState();
}

class _ResolverPageState extends State<ResolverPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<XFile> _selectedImages = [];
  final ImagePicker imagePicker = ImagePicker();

  Future<void> _addImage() async {
    try {
      final XFile? imagePicked = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (imagePicked != null) {
        setState(() {
          _selectedImages.add(imagePicked);
        });
      } else {
        print("No Image Selected");
      }
    } catch (e) {
      print("Image Picker Error: $e");
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.appBodyColor,
      ),
      backgroundColor: CustomTheme.appBodyColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: CustomTheme.appBodyColor,
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _textEditingController,
                  style: const TextStyle(
                    color: CustomTheme.appBarTextColor,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Add Your Solution',
                    hintStyle: TextStyle(
                      color: CustomTheme.appBarTextColor.withOpacity(0.5),
                    ),
                  ),
                  maxLines: null,
                  expands: true,
                ),
              ),
            ),
            if (_selectedImages.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // spacing: 8.0,
                  // runSpacing: 8.0,
                  children: List.generate(_selectedImages.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Stack(
                        children: [
                          Container(
                            width: 125,
                            height: 125,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: FileImage(File(_selectedImages[index].path)),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -4,
                            right: -4,
                            child: InkWell(
                              onTap: () => _removeImage(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
            
                        ],
                      ),
                    );
                  }),
                ),
              ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                        Icons.image,
                        color: CustomTheme.appBarTextColor,
                    ),
                    onPressed: _addImage,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add post button functionality here
                    },
                    child: Text('Post'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: CustomTheme.appBarTextColor,
                      backgroundColor: CustomTheme.appBarBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
