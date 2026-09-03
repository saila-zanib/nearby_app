import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';

class BookingConfirmedScreen extends StatelessWidget {
  const BookingConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
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
                      "Booking Confirmed",
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

              // Success message block
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/success_bg.svg',
                          width: 102.w,
                          height: 102.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/success_tick.svg',
                          width: 37.52.w,
                          height: 26.97.h,
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
                      "Your booking has been confirmed\nsuccessfully.",
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

              SizedBox(height: 24.h),

              // Booking details card
              Container(
                width: 343.5.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 32.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color(0xFFF4F4F6),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  children: [
                    _detailRow("Service", "RegularCleaning"),
                    _divider(),
                    _detailRow("Date", "Wed, 7 Aug 2024"),
                    _divider(),
                    _detailRow("Time", "10:00 AM - 12:00 PM"),
                    _divider(),
                    _detailRow("Address", "123 Main street, Lahore"),
                    _divider(),
                    _detailRow(
                      "Total Price",
                      "PKR 2,500",
                      isTotal: true,
                    ),
                  ],
                ),
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
                    // TODO: Navigate to My Bookings once built
                  },
                  child: Text(
                    "View Booking",
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

  Widget _detailRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.sp,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: isTotal
                  ? const Color(0xFF121412)
                  : const Color(0xFF7B7A7D),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.sp,
              fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: isTotal
                  ? const Color(0xFF9AD448)
                  : const Color(0xFF1B1A1F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      thickness: 1.38,
      color: const Color(0xFFF2F2F2).withAlpha(153),
    );
  }
}