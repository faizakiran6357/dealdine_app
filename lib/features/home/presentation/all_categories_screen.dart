// import 'package:flutter/material.dart';

// class AllCategoriesScreen extends StatelessWidget {
//   AllCategoriesScreen({super.key});

//   final List<Map<String, String>> categories = [
//     {"name": "All", "image": "assets/xxx.png"},
//     {"name": "Hot Dog", "image": "assets/yyy.png"},
//     {"name": "Burger", "image": "assets/zzz.png"},
//     {"name": "Pizza", "image": "assets/pizza.png"},
//     {"name": "Fries", "image": "assets/fries.png"},
//     {"name": "Drinks", "image": "assets/cock.png"},
//     {"name": "Sandwich", "image": "https://www.cookedbyjulie.com/wp-content/uploads/2025/06/chicken-club-sandwiches-one-500x500.jpg"},
//     {"name": "Ice Cream", "image": "https://images.pexels.com/photos/1352296/pexels-photo-1352296.jpeg"},
//     {"name": "BBQ Plater", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ka-uKuCtT9PK9XJkVVHv9Gj6-iFf5ZqmhQ&s"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("All Categories"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         foregroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.builder(
//           itemCount: categories.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,        // 👉 2 per row
//             mainAxisSpacing: 12,
//             crossAxisSpacing: 12,
//             childAspectRatio: 1,
//           ),
//           itemBuilder: (context, index) {
//             final item = categories[index];
//             final isAsset = item["image"]!.startsWith("assets");

//             return Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 5,
//                     color: Colors.black.withOpacity(0.05),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   isAsset
//                       ? Image.asset(
//                           item["image"]!,
//                           width: 65,
//                           height: 65,
//                         )
//                       : Image.network(
//                           item["image"]!,
//                           width: 65,
//                           height: 65,
//                         ),
//                   const SizedBox(height: 8),
//                   Text(
//                     item["name"]!,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AllCategoriesScreen extends StatelessWidget {
  AllCategoriesScreen({super.key});

  final List<Map<String, String>> categories = [
    {"name": "All", "image": "assets/xxx.png"},
    {"name": "Hot Dog", "image": "assets/yyy.png"},
    {"name": "Burger", "image": "assets/zzz.png"},
    {"name": "Pizza", "image": "assets/pizza.png"},
    {"name": "Fries", "image": "assets/fries.png"},
    {"name": "Drinks", "image": "assets/cock.png"},
    {
      "name": "Sandwich",
      "image":
          "https://www.cookedbyjulie.com/wp-content/uploads/2025/06/chicken-club-sandwiches-one-500x500.jpg"
    },
      {
      "name": "Pepproni Pizza",
      "image":
          "https://media.istockphoto.com/id/521403691/photo/hot-homemade-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=PaISuuHcJWTEVoDKNnxaHy7L2BTUkyYZ06hYgzXmTbo="
    },
    {
      "name": "Ice Cream",
      "image": "https://images.pexels.com/photos/1352296/pexels-photo-1352296.jpeg"
    },
    {
      "name": "BBQ Plater",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ka-uKuCtT9PK9XJkVVHv9Gj6-iFf5ZqmhQ&s"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = categories[index];
            final img = item["image"]!;
            final isAsset = img.startsWith("assets");

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // -----------------------------
                  // CIRCULAR IMAGE FOR ALL TYPES
                  // -----------------------------
                  ClipOval(
                    child: isAsset
                        ? Image.asset(
                            img,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            img,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              width: 70,
                              height: 70,
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.image_not_supported),
                            ),
                          ),
                  ),

                  const SizedBox(height: 10),

                  // -----------------------------
                  // CATEGORY NAME
                  // -----------------------------
                  Text(
                    item["name"]!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
