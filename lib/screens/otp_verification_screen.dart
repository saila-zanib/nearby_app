import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../widgets/main_nav_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String get _otp => _otpController.text;

  void _onChanged(String value) {
    setState(() {});
    if (value.length == 6) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainNavScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36.h),

                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(
                    'assets/icons/back_arrow.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),

                SizedBox(height: 8.h),

                // Header: logo + Secure Verification
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/nearby_logo.png',
                        width: 73.89.w,
                        height: 85.h,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Secure Verification",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20.67.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.0,
                          letterSpacing: 0.01,
                          color: const Color(0xFF1B1A1F),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Confirm your identity to continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13.77.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.0,
                          letterSpacing: 0,
                          color: const Color(0xFF5A575D),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),

                // Verify Your Number heading + subtitle + phone
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Verify Your Number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24.82.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.0,
                          letterSpacing: 0,
                          color: const Color(0xFF1B1A1F),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "We've sent a 6-digit code to",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15.89.sp,
                          fontWeight: FontWeight.w500,
                          height: 29.74 / 15.89,
                          letterSpacing: 0,
                          color: const Color(0xFF5A575D),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "+92 300 1234567",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.45.sp,
                          fontWeight: FontWeight.w700,
                          height: 27.05 / 14.45,
                          letterSpacing: 0,
                          color: const Color(0xFF739147),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 28.h),

                // OTP boxes + hidden TextField for native keyboard
                Center(
                  child: GestureDetector(
                    onTap: () => _focusNode.requestFocus(),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 275.w,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (index) {
                              final isFilled = index < _otp.length;
                              final isActive = index == _otp.length;
                              return Container(
                                width: 40.w,
                                height: 53.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9.r),
                                  border: Border.all(
                                    color: isActive
                                        ? const Color(0xFF5A575D)
                                        : const Color(0xFFE8E9EC),
                                    width: isActive ? 1.7 : 1,
                                  ),
                                ),
                                child: isFilled
                                    ? Text(
                                        _otp[index],
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textDark,
                                        ),
                                      )
                                    : (isActive
                                        ? Container(
                                            width: 2.w,
                                            height: 24.h,
                                            color: const Color(0xFF5A575D),
                                          )
                                        : const SizedBox()),
                              );
                            }),
                          ),
                        ),
                        // Invisible TextField that drives the native keyboard
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 1,
                            height: 1,
                            child: TextField(
                              controller: _otpController,
                              focusNode: _focusNode,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              onChanged: _onChanged,
                              showCursor: false,
                              decoration: const InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 33.h),

                // Didn't receive the code? Resend Code
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Didn't receive the code?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15.03.sp,
                          fontWeight: FontWeight.w500,
                          height: 28.12 / 15.03,
                          letterSpacing: 0,
                          color: const Color(0xFF5A575D),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Resend OTP code
                        },
                        child: Text(
                          "Resend Code",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15.03.sp,
                            fontWeight: FontWeight.w600,
                            height: 28.12 / 15.03,
                            letterSpacing: 0,
                            color: const Color(0xFF739147),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 70.h),

                SizedBox(
                  width: 327.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB8F267),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainNavScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Verify",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.44.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF242423),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}