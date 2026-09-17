import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'provider_notifications_settings_screen.dart';

class ProviderAccountSettingsScreen extends StatelessWidget {
  const ProviderAccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F9),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 57.h),
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
                    left: 105.w,
                    child: Text(
                      'Account Settings',
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
            SizedBox(height: 32.h),
            // User info card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                width: 331.w,
                height: 62.18.h,
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.73.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 21.r,
                      backgroundColor: const Color(0xFFD9EDF5),
                      child: Icon(
                        Icons.person,
                        size: 24.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 4.h),
                        Text(
                          'Rohit',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            height: 1.5,
                            color: const Color(0xFF1B1A1F),
                          ),
                        ),
                        Text(
                          'Provider',
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Menu list
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  _SettingsItem(
                    iconPath: 'assets/icons/language_icon.svg',
                    label: 'Language',
                    iconWidth: 19.w,
                    iconHeight: 19.h,
                    onTap: () {
                      // TODO: Navigate to Language screen once built
                    },
                  ),
                  SizedBox(height: 20.h),
                  _SettingsItem(
                    iconPath: 'assets/icons/green_notification_icon.svg',
                    label: 'Notifications',
                    iconWidth: 16.w,
                    iconHeight: 19.9.h,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProviderNotificationsSettingsScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  _SettingsItem(
                    iconPath: 'assets/icons/logout_icon.svg',
                    label: 'Logout',
                    iconWidth: 17.w,
                    iconHeight: 16.29.h,
                    onTap: () {
                      // TODO: Handle logout
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final double iconWidth;
  final double iconHeight;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.iconPath,
    required this.label,
    required this.iconWidth,
    required this.iconHeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 331.w,
        height: 62.18.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.73.r),
          border: Border.all(
            color: const Color(0xFFF4F4F4),
            width: 0.82,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: iconWidth,
              height: iconHeight,
              colorFilter: const ColorFilter.mode(
                Color(0xFF9AD448),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.09.sp,
                  height: 1.5,
                  color: const Color(0xFF2A2C2B),
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 18.sp,
              color: const Color(0xFF000000),
            ),
          ],
        ),
      ),
    );
  }
}