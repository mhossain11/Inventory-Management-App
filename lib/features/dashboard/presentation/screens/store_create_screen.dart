import 'package:flutter/material.dart';

class StoreCreateScreen extends StatefulWidget {
  const StoreCreateScreen({super.key});

  @override
  State<StoreCreateScreen> createState() => _StoreCreateScreenState();
}

class _StoreCreateScreenState extends State<StoreCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StoreCreateScreen'),),
      body: Text('StoreCreateScreen'),
    );
  }
}
