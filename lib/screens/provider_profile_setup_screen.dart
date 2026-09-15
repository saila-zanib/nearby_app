import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_services_screen.dart';

class ProviderProfileSetupScreen extends StatefulWidget {
  const ProviderProfileSetupScreen({super.key});

  @override
  State<ProviderProfileSetupScreen> createState() =>
      _ProviderProfileSetupScreenState();
}

class _ProviderProfileSetupScreenState
    extends State<ProviderProfileSetupScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  String _selectedCategory = 'Home Cleaning';
  final List<String> _categories = const [
    'Home Cleaning',
    'Sofa Cleaning',
    'Kitchen Cleaning',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F9),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 58.h),
              // Header block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: SizedBox(
                      width: double.infinity,
                      height: 24.h,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                              Icons.arrow_back,
                              size: 22.sp,
                              color: const Color(0xFF2B2A2F),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Provider Profile setup',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                height: 1.5,
                                color: const Color(0xFF2B2A2F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      'Step 1 of 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        height: 1.54,
                        color: const Color(0xFF7E7E93),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: _ProgressBar(currentStep: 1, totalSteps: 4),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              // Avatar - SVG already includes background circle, person icon, and camera badge
              Center(
                child: SvgPicture.asset(
                  'assets/icons/provider_screen_icon.svg',
                  width: 126.w,
                  height: 126.w,
                ),
              ),
              SizedBox(height: 24.h),
              // Form fields
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FormField(
                      label: 'Full Name',
                      hint: 'Type Full Name',
                      controller: _fullNameController,
                    ),
                    SizedBox(height: 20.h),
                    _FormField(
                      label: 'Email Address',
                      hint: 'Type Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.h),
                    _FormField(
                      label: 'Phone Number',
                      hint: 'Type Phone Number',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20.h),
                    _FormField(
                      label: 'Bio',
                      hint: 'Tell us about yourself and your experience',
                      controller: _bioController,
                      maxLines: 3,
                      fixedHeight: 60.h,
                    ),
                    SizedBox(height: 20.h),
                    // Service Category dropdown
                    Text(
                      'Service Category',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.03.sp,
                        height: 1.35,
                        color: const Color(0xFF212121),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 331.w,
                      height: 54.95.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: const Color(0xFFE7E7E7),
                          width: 0.88,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCategory,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.09.sp,
                            height: 1.5,
                            color: const Color(0xFF2A2C2B),
                          ),
                          items: _categories.map((category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    // Next button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddServicesScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 330.w,
                        height: 49.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8F267),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.0,
                            color: const Color(0xFF1B1A1F),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int maxLines;
  final double? fixedHeight;

  const _FormField({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.maxLines = 1,
    this.fixedHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 14.03.sp,
            height: 1.35,
            color: const Color(0xFF212121),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 331.w,
          height: fixedHeight ?? (maxLines > 1 ? null : 54.95.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: const Color(0xFFE7E7E7),
              width: 0.88,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.03.sp,
              color: const Color(0xFF212121),
            ),
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 14.03.sp,
                height: 1.0,
                color: const Color(0xFFCFCFCF),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const _ProgressBar({required this.currentStep, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 273.w,
      height: 21.33.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 2.55,
            color: const Color(0xFFDADADA),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(totalSteps, (index) {
              final stepNumber = index + 1;
              final isActive = stepNumber == currentStep;
              return Container(
                width: 21.33.w,
                height: 21.33.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF95D041)
                      : const Color(0xFFDADADA),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$stepNumber',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.38.sp,
                    height: 1.54,
                    color: isActive ? Colors.white : const Color(0xFF9A9A9A),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}