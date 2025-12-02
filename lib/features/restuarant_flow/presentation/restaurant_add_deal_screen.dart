// import 'package:flutter/material.dart';

// class RestaurantAddDealScreen extends StatelessWidget {
//   const RestaurantAddDealScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Add Deal")),
//       body: const Center(child: Text("Add Deal Screen")),
//     );
//   }
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class RestaurantAddDealScreen extends StatefulWidget {
//   const RestaurantAddDealScreen({super.key});

//   @override
//   State<RestaurantAddDealScreen> createState() => _AddDealScreenState();
// }

// class _AddDealScreenState extends State<RestaurantAddDealScreen> {
//   final TextEditingController dealNameController = TextEditingController();
//   final TextEditingController dealPriceController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   DateTime? startDate;
//   DateTime? endDate;

//   Future<void> pickDate({required bool isStart}) async {
//     final picked = await showDatePicker(
//       context: context,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2035),
//       initialDate: DateTime.now(),
//     );

//     if (picked != null) {
//       setState(() {
//         if (isStart) {
//           startDate = picked;
//         } else {
//           endDate = picked;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isWeb = MediaQuery.of(context).size.width > 1000;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F8FA),
//       body: Row(
//         children: [
//           // LEFT SIDEBAR
//           LeftSidebar(width: isWeb ? 250 : 70, showLabels: isWeb),

//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const TopNavBar(isWeb: true),
//                   const SizedBox(height: 25),

//                   const Text(
//                     "Add Deal",
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   Expanded(
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(22),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(14),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 6,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: LayoutBuilder(
//                         builder: (context, constraints) {
//                           bool isWide = constraints.maxWidth > 850;

//                           return SingleChildScrollView(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 isWide
//                                     ? Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           buildImageUploadBox(),
//                                           const SizedBox(width: 25),
//                                           Expanded(child: buildFormFields()),
//                                         ],
//                                       )
//                                     : Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           buildImageUploadBox(),
//                                           const SizedBox(height: 20),
//                                           buildFormFields(),
//                                         ],
//                                       ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // IMAGE UPLOAD WIDGET (solid border fallback to avoid dotted_border package)
//   Widget buildImageUploadBox() {
//     return GestureDetector(
//       onTap: () {
//         // TODO: implement image picker/upload if needed
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Tap to upload image — integrate image picker.')),
//         );
//       },
//       child: Container(
//         width: 200,
//         height: 160,
//         padding: const EdgeInsets.all(18),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF9FAFB),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey.shade300, width: 1.0),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(Icons.cloud_upload_outlined, size: 40, color: Color(0xFFB1B1B1)),
//               SizedBox(height: 8),
//               Text("Upload Image", style: TextStyle(fontSize: 13, color: Color(0xFF8B8B8B))),
//               SizedBox(height: 3),
//               Text("PNG, JPG", style: TextStyle(fontSize: 11, color: Color(0xFFB1B1B1))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // FORM FIELDS
//   Widget buildFormFields() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         buildLabel("Deal Name"),
//         buildTextField(controller: dealNameController, hint: "Enter name"),
//         const SizedBox(height: 18),

//         buildLabel("Deal Price"),
//         buildTextField(controller: dealPriceController, hint: "Enter price"),
//         const SizedBox(height: 18),

//         buildLabel("Description"),
//         buildTextField(
//           controller: descriptionController,
//           hint: "Enter description",
//           maxLines: 4,
//         ),
//         const SizedBox(height: 18),

//         Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildLabel("Start Date"),
//                   GestureDetector(
//                     onTap: () => pickDate(isStart: true),
//                     child: buildDateBox(startDate != null
//                         ? "${startDate!.day}-${startDate!.month}-${startDate!.year}"
//                         : "Select Date"),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 20),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   buildLabel("End Date"),
//                   GestureDetector(
//                     onTap: () => pickDate(isStart: false),
//                     child: buildDateBox(endDate != null
//                         ? "${endDate!.day}-${endDate!.month}-${endDate!.year}"
//                         : "Select Date"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),

//         const SizedBox(height: 30),

//         Align(
//           alignment: Alignment.centerLeft,
//           child: ElevatedButton(
//             onPressed: () {
//               // basic validation
//               final title = dealNameController.text.trim();
//               final price = dealPriceController.text.trim();
//               final desc = descriptionController.text.trim();
//               if (title.isEmpty || price.isEmpty || desc.isEmpty || startDate == null || endDate == null) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Please fill all fields and select dates.')),
//                 );
//                 return;
//               }
//               // TODO: submit data to backend
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deal added (demo).')));
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFF4B00),
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               "Add Deal",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // LABEL
//   Widget buildLabel(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//         fontWeight: FontWeight.w600,
//         fontSize: 14,
//         color: Color(0xFF2D2D2D),
//       ),
//     );
//   }

//   // TEXT FIELD
//   Widget buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     int maxLines = 1,
//   }) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hint,
//         filled: true,
//         fillColor: const Color(0xFFF7F8FA),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }

//   // DATE BOX
//   Widget buildDateBox(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF7F8FA),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           const Icon(Icons.calendar_today_outlined, size: 18, color: Color(0xFF6B6B6B)),
//           const SizedBox(width: 10),
//           Text(text, style: const TextStyle(color: Color(0xFF6B6B6B), fontSize: 14)),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     dealNameController.dispose();
//     dealPriceController.dispose();
//     descriptionController.dispose();
//     super.dispose();
//   }
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class RestaurantAddDealScreen extends StatefulWidget {
//   const RestaurantAddDealScreen({super.key});

//   @override
//   State<RestaurantAddDealScreen> createState() => _AddDealScreenState();
// }

// class _AddDealScreenState extends State<RestaurantAddDealScreen> {
//   final TextEditingController dealNameController = TextEditingController();
//   final TextEditingController subtitleController = TextEditingController();
//   final TextEditingController dealPriceController = TextEditingController();
//   final TextEditingController discountController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   DateTime? startDate;
//   DateTime? endDate;
//   bool isActive = true; // toggle for deal status

//   Future<void> pickDate({required bool isStart}) async {
//     final picked = await showDatePicker(
//       context: context,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2035),
//       initialDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStart) {
//           startDate = picked;
//         } else {
//           endDate = picked;
//         }
//       });
//     }
//   }

//   String _fmt(DateTime? d) {
//     if (d == null) return 'Select Date';
//     return "${d.day.toString().padLeft(2,'0')}-${d.month.toString().padLeft(2,'0')}-${d.year}";
//   }

//   @override
//   void dispose() {
//     dealNameController.dispose();
//     subtitleController.dispose();
//     dealPriceController.dispose();
//     discountController.dispose();
//     descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenW = MediaQuery.of(context).size.width;
//     final isWeb = screenW >= 1000;
//     final isTablet = screenW >= 600 && screenW < 1000;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F6F8),
//       // on mobile / small screens you might want AppBar; using TopNavBar for web/tablet in body
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//       drawer: (!isWeb && !isTablet) ? Drawer(child: LeftSidebar(width: 240, showLabels: true)) : null,
//       body: SafeArea(
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 1200),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 if (isWeb || isTablet) LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),
//                 // main content
//                 Expanded(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                         const SizedBox(height: 18),

//                         // Page Title
//                         const Text('Add Deal', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
//                         const SizedBox(height: 18),

//                         // Card
//                         Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.all(18),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//                           ),
//                           child: LayoutBuilder(builder: (ctx, constraints) {
//                             final wide = constraints.maxWidth >= 880;
//                             return wide ? _buildWideLayout() : _buildStackedLayout();
//                           }),
//                         ),

//                         const SizedBox(height: 22),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Wide layout: left large image area, right form column
//   Widget _buildWideLayout() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // LEFT: large image / preview area (approx 55% width-ish)
//         Expanded(
//           flex: 6,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Deal Image', style: TextStyle(fontWeight: FontWeight.w600)),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: () {
//                   // integrate image picker / upload
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image upload: implement picker/upload.')));
//                 },
//                 child: Container(
//                   height: 360,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF9FAFB),
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: Center(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.cloud_upload_outlined, size: 48, color: Colors.grey.shade500),
//                         const SizedBox(height: 10),
//                         const Text('Click to upload / drag & drop', style: TextStyle(color: Color(0xFF8C8C8C))),
//                         const SizedBox(height: 6),
//                         const Text('PNG, JPG up to 10MB', style: TextStyle(color: Color(0xFFB5B5B5), fontSize: 13)),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(width: 26),

//         // RIGHT: form fields column
//         Expanded(
//           flex: 5,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Deal Name
//               buildLabel('Deal Title'),
//               const SizedBox(height: 6),
//               buildTextField(controller: dealNameController, hint: 'Enter deal title'),

//               const SizedBox(height: 16),
//               // Subtitle
//               buildLabel('Short Subtitle'),
//               const SizedBox(height: 6),
//               buildTextField(controller: subtitleController, hint: 'E.g. 20% off on all burgers'),

//               const SizedBox(height: 16),
//               // Price and Discount (side-by-side)
//               Row(children: [
//                 Expanded(
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     buildLabel('Price'),
//                     const SizedBox(height: 6),
//                     buildTextField(controller: dealPriceController, hint: '1000'),
//                   ]),
//                 ),
//                 const SizedBox(width: 12),
//                 SizedBox(
//                   width: 110,
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     buildLabel('Discount %'),
//                     const SizedBox(height: 6),
//                     buildTextField(controller: discountController, hint: '10'),
//                   ]),
//                 )
//               ]),

//               const SizedBox(height: 16),
//               // Description (full width)
//               buildLabel('Description'),
//               const SizedBox(height: 6),
//               buildTextField(controller: descriptionController, hint: 'Describe the deal', maxLines: 4),

//               const SizedBox(height: 16),
//               // Date pickers
//               Row(children: [
//                 Expanded(
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     buildLabel('Start Date'),
//                     const SizedBox(height: 6),
//                     GestureDetector(onTap: () => pickDate(isStart: true), child: buildDateBox(_fmt(startDate))),
//                   ]),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     buildLabel('End Date'),
//                     const SizedBox(height: 6),
//                     GestureDetector(onTap: () => pickDate(isStart: false), child: buildDateBox(_fmt(endDate))),
//                   ]),
//                 ),
//               ]),

//               const SizedBox(height: 18),
//               // Active toggle
//               Row(
//                 children: [
//                   const Text('Status', style: TextStyle(fontWeight: FontWeight.w600)),
//                   const SizedBox(width: 12),
//                   Switch(value: isActive, onChanged: (v) => setState(() => isActive = v)),
//                   const SizedBox(width: 8),
//                   Text(isActive ? 'Active' : 'Inactive', style: const TextStyle(fontSize: 13, color: Color(0xFF6B6B6B))),
//                 ],
//               ),

//               const SizedBox(height: 18),
//               // CTA
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _onSubmit,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFF4B00),
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                   ),
//                   child: const Text('Create Deal', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   // Stacked layout for narrow widths (mobile)
//   Widget _buildStackedLayout() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // image box
//         const Text('Deal Image', style: TextStyle(fontWeight: FontWeight.w600)),
//         const SizedBox(height: 8),
//         GestureDetector(
//           onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image upload: integrate picker.'))),
//           child: Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: const Color(0xFFF9FAFB),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.grey.shade300),
//             ),
//             child: Center(
//               child: Column(mainAxisSize: MainAxisSize.min, children: [
//                 Icon(Icons.cloud_upload_outlined, size: 44, color: Colors.grey.shade500),
//                 const SizedBox(height: 8),
//                 const Text('Click to upload / drag & drop'),
//                 const SizedBox(height: 4),
//                 const Text('PNG, JPG up to 10MB', style: TextStyle(fontSize: 13, color: Color(0xFFB5B5B5))),
//               ]),
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),

//         // fields
//         buildLabel('Deal Title'),
//         const SizedBox(height: 6),
//         buildTextField(controller: dealNameController, hint: 'Enter deal title'),

//         const SizedBox(height: 12),
//         buildLabel('Short Subtitle'),
//         const SizedBox(height: 6),
//         buildTextField(controller: subtitleController, hint: 'E.g. 20% off on all burgers'),

//         const SizedBox(height: 12),
//         buildLabel('Price'),
//         const SizedBox(height: 6),
//         buildTextField(controller: dealPriceController, hint: '1000'),

//         const SizedBox(height: 12),
//         buildLabel('Discount %'),
//         const SizedBox(height: 6),
//         buildTextField(controller: discountController, hint: '10'),

//         const SizedBox(height: 12),
//         buildLabel('Description'),
//         const SizedBox(height: 6),
//         buildTextField(controller: descriptionController, hint: 'Describe the deal', maxLines: 4),

//         const SizedBox(height: 12),
//         buildLabel('Start Date'),
//         const SizedBox(height: 6),
//         GestureDetector(onTap: () => pickDate(isStart: true), child: buildDateBox(_fmt(startDate))),

//         const SizedBox(height: 12),
//         buildLabel('End Date'),
//         const SizedBox(height: 6),
//         GestureDetector(onTap: () => pickDate(isStart: false), child: buildDateBox(_fmt(endDate))),

//         const SizedBox(height: 12),
//         Row(children: [
//           const Text('Status', style: TextStyle(fontWeight: FontWeight.w600)),
//           const SizedBox(width: 12),
//           Switch(value: isActive, onChanged: (v) => setState(() => isActive = v)),
//           const SizedBox(width: 8),
//           Text(isActive ? 'Active' : 'Inactive', style: const TextStyle(fontSize: 13, color: Color(0xFF6B6B6B))),
//         ]),

//         const SizedBox(height: 16),
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(onPressed: _onSubmit, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF4B00), padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), child: const Text('Create Deal')),
//         ),
//       ],
//     );
//   }

//   // Submit handler with basic validation (demo)
//   void _onSubmit() {
//     final title = dealNameController.text.trim();
//     final price = dealPriceController.text.trim();
//     final desc = descriptionController.text.trim();
//     if (title.isEmpty || price.isEmpty || desc.isEmpty || startDate == null || endDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill required fields and select dates.')));
//       return;
//     }
//     // TODO: wire with backend upload & image
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deal created (demo).')));
//   }

//   // Helper widgets
//   Widget buildLabel(String text) => Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600));
//   Widget buildTextField({required TextEditingController controller, required String hint, int maxLines = 1}) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hint,
//         filled: true,
//         fillColor: const Color(0xFFF7F8FA),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
//       ),
//     );
//   }

//   Widget buildDateBox(String label) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       decoration: BoxDecoration(color: const Color(0xFFF7F8FA), borderRadius: BorderRadius.circular(8)),
//       child: Row(children: [const Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF6B6B6B)), const SizedBox(width: 8), Text(label, style: const TextStyle(color: Color(0xFF6B6B6B)))]),
//     );
//   }
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class AddDealScreen extends StatefulWidget {
//   const AddDealScreen({super.key});

//   @override
//   State<AddDealScreen> createState() => _AddDealScreenState();
// }

// class _AddDealScreenState extends State<AddDealScreen> {
//   final TextEditingController _titleCtrl = TextEditingController();
//   final TextEditingController _descCtrl = TextEditingController();

//   DateTime? _expiryDate;

//   @override
//   void dispose() {
//     _titleCtrl.dispose();
//     _descCtrl.dispose();
//     super.dispose();
//   }

//   // format dd/mm/yy
//   String _formatDate(DateTime? d) {
//     if (d == null) return 'dd/mm/yy';
//     final dd = d.day.toString().padLeft(2, '0');
//     final mm = d.month.toString().padLeft(2, '0');
//     final yy = d.year.toString().substring(2);
//     return '$dd/$mm/$yy';
//   }

//   Future<void> _pickExpiryDate() async {
//     final now = DateTime.now();
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _expiryDate ?? now,
//       firstDate: now,
//       lastDate: DateTime(now.year + 5),
//     );
//     if (picked != null) setState(() => _expiryDate = picked);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F6F8),
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//       drawer: (!isWeb && !isTablet) ? Drawer(child: LeftSidebar(width: 240, showLabels: true)) : null,
//       body: SafeArea(
//         child: Center(
//           child: ConstrainedBox(
//             // keeps content centered on very wide screens
//             constraints: const BoxConstraints(maxWidth: 1100),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // show sidebar on web/tablet
//                 if (isWeb || isTablet) LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),
 
//                 // main column
//                 Expanded(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // top nav for web/tablet
//                         if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                         const SizedBox(height: 18),

//                         // Title
//                         const Text('Add Deal', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
//                         const SizedBox(height: 18),

//                         // White card container
//                         Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Deal Title (single line)
//                               const Text('Deal Title', style: TextStyle(fontWeight: FontWeight.w600)),
//                               const SizedBox(height: 8),
//                               TextField(
//                                 controller: _titleCtrl,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter deal title...',
//                                   filled: true,
//                                   fillColor: const Color(0xFFF7F8FA),
//                                   contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
//                                 ),
//                               ),

//                               const SizedBox(height: 18),

//                               // Description (long)
//                               const Text('Description', style: TextStyle(fontWeight: FontWeight.w600)),
//                               const SizedBox(height: 8),
//                               TextField(
//                                 controller: _descCtrl,
//                                 minLines: 4,
//                                 maxLines: 8,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter description...',
//                                   filled: true,
//                                   fillColor: const Color(0xFFF7F8FA),
//                                   contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
//                                 ),
//                               ),

//                               const SizedBox(height: 18),

//                               // Deal Image large box with title
//                               const Text('Deal Image', style: TextStyle(fontWeight: FontWeight.w600)),
//                               const SizedBox(height: 10),
//                               GestureDetector(
//                                 onTap: () {
//                                   // TODO: integrate image picker/upload
//                                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tap to upload image — implement picker/upload.')));
//                                 },
//                                 child: Container(
//                                   width: double.infinity,
//                                   height: 320, // large box as sample
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFF9FAFB),
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(color: Colors.grey.shade300),
//                                   ),
//                                   child: Center(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: const [
//                                         Icon(Icons.cloud_upload_outlined, size: 54, color: Color(0xFF9DA6B0)),
//                                         SizedBox(height: 12),
//                                         Text('Click to upload image', style: TextStyle(fontSize: 16, color: Color(0xFF6B6B6B))),
//                                         SizedBox(height: 8),
//                                         Text('PNG, JPG up to 10MB', style: TextStyle(fontSize: 13, color: Color(0xFF9DA6B0))),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),

//                               const SizedBox(height: 18),

//                               // Expiry Date field (long, dd/mm/yy and calendar icon on right)
//                               const Text('Expiry Date', style: TextStyle(fontWeight: FontWeight.w600)),
//                               const SizedBox(height: 8),
//                               GestureDetector(
//                                 onTap: _pickExpiryDate,
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFF7F8FA),
//                                     borderRadius: BorderRadius.circular(8),
//                                     border: Border.all(color: Colors.grey.shade200),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Expanded(child: Text(_formatDate(_expiryDate), style: TextStyle(color: _expiryDate == null ? Colors.grey.shade500 : Colors.black))),
//                                       InkWell(
//                                         onTap: _pickExpiryDate,
//                                         child: Container(
//                                           padding: const EdgeInsets.all(6),
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.circular(6),
//                                             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2))],
//                                           ),
//                                           child: const Icon(Icons.calendar_today_outlined, size: 20, color: Color(0xFF6B6B6B)),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),

//                               const SizedBox(height: 22),

//                               // Full width Create Deal button (#FF4B00)
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   onPressed: _onCreateDeal,
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xFFFF4B00),
//                                     padding: const EdgeInsets.symmetric(vertical: 16),
//                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                                   ),
//                                   child: const Text('Create Deal', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _onCreateDeal() {
//     final title = _titleCtrl.text.trim();
//     final desc = _descCtrl.text.trim();

//     if (title.isEmpty || desc.isEmpty || _expiryDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter title, description and expiry date.')));
//       return;
//     }

//     // TODO: send data + image to backend
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deal created (demo).')));
//   }
// }
// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class AddDealScreen extends StatefulWidget {
//   const AddDealScreen({super.key});

//   @override
//   State<AddDealScreen> createState() => _AddDealScreenState();
// }

// class _AddDealScreenState extends State<AddDealScreen> {
//   final TextEditingController _titleCtrl = TextEditingController();
//   final TextEditingController _descCtrl = TextEditingController();

//   DateTime? _expiryDate;

//   @override
//   void dispose() {
//     _titleCtrl.dispose();
//     _descCtrl.dispose();
//     super.dispose();
//   }

//   String _formatDate(DateTime? d) {
//     if (d == null) return 'dd/mm/yy';
//     final dd = d.day.toString().padLeft(2, '0');
//     final mm = d.month.toString().padLeft(2, '0');
//     final yy = d.year.toString().substring(2);
//     return '$dd/$mm/$yy';
//   }

//   Future<void> _pickExpiryDate() async {
//     final now = DateTime.now();
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _expiryDate ?? now,
//       firstDate: now,
//       lastDate: DateTime(now.year + 5),
//     );
//     if (picked != null) setState(() => _expiryDate = picked);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//       drawer: (!isWeb && !isTablet)
//           ? Drawer(child: LeftSidebar(width: 220, showLabels: true))
//           : null,
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Sidebar for web/tablet
//             if (isWeb || isTablet)
//               LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

//             // Main content
//             Expanded(
//               child: Center(
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(maxWidth: 1100),
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Top nav for web/tablet
//                         if (isWeb || isTablet) const TopNavBar(isWeb: true),
//                         const SizedBox(height: 18),

//                         // Page title
//                         const Text('Add Deal',
//                             style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
//                         const SizedBox(height: 18),

//                         // White card container
//                         Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black.withOpacity(0.04),
//                                   blurRadius: 10,
//                                   offset: const Offset(0, 6))
//                             ],
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Deal Title
//                               const Text('Deal Title',
//                                   style: TextStyle(fontWeight: FontWeight.w600)),
//                               const SizedBox(height: 8),
//                               TextField(
//                                 controller: _titleCtrl,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter deal title...',
//                                    hintStyle: const TextStyle(color: Color(0xFF9DA6B0)),
//                                   filled: true,
//                                   fillColor: const Color(0xFFF7F8FA),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 14, vertical: 14),
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: BorderSide.none),
//                                 ),
//                               ),
//                               const SizedBox(height: 18),

//                               // Description
//                               const Text('Description',
//                                   style: TextStyle(fontWeight: FontWeight.w600)),
//                               const SizedBox(height: 8),
//                               TextField(
//                                 controller: _descCtrl,
//                                 minLines: 4,
//                                 maxLines: 8,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter description...',
//                                    hintStyle: const TextStyle(color: Color(0xFF9DA6B0)),
//                                   filled: true,
//                                   fillColor: const Color(0xFFF7F8FA),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 14, vertical: 14),
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                       borderSide: BorderSide.none),
//                                 ),
//                               ),
//                               const SizedBox(height: 18),

//                               // Deal Image
//                               const Text('Deal Image',
//                                   style: TextStyle(fontWeight: FontWeight.w600)),
//                               const SizedBox(height: 10),
//                               GestureDetector(
//                                 onTap: () {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           content: Text(
//                                               'Tap to upload image — implement picker/upload.')));
//                                 },
//                                 child: Container(
//                                   width: double.infinity,
//                                   height: 320,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFF9FAFB),
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(color: Colors.grey.shade300),
//                                   ),
//                                   child: Center(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: const [
//                                         Icon(Icons.cloud_upload_outlined,
//                                             size: 54, color: Color(0xFF9DA6B0)),
//                                         SizedBox(height: 12),
//                                         Text('Click to upload image',
//                                             style: TextStyle(
//                                                 fontSize: 16, color: Color(0xFF9DA6B0))),
//                                         SizedBox(height: 8),
//                                         Text('PNG, JPG up to 10MB',
//                                             style: TextStyle(
//                                                 fontSize: 13, color: Color(0xFF9DA6B0))),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 18),

//                               // Expiry Date
//                               const Text('Expiry Date',
//                                   style: TextStyle(fontWeight: FontWeight.w600)),
//                               const SizedBox(height: 8),
//                               GestureDetector(
//                                 onTap: _pickExpiryDate,
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 14, vertical: 14),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFF7F8FA),
//                                     borderRadius: BorderRadius.circular(8),
//                                     border: Border.all(color: Colors.grey.shade200),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                           child: Text(_formatDate(_expiryDate),
//                                               style: TextStyle(
//                                                   color: _expiryDate == null
//                                                       ? Colors.grey.shade500
//                                                       : Colors.black))),
//                                       InkWell(
//                                         onTap: _pickExpiryDate,
//                                         child: Container(
//                                           padding: const EdgeInsets.all(6),
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius: BorderRadius.circular(6),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.black.withOpacity(0.03),
//                                                   blurRadius: 4,
//                                                   offset: const Offset(0, 2))
//                                             ],
//                                           ),
//                                           child: const Icon(Icons.calendar_today_outlined,
//                                               size: 20, color: Color(0xFF6B6B6B)),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 22),

//                               // Create Deal Button
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   onPressed: _onCreateDeal,
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xFFFF4B00),
//                                     padding: const EdgeInsets.symmetric(vertical: 16),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(8)),
//                                   ),
//                                   child: const Text('Create Deal',
//                                       style: TextStyle(
//                                           fontSize: 14, fontWeight: FontWeight.w600,color: Colors.white)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onCreateDeal() {
//     final title = _titleCtrl.text.trim();
//     final desc = _descCtrl.text.trim();

//     if (title.isEmpty || desc.isEmpty || _expiryDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Please enter title, description and expiry date.')));
//       return;
//     }

//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text('Deal created (demo).')));
//   }
// }

// import 'package:dealdine_application/widgets/left_sidebar.dart';
// import 'package:dealdine_application/widgets/top_navbar.dart';
// import 'package:flutter/material.dart';

// class AddDealScreen extends StatefulWidget {
//   const AddDealScreen({super.key});

//   @override
//   State<AddDealScreen> createState() => _AddDealScreenState();
// }

// class _AddDealScreenState extends State<AddDealScreen> {
//   final TextEditingController _titleCtrl = TextEditingController();
//   final TextEditingController _descCtrl = TextEditingController();

//   DateTime? _expiryDate;

//   @override
//   void dispose() {
//     _titleCtrl.dispose();
//     _descCtrl.dispose();
//     super.dispose();
//   }

//   String _formatDate(DateTime? d) {
//     if (d == null) return 'dd/mm/yy';
//     final dd = d.day.toString().padLeft(2, '0');
//     final mm = d.month.toString().padLeft(2, '0');
//     final yy = d.year.toString().substring(2);
//     return '$dd/$mm/$yy';
//   }

//   Future<void> _pickExpiryDate() async {
//     final now = DateTime.now();
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _expiryDate ?? now,
//       firstDate: now,
//       lastDate: DateTime(now.year + 5),
//     );
//     if (picked != null) setState(() => _expiryDate = picked);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final isWeb = width >= 1000;
//     final isTablet = width >= 600 && width < 1000;

//     return Scaffold(
//       backgroundColor: const Color(0xFFDEDECC),
//       appBar: (!isWeb && !isTablet)
//           ? AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               title: const TopNavBar(isWeb: false),
//             )
//           : null,
//       drawer: (!isWeb && !isTablet)
//           ? Drawer(child: LeftSidebar(width: 220, showLabels: true))
//           : null,

//       // 🎯 SAFE AREA REMOVED TO AVOID GAPS
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           /// ⬅️ Sidebar sticks to left with 0 padding
//           if (isWeb || isTablet)
//             LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

//           /// MAIN CONTENT AREA
//           Expanded(
//             child: Column(
//               children: [
//                 /// 🔝 Top NavBar (Attached with no spacing)
//                 if (isWeb || isTablet)
//                   const TopNavBar(isWeb: true),

//                 /// 📝 CONTENT SCROLLS — NAV & SIDEBAR STAY FIXED
//                 Expanded(
//                   child: Center(
//                     child: ConstrainedBox(
//                       constraints: const BoxConstraints(maxWidth: 1100),
//                       child: SingleChildScrollView(
//                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             /// Title
//                             const Text(
//                               'Add Deal',
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             const SizedBox(height: 20),

//                             /// FORM CONTAINER
//                             Container(
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.05),
//                                     blurRadius: 10,
//                                     offset: const Offset(0, 6),
//                                   )
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // TITLE
//                                   const Text('Deal Title',
//                                       style: TextStyle(fontWeight: FontWeight.w600)),
//                                   const SizedBox(height: 8),
//                                   TextField(
//                                     controller: _titleCtrl,
//                                     decoration: InputDecoration(
//                                       hintText: 'Enter deal title...',
//                                       hintStyle: const TextStyle(color: Color(0xFF9DA6B0)),
//                                       filled: true,
//                                       fillColor: const Color(0xFFF7F8FA),
//                                       border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(8),
//                                           borderSide: BorderSide.none),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // DESCRIPTION
//                                   const Text('Description',
//                                       style: TextStyle(fontWeight: FontWeight.w600)),
//                                   const SizedBox(height: 8),
//                                   TextField(
//                                     controller: _descCtrl,
//                                     minLines: 4,
//                                     maxLines: 8,
//                                     decoration: InputDecoration(
//                                       hintText: 'Enter description...',
//                                       hintStyle: const TextStyle(color: Color(0xFF9DA6B0)),
//                                       filled: true,
//                                       fillColor: const Color(0xFFF7F8FA),
//                                       border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(8),
//                                           borderSide: BorderSide.none),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // DEAL IMAGE
//                                   const Text('Deal Image',
//                                       style: TextStyle(fontWeight: FontWeight.w600)),
//                                   const SizedBox(height: 10),
//                                   Container(
//                                     height: 320,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFF9FAFB),
//                                       borderRadius: BorderRadius.circular(10),
//                                       border: Border.all(color: Colors.grey.shade300),
//                                     ),
//                                     child: Center(
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: const [
//                                           Icon(Icons.cloud_upload_outlined,
//                                               size: 54, color: Color(0xFF9DA6B0)),
//                                           SizedBox(height: 12),
//                                           Text(
//                                             'Click to upload image',
//                                             style: TextStyle(
//                                                 fontSize: 16, color: Color(0xFF9DA6B0)),
//                                           ),
//                                           SizedBox(height: 8),
//                                           Text(
//                                             'PNG, JPG up to 10MB',
//                                             style: TextStyle(
//                                                 fontSize: 13, color: Color(0xFF9DA6B0)),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // DATE PICKER
//                                   const Text('Expiry Date',
//                                       style: TextStyle(fontWeight: FontWeight.w600)),
//                                   const SizedBox(height: 8),
//                                   GestureDetector(
//                                     onTap: _pickExpiryDate,
//                                     child: Container(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 14, vertical: 14),
//                                       decoration: BoxDecoration(
//                                         color: const Color(0xFFF7F8FA),
//                                         borderRadius: BorderRadius.circular(8),
//                                         border:
//                                             Border.all(color: Colors.grey.shade300),
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           Expanded(
//                                             child: Text(
//                                               _formatDate(_expiryDate),
//                                               style: TextStyle(
//                                                 color: _expiryDate == null
//                                                     ? Colors.grey.shade500
//                                                     : Colors.black,
//                                               ),
//                                             ),
//                                           ),
//                                           const Icon(Icons.calendar_today_outlined,
//                                               size: 20, color: Color(0xFF6B6B6B)),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 22),

//                                   // BUTTON
//                                   SizedBox(
//                                     width: double.infinity,
//                                     child: ElevatedButton(
//                                       onPressed: _onCreateDeal,
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: const Color(0xFFFF4B00),
//                                         padding: const EdgeInsets.symmetric(vertical: 16),
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(8)),
//                                       ),
//                                       child: const Text(
//                                         'Create Deal',
//                                         style: TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w600,
//                                             color: Colors.white),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onCreateDeal() {
//     final title = _titleCtrl.text.trim();
//     final desc = _descCtrl.text.trim();

//     if (title.isEmpty || desc.isEmpty || _expiryDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Please enter title, description and expiry date.')));
//       return;
//     }

//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text('Deal created (demo).')));
//   }
// }
import 'package:dealdine_application/widgets/left_sidebar.dart';
import 'package:dealdine_application/widgets/mobile_appbar.dart';
import 'package:dealdine_application/widgets/top_navbar.dart';
import 'package:flutter/material.dart';

class AddDealScreen extends StatefulWidget {
  const AddDealScreen({super.key});

  @override
  State<AddDealScreen> createState() => _AddDealScreenState();
}

class _AddDealScreenState extends State<AddDealScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();
  DateTime? _expiryDate;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? d) {
    if (d == null) return 'dd/mm/yy';
    final dd = d.day.toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    final yy = d.year.toString().substring(2);
    return '$dd/$mm/$yy';
  }

  Future<void> _pickExpiryDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) setState(() => _expiryDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWeb = width >= 1000;
    final isTablet = width >= 600 && width < 1000;
    final isMobile = !isWeb && !isTablet;

    return Scaffold(
      backgroundColor: const Color(0xFFDEDECC),

      // --------------------------
      // MOBILE APPBAR + DRAWER
      // --------------------------
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile ? Drawer(child: LeftSidebar(width: 220, showLabels: true)) : null,

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // LEFT SIDEBAR (Web/Tablet)
          if (isWeb || isTablet)
            LeftSidebar(width: isWeb ? 220 : 72, showLabels: isWeb),

          // MAIN CONTENT
          Expanded(
            child: Column(
              children: [
                // TOP NAV BAR (Web/Tablet)
                if (!isMobile) const TopNavBar(isWeb: true),

                // SEARCH FIELD BELOW APPBAR (Mobile Only)
                if (isMobile)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search deals...',
                        prefixIcon: const Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                // SCROLLABLE CONTENT
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // PAGE TITLE
                            const Text(
                              'Add Deal',
                              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 20),

                            /// FORM CONTAINER
                            _dealForm(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dealForm() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE
          const Text('Deal Title', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextField(
            controller: _titleCtrl,
            decoration: InputDecoration(
              hintText: 'Enter deal title...',
              hintStyle: const TextStyle(color: Color(0xFF9DA6B0)),
              filled: true,
              fillColor: const Color(0xFFF7F8FA),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20),

          // DESCRIPTION
          const Text('Description', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextField(
            controller: _descCtrl,
            minLines: 4,
            maxLines: 8,
            decoration: InputDecoration(
              hintText: 'Enter description...',
              hintStyle: const TextStyle(color: Color(0xFF9DA6B0)),
              filled: true,
              fillColor: const Color(0xFFF7F8FA),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            ),
          ),
          const SizedBox(height: 20),

          // DEAL IMAGE
          const Text('Deal Image', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Container(
            height: 320,
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.cloud_upload_outlined, size: 54, color: Color(0xFF9DA6B0)),
                  SizedBox(height: 12),
                  Text('Click to upload image', style: TextStyle(fontSize: 16, color: Color(0xFF9DA6B0))),
                  SizedBox(height: 8),
                  Text('PNG, JPG up to 10MB', style: TextStyle(fontSize: 13, color: Color(0xFF9DA6B0))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // DATE PICKER
          const Text('Expiry Date', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _pickExpiryDate,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _formatDate(_expiryDate),
                      style: TextStyle(color: _expiryDate == null ? Colors.grey.shade500 : Colors.black),
                    ),
                  ),
                  const Icon(Icons.calendar_today_outlined, size: 20, color: Color(0xFF6B6B6B)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),

          // CREATE BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onCreateDeal,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF4B00),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                'Create Deal',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onCreateDeal() {
    final title = _titleCtrl.text.trim();
    final desc = _descCtrl.text.trim();

    if (title.isEmpty || desc.isEmpty || _expiryDate == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please enter title, description and expiry date.')));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Deal created (demo).')));
  }
}
