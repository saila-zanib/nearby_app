import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'edit_services_pricing_screen.dart';
import 'edit_availability_screen.dart';

class ProviderOwnProfileScreen extends StatelessWidget {
  const ProviderOwnProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F9),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 24.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back,
                            size: 22.sp,
                            color: const Color(0xFF2B2A2F),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 95.w,
                        child: Text(
                          'Provider Profile',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            height: 1.5,
                            color: const Color(0xFF2B2A2F),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EditAvailabilityScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 67.w,
                            height: 22.69.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFECF7E0),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/edit_pencil_provider_screen.svg',
                                  width: 9.w,
                                  height: 9.h,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'edit',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 9.41.sp,
                                    height: 1.0,
                                    color: const Color(0xFF739147),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // Top card: image + name/rating/distance/availability
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  width: 330.w,
                  height: 133.h,
                  padding: EdgeInsets.all(10.w),
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
                          'assets/images/freshnest_cleaning.png',
                          width: 100.w,
                          height: 96.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FreshNest Cleaning',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                height: 1.5,
                                color: const Color(0xFF1B1A1F),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/star_icon.svg',
                                  width: 13.w,
                                  height: 13.h,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '4.8 (98 Reviews)',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: const Color(0xFF7D7D7D),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 13.sp,
                                  color: const Color(0xFF7D7D7D),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  '1.2 Km away',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: const Color(0xFF7D7D7D),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                Container(
                                  width: 8.w,
                                  height: 8.h,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF9AD448),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Available Today',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: const Color(0xFF95D041),
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
              ),
              SizedBox(height: 20.h),
              // Content wrapper
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // About
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
                            'About',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: const Color(0xFF1B1A1F),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Professional home cleaning service with trained staff offering reliable, affordable and high-quality cleaning solutions.',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              height: 1.5,
                              color: const Color(0xFF7D7D7D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    // Services Offered - tappable, navigates to Edit Services & Pricing
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const EditServicesPricingScreen(),
                          ),
                        );
                      },
                      child: Container(
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
                              'Services Offered',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: const Color(0xFF1B1A1F),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            _ServiceRow(
                                name: 'Regular cleaning', price: 'Rs. 1,400'),
                            Divider(
                                height: 24.h,
                                color: const Color(0xFFF4F4F4)),
                            _ServiceRow(
                                name: 'Deep cleaning', price: 'Rs. 2,200'),
                            Divider(
                                height: 24.h,
                                color: const Color(0xFFF4F4F4)),
                            _ServiceRow(
                                name: 'Kitchen cleaning', price: 'Rs. 1,800'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    // Photo Gallery
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Photo Gallery',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: const Color(0xFF1B1A1F),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // TODO: Navigate to full gallery
                                },
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: const Color(0xFF9AD448),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              _GalleryThumb('assets/images/gallery_1.png'),
                              SizedBox(width: 8.w),
                              _GalleryThumb('assets/images/gallery_2.png'),
                              SizedBox(width: 8.w),
                              _GalleryThumb('assets/images/gallery_3.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 14.h),
                    // Reviews
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reviews',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: const Color(0xFF1B1A1F),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // TODO: Navigate to full reviews list
                                },
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: const Color(0xFF9AD448),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F6F9),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        size: 14.sp,
                                        color: const Color(0xFFFFC107)),
                                    SizedBox(width: 4.w),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.sp,
                                        color: const Color(0xFF1B1A1F),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  '"Very professional and arrived on time."',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    fontStyle: FontStyle.italic,
                                    color: const Color(0xFF7D7D7D),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  '— Sarah K.',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                    color: const Color(0xFF919191),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Edit Profile button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditAvailabilityScreen(),
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
                      'Edit Profile',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xFF1B1A1F),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceRow extends StatelessWidget {
  final String name;
  final String price;
  const _ServiceRow({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: const Color(0xFF7D7D7D),
          ),
        ),
        Row(
          children: [
            Text(
              price,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
                color: const Color(0xFF95D041),
              ),
            ),
            SizedBox(width: 4.w),
            Icon(Icons.chevron_right,
                size: 16.sp, color: const Color(0xFF95D041)),
          ],
        ),
      ],
    );
  }
}

class _GalleryThumb extends StatelessWidget {
  final String path;
  const _GalleryThumb(this.path);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(
          path,
          height: 80.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}