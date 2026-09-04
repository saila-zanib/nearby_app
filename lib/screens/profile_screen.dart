import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import 'edit_profile_screen.dart';
import 'notifications_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      letterSpacing: 0,
                      color: const Color(0xFF2B2A2F),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/green_notification_icon.svg',
                      width: 16.w,
                      height: 19.9.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF212121),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // User info card
              Container(
                width: 331.w,
                height: 98.h,
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipOval(
                          child: Container(
                            width: 63.18.w,
                            height: 62.72.h,
                            color: const Color(0xFFECF7E0),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/white_profile_icon.svg',
                                width: 31.87.w,
                                height: 35.h,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: const BoxDecoration(
                              color: Color(0xFF34C759),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/camera_icon_small.svg',
                              width: 8.w,
                              height: 8.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Asra Khan",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13.86.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              letterSpacing: 0,
                              color: const Color(0xFF1B1A1F),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "asra.khan@gmail.com",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12.13.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 15.71 / 12.13,
                                    letterSpacing: 0,
                                    color: const Color(0xFF747272),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProfileScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 67.w,
                                  height: 22.69.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(5.r),
                                    border: Border.all(
                                      color: const Color(0xFF9AD448),
                                      width: 1.2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/edit_profile_icon.svg',
                                        width: 7.w,
                                        height: 8.51.h,
                                        colorFilter:
                                            const ColorFilter.mode(
                                          Color(0xFF9AD448),
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 8.2.sp,
                                          fontWeight: FontWeight.w500,
                                          height: 1.0,
                                          letterSpacing: 0,
                                          color: const Color(0xFF9AD448),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            "+92 300 1234567",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.13.sp,
                              fontWeight: FontWeight.w500,
                              height: 15.71 / 12.13,
                              letterSpacing: 0,
                              color: const Color(0xFF747272),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Saved Addresses heading + View All
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saved Addresses",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.54,
                      letterSpacing: 0,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to full address list once built
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF9AD448),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 14.h),

              _addressCard(
                iconPath: 'assets/icons/profile_home_icon.svg',
                title: "Home",
                description: "House 123, Street 45,\nDHA Phase 5, Lahore",
              ),
              SizedBox(height: 14.h),
              _addressCard(
                iconPath: 'assets/icons/work_icon.svg',
                title: "Work",
                description: "Office 10, 2nd Floor,\nGulberg III, Lahore",
              ),

              SizedBox(height: 16.h),

              Center(
                child: GestureDetector(
                  onTap: () {
                    // TODO: Navigate to Add New address once built
                  },
                  child: Text(
                    "+ Add New address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.54,
                      letterSpacing: 0,
                      color: const Color(0xFF9AD448),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Menu items
              _menuItem(
                iconPath: 'assets/icons/green_heart.svg',
                label: "Saved / Favorites",
              ),
              SizedBox(height: 12.h),
              _menuItem(
                iconPath: 'assets/icons/green_notification_icon.svg',
                label: "Notifications",
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 12.h),
              _menuItem(
                iconPath: 'assets/icons/setting_icon.svg',
                label: "Settings",
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addressCard({
    required String iconPath,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to address details once built
      },
      child: Container(
        width: 331.w,
        height: 98.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.91.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFECF7E0),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SvgPicture.asset(
                iconPath,
                width: 23.14.w,
                height: 23.14.w,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      letterSpacing: -0.01,
                      color: const Color(0xFF1B1A1F),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
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
            ),
            SvgPicture.asset(
              'assets/icons/forward_arrow.svg',
              width: 13.w,
              height: 8.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFF000000),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem({
    required String iconPath,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // TODO: Navigate once relevant screen is built
          },
      child: Container(
        width: 331.w,
        height: 62.18.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.91.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20.w,
              height: 17.h,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13.09.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: 0,
                  color: const Color(0xFF2A2C2B),
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/forward_arrow.svg',
              width: 13.w,
              height: 8.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFF000000),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}