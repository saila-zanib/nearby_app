import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import 'reviews_screen.dart';
import 'photo_gallery_screen.dart';
import 'select_service_screen.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 16.h),
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
                      "Provider Profile",
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
                height: 133.h,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        'assets/images/freshnest_profile.png',
                        width: 109.w,
                        height: 109.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star_icon.svg',
                                width: 14.w,
                                height: 14.w,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "4.8 (98 Reviews)",
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
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/travel_location_icon.svg',
                                width: 14.w,
                                height: 14.w,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF7D7D7D),
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "1.2 Km away",
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
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Container(
                                width: 6.w,
                                height: 6.w,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF9AD448),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "Available Today",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  letterSpacing: -0.01,
                                  color: const Color(0xFF9AD448),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              // About section
              Container(
                width: 330.w,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        letterSpacing: -0.01,
                        color: const Color(0xFF1B1A1F),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Professional home cleaning service with trained staff\noffering reliable, affordable and high-quality\ncleaning solutions.",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        letterSpacing: -0.01,
                        color: const Color(0xFF7D7D7D),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              // Services Offered section
              Container(
                width: 330.w,
                padding: EdgeInsets.only(
                  top: 9.h,
                  right: 17.w,
                  bottom: 18.h,
                  left: 16.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Services Offered",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        letterSpacing: -0.01,
                        color: const Color(0xFF1B1A1F),
                      ),
                    ),
                    SizedBox(height: 11.h),
                    _serviceRow("Regular cleaning", "Rs. 1,400"),
                    Divider(
                      height: 15.h,
                      thickness: 1,
                      color: const Color(0xFFF8F8F8),
                    ),
                    _serviceRow("Deep cleaning", "Rs. 2,200"),
                    Divider(
                      height: 15.h,
                      thickness: 1,
                      color: const Color(0xFFF8F8F8),
                    ),
                    _serviceRow("Kitchen cleaning", "Rs. 1,800"),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              // Photo Gallery section
              Container(
                width: 330.w,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Photo Gallery",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            letterSpacing: -0.01,
                            color: const Color(0xFF1B1A1F),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PhotoGalleryScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF9AD448),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        _galleryThumbnail('assets/images/gallery_1.png'),
                        SizedBox(width: 6.w),
                        _galleryThumbnail('assets/images/gallery_2.png'),
                        SizedBox(width: 6.w),
                        _galleryThumbnail('assets/images/gallery_3.png'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              // Reviews section
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewsScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 330.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 9.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              letterSpacing: -0.01,
                              color: const Color(0xFF1B1A1F),
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF9AD448),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star_icon.svg',
                            width: 15.44.w,
                            height: 15.44.w,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "4.8",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              letterSpacing: -0.01,
                              color: const Color(0xFF212121),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "\u201cVery professional and arrived on time.\u201d\n\u2014 Sarah K.",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.53,
                          letterSpacing: 0,
                          color: const Color(0xFF6E6D74),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectServiceScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Book Now",
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

  Widget _serviceRow(String name, String price) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: -0.01,
              color: const Color(0xFF7D7D7D),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  letterSpacing: -0.01,
                  color: const Color(0xFF9DDA47),
                ),
              ),
              SizedBox(width: 8.w),
              SvgPicture.asset(
                'assets/icons/forward_arrow.svg',
                width: 7.15.w,
                height: 3.97.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF969191),
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _galleryThumbnail(String imagePath) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: Image.asset(
          imagePath,
          height: 98.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}