import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
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
                        "Welcome Back",
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
                        "Login to continue",
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

                // Phone/Email field
                Container(
                  width: 327.w,
                  height: 54.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color(0xFFE8E9EC),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/phone_icon.svg',
                        width: 16.67.w,
                        height: 16.67.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF2B2A2F),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            hintText: "Phone / Email",
                            hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.94.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF737B98),
                            ),
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // Password field
                Container(
                  width: 327.w,
                  height: 54.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color(0xFFE8E9EC),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/lock_icon.svg',
                        width: 16.67.w,
                        height: 16.67.w,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF2B2A2F),
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12.94.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF737B98),
                            ),
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18.sp,
                          color: const Color(0xFF737B98),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Navigate to Forgot Password once built
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13.37.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.04,
                        color: const Color(0xFF739147),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 26.h),

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
                      // TODO: Navigate to Home once built
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.44.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF242423),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 29.h),

                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 101.w,
                          height: 1,
                          color: const Color(0xFFE8E9EC),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13.2.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF737B98),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 101.w,
                          height: 1,
                          color: const Color(0xFFE8E9EC),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 26.h),

                SizedBox(
                  width: 327.w,
                  height: 50.h,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFF838186),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Navigate to OTP login once built
                    },
                    child: Text(
                      "Log in with OTP",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.44.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF242423),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 23.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.08.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGrey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.08.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
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