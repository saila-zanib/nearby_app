import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  final List<Map<String, dynamic>> _reviews = const [
    {
      'name': 'Sarah K.',
      'image': 'assets/images/sarah_k.png',
      'date': '2 days ago',
      'rating': '5.0',
      'stars': 5,
      'text':
          'Very professional and arrived on time.\nThey did an amazing job. Highly recommended!',
    },
    {
      'name': 'Ahmed R.',
      'image': 'assets/images/ahmed_r.png',
      'date': '1 week ago',
      'rating': '5.0',
      'stars': 5,
      'text':
          'Excellent service! My home is spotless.\nThe team was friendly and efficient.',
    },
    {
      'name': 'Fatima J.',
      'image': 'assets/images/fatima_j.png',
      'date': '2 weeks ago',
      'rating': '4.5',
      'stars': 4,
      'text': 'Great experience overall.\nVery thorough cleaning.',
    },
    {
      'name': 'Usman A.',
      'image': 'assets/images/usman_a.png',
      'date': '3 weeks ago',
      'rating': '5.0',
      'stars': 5,
      'text': 'Reliable and affordable.\nWill book again for sure.',
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
                      "Reviews",
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
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        'assets/images/freshnest_profile.png',
                        width: 83.w,
                        height: 83.h,
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
                                  fontSize: 13.sp,
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
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // Review cards
              Column(
                children: _reviews.map((review) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Container(
                      width: 330.w,
                      padding: EdgeInsets.only(
                        top: 15.h,
                        right: 13.w,
                        bottom: 13.h,
                        left: 13.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  review['image'] as String,
                                  width: 41.w,
                                  height: 41.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review['name'] as String,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        letterSpacing: -0.01,
                                        color: const Color(0xFF1B1A1F),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        Row(
                                          children: List.generate(5, (i) {
                                            return Icon(
                                              i < (review['stars'] as int)
                                                  ? Icons.star
                                                  : Icons.star_border,
                                              size: 12.sp,
                                              color: const Color(0xFFF5C016),
                                            );
                                          }),
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          review['rating'] as String,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 10.sp,
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
                              Text(
                                review['date'] as String,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.75,
                                  letterSpacing: 0,
                                  color: const Color(0xFF7D7D7D),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            review['text'] as String,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.75,
                              letterSpacing: 0,
                              color: const Color(0xFF5E5D5F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}