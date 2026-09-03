import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({super.key});

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _services = const [
    {
      'title': 'Regular Cleaning',
      'description': 'Routine cleaning for daily maintenance',
      'price': 'PKR 2,500',
      'duration': '2-3 hours',
    },
    {
      'title': 'Deep Cleaning',
      'description': 'Thorough cleaning for a deep refresh',
      'price': 'PKR 4,500',
      'duration': '4-5 hours',
    },
    {
      'title': 'Kitchen Cleaning',
      'description': 'Cleaning and sanitizing your kitchen',
      'price': 'PKR 2,000',
      'duration': '2-3 hours',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      'assets/icons/back_arrow.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  Expanded(
                    child: Text(
                      "Select Service",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        letterSpacing: 0,
                        color: const Color(0xFF2B2A2F),
                      ),
                    ),
                  ),
                  SizedBox(width: 24.w),
                ],
              ),

              SizedBox(height: 16.h),

              // Provider info card
              Container(
                width: 330.w,
                height: 107.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/freshnest_select_service.png',
                      width: 83.w,
                      height: 107.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 22.w),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 12.h,
                          bottom: 12.h,
                          right: 47.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "FreshNest Cleaning",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                letterSpacing: -0.01,
                                color: const Color(0xFF1B1A1F),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "House Cleaning Service",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                letterSpacing: -0.01,
                                color: const Color(0xFF7D7D7D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              Text(
                "Available services",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: 0,
                  color: const Color(0xFF1B1A1F),
                ),
              ),

              SizedBox(height: 16.h),

              // Service cards
              ...List.generate(_services.length, (index) {
                final service = _services[index];
                final isSelected = _selectedIndex == index;
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == _services.length - 1 ? 0 : 16.h,
                  ),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      width: 330.w,
                      height: 107.h,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF9AD448)
                              : const Color(0xFFE4E4E4),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service['title']!,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    letterSpacing: -0.01,
                                    color: const Color(0xFF1B1A1F),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  service['description']!,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    letterSpacing: 0.01,
                                    color: const Color(0xFF7D7D7D),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Text(
                                      service['price']!,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        letterSpacing: -0.01,
                                        color: const Color(0xFF9AD448),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Container(
                                      width: 3.5.w,
                                      height: 3.5.w,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF7D7D7D),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      service['duration']!,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        letterSpacing: -0.01,
                                        color: const Color(0xFF7D7D7D),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          isSelected
                              ? SvgPicture.asset(
                                  'assets/icons/click_button.svg',
                                  width: 22.w,
                                  height: 22.w,
                                )
                              : Container(
                                  width: 22.w,
                                  height: 22.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0xFFE4E4E4),
                                      width: 1.7,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              }),

              SizedBox(height: 24.h),

              SizedBox(
                width: 330.w,
                height: 49.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9DDA47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // TODO: Navigate to Date & time once built
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF1B1A1F),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}