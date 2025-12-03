
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
      backgroundColor: const Color(0xFFdee2e6),

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
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // PAGE TITLE
                            const Text(
                              'Add Deal',
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
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
