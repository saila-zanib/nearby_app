import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

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
                      "Booking Summary",
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

              SizedBox(height: 16.h),

              // Provider info card
              Container(
                width: 330.w,
                height: 107.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/freshnest_booking_summary.png',
                      width: 83.w,
                      height: 107.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 22.w),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 12.h,
                          bottom: 12.h,
                          right: 47.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "FreshNest Cleaning",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                letterSpacing: -0.01,
                                color: const Color(0xFF1B1A1F),
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "House Cleaning Service",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                letterSpacing: -0.01,
                                color: const Color(0xFF7D7D7D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Booking details card
              Container(
                width: 336.5.w,
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
                    // TODO: Navigate to Booking confirmed once built
                  },
                  child: Text(
                    "Confirm Booking",
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