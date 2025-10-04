import 'package:flutter/material.dart';
import 'package:inventoryapp/features/home/domain/models/store_model.dart';

class ShippingAddAddressBottomSheet extends StatelessWidget {
  final List<StoreModel> businesses;

  const ShippingAddAddressBottomSheet({
    super.key,
    required this.businesses,
  });

  /// static method to show
  static void show(BuildContext context, List<StoreModel> businesses) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ShippingAddAddressBottomSheet(businesses: businesses);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  "Businesses (${businesses.length})",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // --- Dynamic list of businesses ---
            ...businesses.map((biz) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: biz.logo != null && biz.logo!.isNotEmpty
                      ? CircleAvatar(
                    backgroundImage: NetworkImage(biz.logo!),
                    radius: 24,
                  )
                      : const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.store, color: Colors.white),
                  ),
                  title: Center(
                    child: Text(
                      biz.name ?? "Unnamed Store",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "${biz.description ?? ''}\n${biz.address ?? ''}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.grey),
                        onPressed: () {
                          // edit business
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // delete business
                        },
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

            const SizedBox(height: 16),
            const Divider(),

            // --- Add Button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // add new business
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(
                  "+ New Business",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
