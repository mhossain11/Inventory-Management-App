import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/address_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: (){
            setState(() {

              print('CLICK BUTTON');
              ShippingAddAddressBottomSheet.show(context);
            });
          },
          child: Card(
            elevation: 5,
            child: AnimatedScale(
              scale: 1.0,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text('Faysal Hossain Store',style: TextStyle(fontSize: 16),),
                      Gap(10),
                      Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                ),

              ),
            ),
          ),
        ),
      ),
      body: Text('HomeScreen'),
    );
  }
}
