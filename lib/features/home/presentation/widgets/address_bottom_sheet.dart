/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarkBottomSheet extends StatefulWidget {



  const BookmarkBottomSheet({
    super.key,
  });

  @override
  State<BookmarkBottomSheet> createState() => _BookmarkBottomSheetState();
}

class _BookmarkBottomSheetState extends State<BookmarkBottomSheet> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [],
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';

class ShippingAddAddressBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // --- Header ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Businesses (1-5)",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // --- Existing Address (Sample Card) ---
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(Icons.location_on, color: Colors.blue),
                    title: Text("বাসাবো (Office)"),
                    subtitle: Text("35/1, বাসাবো, ঢাকা, বাংলাদেশ\nFaysal - 8801687477579"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.grey),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                Divider(),


                // --- Save Button ---
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // save new address
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue), ),
                    child: Text("+ New Business",
                      style: TextStyle(color: Colors.white,
                          fontSize: 17),),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
