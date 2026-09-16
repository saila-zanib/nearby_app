import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/provider_main_nav_screen.dart';

class ProfileUnderReviewScreen extends StatelessWidget {
  const ProfileUnderReviewScreen({super.key});

  void _goToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const ProviderMainNavScreen(),
      ),
      (route) => false,
    );
  }

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
                    left: 96.w,
                    child: Text(
                      'Profile Under Review',
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
            SizedBox(height: 11.h),
            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Text(
                'Your profile has been submitted successfully.\nOur team is reviewing your information.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  height: 1.54,
                  color: const Color(0xFF7E7E93),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Under Review card
                  Container(
                    width: 331.w,
                    height: 91.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.91.r),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 17.h,
                          left: 14.w,
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFECF7E0),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/review_clock_icon.svg',
                              width: 22.w,
                              height: 21.21.h,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 14.h,
                          left: 69.w,
                          child: SizedBox(
                            width: 194.w,
                            child: Text(
                              'Under Review',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                height: 1.5,
                                letterSpacing: -0.15,
                                color: const Color(0xFF1B1A1F),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 41.h,
                          left: 69.w,
                          child: SizedBox(
                            width: 191.w,
                            child: Text(
                              "You'll be notified once your profile is approved",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                height: 1.5,
                                letterSpacing: -0.12,
                                color: const Color(0xFF7D7D7D),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28.h),
                  // Got it button
                  GestureDetector(
                    onTap: () => _goToHome(context),
                    child: Container(
                      width: 330.w,
                      height: 49.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB8F267),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        'Got it',
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
                  SizedBox(height: 16.h),
                  // Back to Home button
                  GestureDetector(
                    onTap: () => _goToHome(context),
                    child: Container(
                      width: 330.w,
                      height: 49.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: const Color(0xFF838186),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'Back to Home',
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
    );
  }
}