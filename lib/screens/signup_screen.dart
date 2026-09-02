import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import 'otp_verification_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _selectedRole = "Customer";

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required Widget icon,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      width: 327.w,
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFE8E9EC),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
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
          if (suffixIcon != null) suffixIcon,
        ],
      ),
    );
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
                        "Create Account",
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
                      SizedBox(height: 5.h),
                      Text(
                        "Sign up to get started",
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

                SizedBox(height: 24.h),

                // Full Name
                _buildInputField(
                  controller: _nameController,
                  hintText: "Full Name",
                  icon: SvgPicture.asset(
                    'assets/icons/person_icon.svg',
                    width: 13.81.w,
                    height: 15.95.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF2B2A2F),
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                // Phone Number
                _buildInputField(
                  controller: _phoneController,
                  hintText: "Phone Number",
                  icon: SvgPicture.asset(
                    'assets/icons/phone_icon.svg',
                    width: 16.w,
                    height: 16.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF2B2A2F),
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                // Email Address
                _buildInputField(
                  controller: _emailController,
                  hintText: "Email Address",
                  icon: SvgPicture.asset(
                    'assets/icons/email_icon.svg',
                    width: 20.w,
                    height: 20.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF2B2A2F),
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                // Password
                _buildInputField(
                  controller: _passwordController,
                  hintText: "Password",
                  obscureText: _obscurePassword,
                  icon: SvgPicture.asset(
                    'assets/icons/lock_icon.svg',
                    width: 20.w,
                    height: 20.w,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF2B2A2F),
                      BlendMode.srcIn,
                    ),
                  ),
                  suffixIcon: GestureDetector(
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
                ),

                SizedBox(height: 25.h),

                Text(
                  "Choose Your Role",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.42.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: 0,
                    color: const Color(0xFF1B1A1F),
                  ),
                ),

                SizedBox(height: 8.h),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRole = "Customer";
                          });
                        },
                        child: Container(
                          height: 63.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: _selectedRole == "Customer"
                                  ? const Color(0xFFA3DF4F)
                                  : const Color(0xFFE8E9EC),
                              width: 1.3,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/customer_icon.svg',
                                width: 16.w,
                                height: 18.48.h,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF9AD448),
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Customer",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14.08.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF1B1A1F),
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      "Book local services",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 9.11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF737B98),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRole = "Provider";
                          });
                        },
                        child: Container(
                          height: 63.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: _selectedRole == "Provider"
                                  ? const Color(0xFFA3DF4F)
                                  : const Color(0xFFE8E9EC),
                              width: 1.3,
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/provider_icon.svg',
                                width: 21.5.w,
                                height: 19.55.h,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF2B2A2F),
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Provider",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14.08.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF1B1A1F),
                                      ),
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      "Offer local services",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 9.11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF737B98),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 27.h),

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpVerificationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15.44.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF242423),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.08.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF666668),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14.08.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF666668),
                          ),
                        ),
                      ),
                    ],
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