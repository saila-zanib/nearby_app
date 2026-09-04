import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14.03.sp,
            fontWeight: FontWeight.w400,
            height: 1.35,
            letterSpacing: 0,
            color: const Color(0xFF212121),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 331.w,
          height: 54.95.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: const Color(0xFFE7E7E7),
              width: 0.88,
            ),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.03.sp,
                fontWeight: FontWeight.w400,
                height: 1.0,
                letterSpacing: 0,
                color: const Color(0xFFCFCFCF),
              ),
              border: InputBorder.none,
              isCollapsed: true,
            ),
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textDark,
            ),
          ),
        ),
      ],
    );
  }

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
                      "Edit Profile",
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

              // Avatar + camera icon (combined SVG)
              Center(
                child: SvgPicture.asset(
                  'assets/icons/avatar_camera_combo.svg',
                  width: 126.w,
                  height: 125.h,
                ),
              ),

              SizedBox(height: 40.h),

              _buildField(
                label: "Full Name",
                controller: _nameController,
                hintText: "Type Full Name",
              ),

              SizedBox(height: 20.h),

              _buildField(
                label: "Email Address",
                controller: _emailController,
                hintText: "Type Email",
              ),

              SizedBox(height: 20.h),

              _buildField(
                label: "Phone Number",
                controller: _phoneController,
                hintText: "Type Phone Number",
              ),

              SizedBox(height: 40.h),

              SizedBox(
                width: 330.w,
                height: 49.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB8F267),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF1B1A1F),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}