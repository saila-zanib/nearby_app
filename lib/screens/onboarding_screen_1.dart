import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_screen_2.dart';
import 'login_screen.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image (full-bleed)
          Image.asset(
            'assets/images/onboarding_1_bg.png',
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
                          const TextSpan(text: "Find "),
                          TextSpan(
                            text: "Trusted",
                            style: TextStyle(
                              color: const Color(0xFFB8F267),
                            ),
                          ),
                          const TextSpan(text: "\nLocal Professionals"),
                        ],
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // Subtitle
                    SizedBox(
                      width: 308.57.w,
                      child: Text(
                        "Browse verified service providers near you with ratings and reviews.",
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

                    // Skip / Next row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OnboardingScreen2(),
                              ),
                            );
                          },
                          child: Container(
                            width: 104.w,
                            height: 54.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB8F267),
                              borderRadius: BorderRadius.circular(62.r),
                            ),
                            child: Text(
                              "Next",
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