import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_screen.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image (full-bleed)
          Image.asset(
            'assets/images/onboarding_2_bg.png',
            fit: BoxFit.cover,
            alignment: const Alignment(0, 0.85),
          ),

          // Dark gradient overlay (top vignette + bottom vignette for text readability)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(180),
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withAlpha(140),
                ],
                stops: const [0.0, 0.25, 0.55, 1.0],
              ),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 33.h, left: 36.w, right: 36.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Heading
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                          letterSpacing: 0,
                          color: Colors.white,
                        ),
                        children: [
                          const TextSpan(text: "Book Services\nin "),
                          TextSpan(
                            text: "Minutes",
                            style: TextStyle(
                              color: const Color(0xFFB8F267),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Subtitle
                    SizedBox(
                      width: 308.57.w,
                      child: Text(
                        "Choose your service, schedule a time, and confirm your booking instantly.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 21 / 16,
                          letterSpacing: 0,
                          color: const Color(0xFFA4ACB9),
                        ),
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // Skip / Start row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 4.w,
                              ),
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 1.0,
                                  letterSpacing: 0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: const Color(0xFFB8F267),
                          borderRadius: BorderRadius.circular(62.r),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(62.r),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 104.w,
                              height: 54.h,
                              alignment: Alignment.center,
                              child: Text(
                                "Start",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 1.0,
                                  letterSpacing: 0,
                                  color: const Color(0xFF242423),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}