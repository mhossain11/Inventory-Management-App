import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageShow extends StatefulWidget {
  const ImageShow({super.key});

  @override
  State<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  dynamic selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        selectedImage == null ?SizedBox():
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: DecorationImage(
                          fit: BoxFit.cover,image: FileImage(selectedImage))
                  ),
                ),

                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(onPressed: (){
                    setState(() {
                      selectedImage = null;
                    });
                  },
                      icon: Icon(Icons.clear),
                    color: Colors.grey, ),)
              ],
            ),
          ],
        ),

        SizedBox(
          width: 150,
          child: ElevatedButton(
              onPressed: imagePicker,
              child: Text('Pick Image')),
        )
      ],


    );
  }

  void imagePicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File pickFile = File(pickedImage.path);
      setState(() {
        selectedImage = pickFile;
      });
    } else {
      print('No image selected');
    }
  }

}
