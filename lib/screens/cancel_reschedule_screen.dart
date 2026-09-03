import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import 'select_date_time_screen.dart';

class CancelRescheduleScreen extends StatelessWidget {
  const CancelRescheduleScreen({super.key});

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
                      "Cancel / Reschedule",
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

              SizedBox(height: 24.h),

              // Icon group + heading + subtitle
              Center(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/cancel_green_circle.svg',
                          width: 102.w,
                          height: 102.w,
                        ),
                        Positioned(
                          top: 24.29.h,
                          left: 28.w,
                          child: SvgPicture.asset(
                            'assets/icons/calendar_icon.svg',
                            width: 46.w,
                            height: 52.42.h,
                          ),
                        ),
                        Positioned(
                          top: 75.5.h,
                          left: 73.w,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/small_green_circle.svg',
                                width: 24.w,
                                height: 24.w,
                              ),
                              Transform.rotate(
                                angle: 9.86 * 3.14159 / 180,
                                child: SvgPicture.asset(
                                  'assets/icons/white_tick.svg',
                                  width: 11.5.w,
                                  height: 7.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Booking Confirmed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        letterSpacing: -0.01,
                        color: const Color(0xFF1B1A1F),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "You can cancel or reschedule your booking\nup to 2 hours before the scheduled time.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.54,
                        letterSpacing: 0.01,
                        color: const Color(0xFF7E7E93),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60.h),

              // Reschedule Booking card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectDateTimeScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 331.w,
                  height: 79.h,
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF5F8),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCEBF3),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/blue_calendar.svg',
                          width: 19.w,
                          height: 19.w,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Reschedule Booking",
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
                              "Change the date or time",
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
                        width: 16.w,
                        height: 10.h,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF565656),
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Cancel Booking card
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to Cancel confirmation once built
                },
                child: Container(
                  width: 331.w,
                  height: 79.h,
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAEFEF),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5DEDE),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/red_cross.svg',
                          width: 19.w,
                          height: 19.w,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Cancel Booking",
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
                              "Cancel this booking",
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
                        width: 16.w,
                        height: 10.h,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF565656),
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
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