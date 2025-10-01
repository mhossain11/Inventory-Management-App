import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inventoryapp/share/custom_textField.dart';

class StoreCreateScreen extends StatefulWidget {
  const StoreCreateScreen({super.key});
  static String path ='/userStoreCreate';

  @override
  State<StoreCreateScreen> createState() => _StoreCreateScreenState();
}

class _StoreCreateScreenState extends State<StoreCreateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
      appBar: AppBar(
        title: const Text('Create Store'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              controller: nameController,
              label: 'Name',
            hintText: 'Name',),
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
            hintText: 'Address',),
          ),
          
          ElevatedButton(onPressed: (){}, child: Text('Confirm'))
        ],
      )
    );
  }



}
