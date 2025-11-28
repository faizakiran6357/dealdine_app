

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class RestaurantDetailScreen extends StatefulWidget {
//   const RestaurantDetailScreen({super.key});

//   @override
//   State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
// }

// class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
//   int _bannerIndex = 0;

//   final List<String> sliderImages = [
//     "assets/onboarding1.png",
//     "assets/onboarding2.png",
//     "assets/onboarding3.png",
//     "assets/onboarding4.png",
//   ];

//   final List<String> categories = [
//     "Burger",
//     "Sandwich",
//     "Pizza",
//     "Fries",
//     "Ice Cream",
//     "Drinks",
//     "Shawarma",
//     "BBQ",
//   ];

//   String selectedCategory = "Burger";

//   final Map<String, List<Map<String, dynamic>>> menuItems = {
//     "Burger": [
//       {
//         "title": "Burger Ferguson",
//         "subtitle": "Spicy Restaurant",
//         "price": 40,
//         "image":
//             "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg"
//       },
//       {
//         "title": "Rockin' Burgers",
//         "subtitle": "Cafecachino",
//         "price": 40,
//         "image":
//             "https://imageproxy.wolt.com/assets/67332ff8555d8d6d801e03fa"
//       },
//       {
//         "title": "Classic Burger",
//         "subtitle": "Tasty Corner",
//         "price": 35,
//         "image":
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM1UIDxaBFo5Vw7UA3BA3EdzguRXRCixsMnw&s"
//       },
//     ],
//     "Sandwich": [
//       {
//         "title": "Club Sandwich",
//         "subtitle": "Fresh Bite",
//         "price": 25,
//         "image": "https://www.cookedbyjulie.com/wp-content/uploads/2025/06/chicken-club-sandwiches-one-500x500.jpg"
//       },
//       {
//         "title": "Cheese Sandwich",
//         "subtitle": "Bread & Co",
//         "price": 18,
//         "image":
//             "https://natashaskitchen.com/wp-content/uploads/2021/08/Grilled-Cheese-Sandwich-SQ.jpg"
//       },
//     ],
//     "Pizza": [
//       {
//         "title": "Pepperoni Pizza",
//         "subtitle": "Italiano",
//         "price": 55,
//         "image": "https://media.istockphoto.com/id/521403691/photo/hot-homemade-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=PaISuuHcJWTEVoDKNnxaHy7L2BTUkyYZ06hYgzXmTbo="
//       },
//       {
//         "title": "Veggie Pizza",
//         "subtitle": "Green Kitchen",
//         "price": 50,
//         "image": "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg"
//       },
//     ],
//     "Fries": [
//       {
//         "title": "Masala Fries",
//         "subtitle": "Snack House",
//         "price": 10,
//         "image":
//             "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg"
//       },
//       {
//         "title": "Cheesy Fries",
//         "subtitle": "Snack House",
//         "price": 12,
//         "image":
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaDV766rczIYACNFde-ZnwBwr2EPqAQUWErA&s"
//       },
//     ],
//     "Ice Cream": [
//       {
//         "title": "Vanilla Delight",
//         "subtitle": "Creamery",
//         "price": 8,
//         "image":
//             "https://images.pexels.com/photos/1352296/pexels-photo-1352296.jpeg"
//       },
//     ],
//     "Drinks": [
//       {
//         "title": "Pepsi Can",
//         "subtitle": "Cold Drink",
//         "price": 3,
//         "image":
//             "https://t3.ftcdn.net/jpg/03/23/86/24/360_F_323862457_5RaEzJNg6yeYx6RjbU4WwkAl3R0yxNQt.jpg"
//       },
//     ],
//     "Shawarma": [
//       {
//         "title": "Arabic Shawarma",
//         "subtitle": "Middle East",
//         "price": 7,
//         "image": "https://images.pexels.com/photos/533325/pexels-photo-533325.jpeg"
//       },
//     ],
//     "BBQ": [
//       {
//         "title": "BBQ Platter",
//         "subtitle": "Desi BBQ",
//         "price": 18,
//         "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ka-uKuCtT9PK9XJkVVHv9Gj6-iFf5ZqmhQ&s"
//       },
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     final items = menuItems[selectedCategory] ?? [];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildSlider(context),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 12),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: _buildTopInfoRow(),
//                     ),
//                     const SizedBox(height: 12),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: const Text(
//                         "Spicy Restaurant",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                           color: Color(0xFF32343E),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: const Text(
//                         "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Color(0xFF6B6E82),
//                           height: 1.5,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 18),
//                     SizedBox(
//                       height: 56,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 16),
//                         child: ListView.separated(
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             final cat = categories[index];
//                             final selected = selectedCategory == cat;
//                             return GestureDetector(
//                               onTap: () => setState(() => selectedCategory = cat),
//                               child: Container(
//                                 margin: const EdgeInsets.only(right: 8),
//                                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color:
//                                       selected ? const Color(0xFFF58D1D) : Colors.white,
//                                   borderRadius: BorderRadius.circular(30),
//                                   border: Border.all(
//                                     color: selected
//                                         ? const Color(0xFFF58D1D)
//                                         : const Color(0xFFE9E9E9),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   cat,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
//                                     color: selected ? Colors.white : const Color(0xFF32343E),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           separatorBuilder: (_, __) => const SizedBox(width: 6),
//                           itemCount: categories.length,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 18),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         "$selectedCategory (${items.length})",
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFF32343E),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     // Adjusted horizontal list to wrap content dynamically
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: SizedBox(
//                         height: 250, // Slightly increased to avoid overflow
//                         child: ListView.separated(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: items.length,
//                           separatorBuilder: (_, __) => const SizedBox(width: 14),
//                           itemBuilder: (_, i) => _buildFoodCard(items[i]),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSlider(BuildContext context) {
//     return SizedBox(
//       height: 320,
//       child: Stack(
//         children: [
//           CarouselSlider(
//   items: sliderImages
//       .map((img) => Image.asset(
//             img,
//             fit: BoxFit.cover,
//             width: double.infinity,
//           ))
//       .toList(),
//   options: CarouselOptions(
//     height: 320,
//     viewportFraction: 1,
//     autoPlay: true,
//     autoPlayInterval: const Duration(seconds: 3),
//     onPageChanged: (index, reason) {
//       setState(() => _bannerIndex = index);
//     },
//   ),
// ),

//           Positioned(
//             top: 20,
//             left: 16,
//             child: Container(
//               width: 44,
//               height: 44,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
//               ),
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios_new, size: 18),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 20,
//             right: 16,
//             child: Container(
//               width: 44,
//               height: 44,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
//               ),
//               child: IconButton(
//                 icon: const Icon(Icons.more_horiz, color: Colors.black87),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 18,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(sliderImages.length, (i) {
//                 return Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                   width: _bannerIndex == i ? 14 : 8,
//                   height: 8,
//                   decoration: BoxDecoration(
//                     color: _bannerIndex == i ? Colors.white : Colors.white.withOpacity(0.5),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildTopInfoRow() {
//   return Row(
//     children: [
//       _smallIconBlock(Icons.star, "4.7", isBold: true),
//       const SizedBox(width: 28),
//       _smallIconBlock(Icons.delivery_dining, "Free", isBold: false),
//       const SizedBox(width: 28),
//       _smallIconBlock(Icons.access_time, "20 min", isBold: false),
//     ],
//   );
// }

// Widget _smallIconBlock(IconData icon, String text, {required bool isBold}) {
//   return Row(
//     children: [
//       Icon(icon, size: 18, color: const Color(0xFFF58D1D)),
//       const SizedBox(width: 8),
//       Text(
//         text,
//         style: TextStyle(
//           fontSize: 13,
//           color: const Color(0xFF32343E),
//           fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
//         ),
//       ),
//     ],
//   );
// }


//   Widget _buildFoodCard(Map<String, dynamic> item) {
//     return Container(
//       width: 170,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0,4))],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 92,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.grey[200],
//                 image: DecorationImage(
//                   image: NetworkImage(item['image']),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               item['title'],
//               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF32343E)),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               item['subtitle'],
//               style: const TextStyle(fontSize: 12, color: Color(0xFF6B6E82)),
//             ),
//             const Spacer(),
//             Row(
//               children: [
//                 Text(
//                   "\$${item['price']}",
//                   style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//                 const Spacer(),
//                 Container(
//                   width: 34,
//                   height: 34,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFF58D1D),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.add, color: Colors.white, size: 20),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class RestaurantDetailScreen extends StatefulWidget {
//   const RestaurantDetailScreen({super.key});

//   @override
//   State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
// }

// class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
//   int _bannerIndex = 0;
//   final ScrollController _scrollController = ScrollController();

//   final List<String> sliderImages = [
//     "assets/onboarding1.png",
//     "assets/onboarding2.png",
//     "assets/onboarding3.png",
//     "assets/onboarding4.png",
//   ];

//   final List<String> categories = [
//     "Burger",
//     "Sandwich",
//     "Pizza",
//     "Fries",
//     "Ice Cream",
//     "Drinks",
//     "Shawarma",
//     "BBQ",
//   ];

//   String selectedCategory = "Burger";

//   final Map<String, List<Map<String, dynamic>>> menuItems = {
//     "Burger": [
//       {
//         "title": "Burger Ferguson",
//         "subtitle": "Spicy Restaurant",
//         "price": 40,
//         "image":
//             "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg"
//       },
//       {
//         "title": "Rockin' Burgers",
//         "subtitle": "Cafecachino",
//         "price": 40,
//         "image":
//             "https://imageproxy.wolt.com/assets/67332ff8555d8d6d801e03fa"
//       },
//       {
//         "title": "Classic Burger",
//         "subtitle": "Tasty Corner",
//         "price": 35,
//         "image":
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM1UIDxaBFo5Vw7UA3BA3EdzguRXRCixsMnw&s"
//       },
//     ],
//     "Sandwich": [
//       {
//         "title": "Club Sandwich",
//         "subtitle": "Fresh Bite",
//         "price": 25,
//         "image": "https://www.cookedbyjulie.com/wp-content/uploads/2025/06/chicken-club-sandwiches-one-500x500.jpg"
//       },
//       {
//         "title": "Cheese Sandwich",
//         "subtitle": "Bread & Co",
//         "price": 18,
//         "image":
//             "https://natashaskitchen.com/wp-content/uploads/2021/08/Grilled-Cheese-Sandwich-SQ.jpg"
//       },
//     ],
//     "Pizza": [
//       {
//         "title": "Pepperoni Pizza",
//         "subtitle": "Italiano",
//         "price": 55,
//         "image": "https://media.istockphoto.com/id/521403691/photo/hot-homemade-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=PaISuuHcJWTEVoDKNnxaHy7L2BTUkyYZ06hYgzXmTbo="
//       },
//       {
//         "title": "Veggie Pizza",
//         "subtitle": "Green Kitchen",
//         "price": 50,
//         "image": "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg"
//       },
//     ],
//     "Fries": [
//       {
//         "title": "Masala Fries",
//         "subtitle": "Snack House",
//         "price": 10,
//         "image":
//             "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg"
//       },
//       {
//         "title": "Cheesy Fries",
//         "subtitle": "Snack House",
//         "price": 12,
//         "image":
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaDV766rczIYACNFde-ZnwBwr2EPqAQUWErA&s"
//       },
//     ],
//     "Ice Cream": [
//       {
//         "title": "Vanilla Delight",
//         "subtitle": "Creamery",
//         "price": 8,
//         "image":
//             "https://images.pexels.com/photos/1352296/pexels-photo-1352296.jpeg"
//       },
//     ],
//     "Drinks": [
//       {
//         "title": "Pepsi Can",
//         "subtitle": "Cold Drink",
//         "price": 3,
//         "image":
//             "https://t3.ftcdn.net/jpg/03/23/86/24/360_F_323862457_5RaEzJNg6yeYx6RjbU4WwkAl3R0yxNQt.jpg"
//       },
//     ],
//     "Shawarma": [
//       {
//         "title": "Arabic Shawarma",
//         "subtitle": "Middle East",
//         "price": 7,
//         "image": "https://images.pexels.com/photos/533325/pexels-photo-533325.jpeg"
//       },
//     ],
//     "BBQ": [
//       {
//         "title": "BBQ Platter",
//         "subtitle": "Desi BBQ",
//         "price": 18,
//         "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ka-uKuCtT9PK9XJkVVHv9Gj6-iFf5ZqmhQ&s"
//       },
//     ],
//   };

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final items = menuItems[selectedCategory] ?? [];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: CustomScrollView(
//           controller: _scrollController,
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 320,
//               floating: false,
//               pinned: true,
//               backgroundColor: Colors.white,
//               elevation: 0,
//               leading: Container(
//                 margin: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                   boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
//                 ),
//                 child: IconButton(
//                   icon: const Icon(Icons.arrow_back_ios_new, size: 18),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ),
//               actions: [
//                 Container(
//                   margin: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
//                   ),
//                   child: IconButton(
//                     icon: const Icon(Icons.more_horiz, color: Colors.black87),
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//               flexibleSpace: LayoutBuilder(
//                 builder: (context, constraints) {
//                   final shrinkOffset = constraints.maxHeight;
//                   final expandedHeight = 500.0;
//                   final collapsedHeight = kToolbarHeight;
//                   final shrinkPercentage = ((expandedHeight - shrinkOffset) / (expandedHeight - collapsedHeight)).clamp(0.0, 1.0);
                  
//                   final showAvatar = shrinkPercentage > 0.3;
//                   final carouselOpacity = (1 - shrinkPercentage * 1.5).clamp(0.0, 1.0);
                  
//                   return FlexibleSpaceBar(
//                     centerTitle: false,
//                     titlePadding: EdgeInsets.only(
//                       left: showAvatar ? 11 : 20,
//                       // larger bottom padding when avatar is visible so it sits
//                       // higher, just under the back button row
//                       bottom: showAvatar ? 22 : 15,
//                     ),
//                     title: showAvatar
//                         ? Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Container(
//                                 width: 60,
//                                 height: 70,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   image: DecorationImage(
//                                     image: AssetImage(sliderImages[_bannerIndex]),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               const Expanded(
//                                 child: Text(
//                                   "Spicy Restaurant",
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w700,
//                                     color: Color(0xFF32343E),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         : null,
//                     background: Stack(
//                       children: [
//                         Positioned.fill(
//                           child: Opacity(
//                             opacity: carouselOpacity,
//                             child: CarouselSlider(
//                               items: sliderImages
//                                   .map((img) => Image.asset(
//                                         img,
//                                         fit: BoxFit.cover,
//                                         width: double.infinity,
//                                       ))
//                                   .toList(),
//                               options: CarouselOptions(
//                                 height: 320,
//                                 viewportFraction: 1,
//                                 autoPlay: carouselOpacity > 0.5,
//                                 autoPlayInterval: const Duration(seconds: 3),
//                                 onPageChanged: (index, reason) {
//                                   setState(() => _bannerIndex = index);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 18,
//                           left: 0,
//                           right: 0,
//                           child: Opacity(
//                             opacity: carouselOpacity,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: List.generate(sliderImages.length, (i) {
//                                 return Container(
//                                   margin: const EdgeInsets.symmetric(horizontal: 4),
//                                   width: _bannerIndex == i ? 14 : 8,
//                                   height: 8,
//                                   decoration: BoxDecoration(
//                                     color: _bannerIndex == i ? Colors.white : Colors.white.withOpacity(0.5),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 );
//                               }),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: _buildTopInfoRow(),
//                   ),
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: const Text(
//                       "Spicy Restaurant",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF32343E),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: const Text(
//                       "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Color(0xFF6B6E82),
//                         height: 1.5,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 18),
//                   SizedBox(
//                     height: 56,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 16),
//                       child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (context, index) {
//                           final cat = categories[index];
//                           final selected = selectedCategory == cat;
//                           return GestureDetector(
//                             onTap: () => setState(() => selectedCategory = cat),
//                             child: Container(
//                               margin: const EdgeInsets.only(right: 8),
//                               padding: const EdgeInsets.symmetric(horizontal: 16),
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 color:
//                                     selected ? const Color(0xFFF58D1D) : Colors.white,
//                                 borderRadius: BorderRadius.circular(30),
//                                 border: Border.all(
//                                   color: selected
//                                       ? const Color(0xFFF58D1D)
//                                       : const Color(0xFFE9E9E9),
//                                 ),
//                               ),
//                               child: Text(
//                                 cat,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
//                                   color: selected ? Colors.white : const Color(0xFF32343E),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (_, __) => const SizedBox(width: 6),
//                         itemCount: categories.length,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 18),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Text(
//                       "$selectedCategory (${items.length})",
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xFF32343E),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: SizedBox(
//                       height: 250,
//                       child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: items.length,
//                         separatorBuilder: (_, __) => const SizedBox(width: 14),
//                         itemBuilder: (_, i) => _buildFoodCard(items[i]),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTopInfoRow() {
//   return Row(
//     children: [
//       _smallIconBlock(Icons.star, "4.7", isBold: true),
//       const SizedBox(width: 28),
//       _smallIconBlock(Icons.delivery_dining, "Free", isBold: false),
//       const SizedBox(width: 28),
//       _smallIconBlock(Icons.access_time, "20 min", isBold: false),
//     ],
//   );
// }

// Widget _smallIconBlock(IconData icon, String text, {required bool isBold}) {
//   return Row(
//     children: [
//       Icon(icon, size: 18, color: const Color(0xFFF58D1D)),
//       const SizedBox(width: 8),
//       Text(
//         text,
//         style: TextStyle(
//           fontSize: 13,
//           color: const Color(0xFF32343E),
//           fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
//         ),
//       ),
//     ],
//   );
// }


//   Widget _buildFoodCard(Map<String, dynamic> item) {
//     return Container(
//       width: 170,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0,4))],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 92,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.grey[200],
//                 image: DecorationImage(
//                   image: NetworkImage(item['image']),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               item['title'],
//               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF32343E)),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               item['subtitle'],
//               style: const TextStyle(fontSize: 12, color: Color(0xFF6B6E82)),
//             ),
//             const Spacer(),
//             Row(
//               children: [
//                 Text(
//                   "\$${item['price']}",
//                   style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
//                 ),
//                 const Spacer(),
//                 Container(
//                   width: 34,
//                   height: 34,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFF58D1D),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.add, color: Colors.white, size: 20),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({super.key});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  int _bannerIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final List<String> sliderImages = [
    "assets/onboarding1.png",
    "assets/onboarding2.png",
    "assets/onboarding3.png",
    "assets/onboarding4.png",
  ];

  final List<String> categories = [
    "Burger",
    "Sandwich",
    "Pizza",
    "Fries",
    "Ice Cream",
    "Drinks",
    "Shawarma",
    "BBQ",
  ];

  String selectedCategory = "Burger";

  final Map<String, List<Map<String, dynamic>>> menuItems = {
    "Burger": [
      {
        "title": "Burger Ferguson",
        "subtitle": "Spicy Restaurant",
        "price": 40,
        "image":
            "https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg"
      },
      {
        "title": "Rockin' Burgers",
        "subtitle": "Cafecachino",
        "price": 40,
        "image":
            "https://imageproxy.wolt.com/assets/67332ff8555d8d6d801e03fa"
      },
      {
        "title": "Classic Burger",
        "subtitle": "Tasty Corner",
        "price": 35,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRM1UIDxaBFo5Vw7UA3BA3EdzguRXRCixsMnw&s"
      },
    ],
    "Sandwich": [
      {
        "title": "Club Sandwich",
        "subtitle": "Fresh Bite",
        "price": 25,
        "image": "https://www.cookedbyjulie.com/wp-content/uploads/2025/06/chicken-club-sandwiches-one-500x500.jpg"
      },
      {
        "title": "Cheese Sandwich",
        "subtitle": "Bread & Co",
        "price": 18,
        "image":
            "https://natashaskitchen.com/wp-content/uploads/2021/08/Grilled-Cheese-Sandwich-SQ.jpg"
      },
    ],
    "Pizza": [
      {
        "title": "Pepperoni Pizza",
        "subtitle": "Italiano",
        "price": 55,
        "image": "https://media.istockphoto.com/id/521403691/photo/hot-homemade-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=PaISuuHcJWTEVoDKNnxaHy7L2BTUkyYZ06hYgzXmTbo="
      },
      {
        "title": "Veggie Pizza",
        "subtitle": "Green Kitchen",
        "price": 50,
        "image": "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg"
      },
    ],
    "Fries": [
      {
        "title": "Masala Fries",
        "subtitle": "Snack House",
        "price": 10,
        "image":
            "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg"
      },
      {
        "title": "Cheesy Fries",
        "subtitle": "Snack House",
        "price": 12,
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaDV766rczIYACNFde-ZnwBwr2EPqAQUWErA&s"
      },
    ],
    "Ice Cream": [
      {
        "title": "Vanilla Delight",
        "subtitle": "Creamery",
        "price": 8,
        "image":
            "https://images.pexels.com/photos/1352296/pexels-photo-1352296.jpeg"
      },
    ],
    "Drinks": [
      {
        "title": "Pepsi Can",
        "subtitle": "Cold Drink",
        "price": 3,
        "image":
            "https://t3.ftcdn.net/jpg/03/23/86/24/360_F_323862457_5RaEzJNg6yeYx6RjbU4WwkAl3R0yxNQt.jpg"
      },
    ],
    "Shawarma": [
      {
        "title": "Arabic Shawarma",
        "subtitle": "Middle East",
        "price": 7,
        "image": "https://images.pexels.com/photos/533325/pexels-photo-533325.jpeg"
      },
    ],
    "BBQ": [
      {
        "title": "BBQ Platter",
        "subtitle": "Desi BBQ",
        "price": 18,
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6ka-uKuCtT9PK9XJkVVHv9Gj6-iFf5ZqmhQ&s"
      },
    ],
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = menuItems[selectedCategory] ?? [];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 320,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.black87),
                    onPressed: () {},
                  ),
                ),
              ],
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  final shrinkOffset = constraints.maxHeight;
                  final expandedHeight = 320.0;
                  final collapsedHeight = kToolbarHeight;
                  final shrinkPercentage = ((expandedHeight - shrinkOffset) / (expandedHeight - collapsedHeight)).clamp(0.0, 1.0);
                  
                  final showAvatar = shrinkPercentage > 0.3;
                  final carouselOpacity = (1 - shrinkPercentage * 1.5).clamp(0.0, 1.0);
                  
                  return FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: EdgeInsets.only(
                      left: showAvatar ? 16 : 20,
                      bottom: showAvatar ? 8 : 16,
                    ),
                    title: showAvatar
                        ? Row(
                            children: [
                              Container(
                                width: 60,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(sliderImages[_bannerIndex]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Spicy Restaurant",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF32343E),
                                ),
                              ),
                            ],
                          )
                        : null,
                    background: Stack(
                      children: [
                        Positioned.fill(
                          child: Opacity(
                            opacity: carouselOpacity,
                            child: CarouselSlider(
                              items: sliderImages
                                  .map((img) => Image.asset(
                                        img,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                height: 320,
                                viewportFraction: 1,
                                autoPlay: carouselOpacity > 0.5,
                                autoPlayInterval: const Duration(seconds: 3),
                                onPageChanged: (index, reason) {
                                  setState(() => _bannerIndex = index);
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          left: 0,
                          right: 0,
                          child: Opacity(
                            opacity: carouselOpacity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(sliderImages.length, (i) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  width: _bannerIndex == i ? 14 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: _bannerIndex == i ? Colors.white : Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTopInfoRow(),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Spicy Restaurant",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF32343E),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B6E82),
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 56,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final cat = categories[index];
                          final selected = selectedCategory == cat;
                          return GestureDetector(
                            onTap: () => setState(() => selectedCategory = cat),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:
                                    selected ? const Color(0xFFF58D1D) : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: selected
                                      ? const Color(0xFFF58D1D)
                                      : const Color(0xFFE9E9E9),
                                ),
                              ),
                              child: Text(
                                cat,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                                  color: selected ? Colors.white : const Color(0xFF32343E),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(width: 6),
                        itemCount: categories.length,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "$selectedCategory (${items.length})",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF32343E),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 250,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 14),
                        itemBuilder: (_, i) => _buildFoodCard(items[i]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopInfoRow() {
  return Row(
    children: [
      _smallIconBlock(Icons.star, "4.7", isBold: true),
      const SizedBox(width: 28),
      _smallIconBlock(Icons.delivery_dining, "Free", isBold: false),
      const SizedBox(width: 28),
      _smallIconBlock(Icons.access_time, "20 min", isBold: false),
    ],
  );
}

Widget _smallIconBlock(IconData icon, String text, {required bool isBold}) {
  return Row(
    children: [
      Icon(icon, size: 18, color: const Color(0xFFF58D1D)),
      const SizedBox(width: 8),
      Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: const Color(0xFF32343E),
          fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    ],
  );
}


  Widget _buildFoodCard(Map<String, dynamic> item) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0,4))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: NetworkImage(item['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item['title'],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF32343E)),
            ),
            const SizedBox(height: 4),
            Text(
              item['subtitle'],
              style: const TextStyle(fontSize: 12, color: Color(0xFF6B6E82)),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  "\$${item['price']}",
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF58D1D),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}