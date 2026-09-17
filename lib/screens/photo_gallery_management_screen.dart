import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoGalleryManagementScreen extends StatefulWidget {
  const PhotoGalleryManagementScreen({super.key});

  @override
  State<PhotoGalleryManagementScreen> createState() =>
      _PhotoGalleryManagementScreenState();
}

class _PhotoGalleryManagementScreenState
    extends State<PhotoGalleryManagementScreen> {
  final List<String> _photos = [
    'assets/images/gallery_full_1.png',
    'assets/images/gallery_full_2.png',
    'assets/images/gallery_full_3.png',
    'assets/images/gallery_full_4.png',
    'assets/images/gallery_full_5.png',
    'assets/images/gallery_full_6.png',
    'assets/images/gallery_full_7.png',
    'assets/images/gallery_full_8.png',
    'assets/images/gallery_full_9.png',
  ];

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
              SizedBox(height: 54.h),
              // Header
              SizedBox(
                width: double.infinity,
                height: 24.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 24.w,
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
                      left: 78.w,
                      child: Text(
                        'Photo Gallery Management',
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
              SizedBox(height: 29.h),
              // Your Work Photos card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  width: 331.w,
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.91.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Work Photos',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          height: 1.5,
                          letterSpacing: -0.14,
                          color: const Color(0xFF1B1A1F),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Showcase your best work photos to build trust.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          height: 1.5,
                          letterSpacing: -0.12,
                          color: const Color(0xFF7D7D7D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Photo grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SizedBox(
                  width: 331.w,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _photos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 6.5.w,
                      childAspectRatio: 106 / 132,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14.r),
                            child: Image.asset(
                              _photos[index],
                              width: 106.w,
                              height: 132.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 6.h,
                            right: 6.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _photos.removeAt(index);
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/icons/full_cross_circle_icon.svg',
                                width: 18.w,
                                height: 18.h,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              // Add Photos button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    // TODO: Open photo picker to add new photos
                  },
                  child: Container(
                    width: 330.w,
                    height: 49.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F6D8),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      '+ Add Photos',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        height: 1.0,
                        color: const Color(0xFF739147),
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