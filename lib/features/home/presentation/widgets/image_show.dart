import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageShow extends StatefulWidget {
  const ImageShow({super.key, required this.onImageSelected});
  final ValueChanged<File?> onImageSelected;

  @override
  State<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Show selected image if not null
        if (selectedImage != null)
          Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(selectedImage!),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      selectedImage = null;
                    });
                    widget.onImageSelected(selectedImage);
                  },
                  icon: const Icon(Icons.clear),
                  color: Colors.black54,
                ),
              ),
            ],
          ),

        // Pick image button
        SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: imagePicker,
            child: const Text('Pick Image'),
          ),
        ),
      ],
    );
  }

  // Pick image from gallery
  Future<void> imagePicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    } else {
      debugPrint('No image selected');
    }
  }
}
