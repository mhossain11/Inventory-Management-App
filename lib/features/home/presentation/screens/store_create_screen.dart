import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventoryapp/features/home/presentation/controller/home_controller.dart';
import 'package:inventoryapp/share/custom_textField.dart';

import '../widgets/image_show.dart';

class StoreCreateScreen extends StatefulWidget {
  const StoreCreateScreen({super.key});

  static String path = '/userStoreCreate';

  @override
  State<StoreCreateScreen> createState() => _StoreCreateScreenState();
}

class _StoreCreateScreenState extends State<StoreCreateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  HomeController homeController = Get.find<HomeController>();
  File? selectedImageFile;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Store'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              controller: nameController,
              label: 'Name',
              hintText: 'Name',
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              controller: descriptionController,
              label: 'Description',
              hintText: 'Description',
              maxLines: 3,
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              controller: addressController,
              label: 'Address',
              hintText: 'Address',
            ),
          ),
          Gap(10),/*
          ImageShow(
            onImageSelected: (File? value) {
              selectedImageFile = value;
            },),*/
          Gap(30),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
                onPressed: () {
                homeController.storeCreate(
                    name: nameController.text,
                    description: descriptionController.text,
                    address: addressController.text,
                    image: selectedImageFile!.path.toString());
                },
                child: Text('Confirm',style: TextStyle(color: Colors.white),)),
          ),
        ],
      ),
    );
  }
}
