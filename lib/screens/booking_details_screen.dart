import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import 'cancel_reschedule_screen.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

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
                      "Booking Details",
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

              // Provider info card (tappable -> Cancel/Reschedule)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CancelRescheduleScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 331.w,
                  height: 130.h,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(11.17.r),
                        child: Image.asset(
                          'assets/images/booking_1.png',
                          width: 135.03.w,
                          height: 130.37.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 25.h, right: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(height: 4.h),
                              Text(
                                "House Cleaning Service",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  letterSpacing: -0.01,
                                  color: const Color(0xFF7D7D7D),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Container(
                                width: 69.5.w,
                                height: 21.84.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEAF7DC),
                                  borderRadius:
                                      BorderRadius.circular(7.94.r),
                                ),
                                child: Text(
                                  "Confirmed",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.03,
                                    color: const Color(0xFF8ECE35),
                                  ),
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

              SizedBox(height: 16.h),

              // Info cards: Service, Date & Time, Location
              _infoCard(
                iconPath: 'assets/icons/service_icon.svg',
                label: "Service",
                value: "Regular Cleaning",
                description: "Routine cleaning for daily maintenance",
              ),
              SizedBox(height: 16.h),
              _infoCard(
                iconPath: 'assets/icons/datetime_icon.svg',
                label: "Date & Time",
                value: "Tuesday, 12 August 2025",
                description: "10:00 AM - 12:00 PM",
              ),
              SizedBox(height: 16.h),
              _infoCard(
                iconPath: 'assets/icons/booking_location_icon.svg',
                label: "Location",
                value: "House 123, Street 45,",
                description: "DHA Phase 5, Lahore, Pakistan",
              ),

              SizedBox(height: 16.h),

              // Total Price
              Container(
                width: 331.w,
                height: 66.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF5E2),
                  borderRadius: BorderRadius.circular(11.91.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        letterSpacing: -0.01,
                        color: const Color(0xFF1B1A1F),
                      ),
                    ),
                    Text(
                      "PKR 2,500",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        letterSpacing: -0.01,
                        color: const Color(0xFF9AD448),
                      ),
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
                    // TODO: Navigate to Leave a Review once built
                  },
                  child: Text(
                    "Leave a Review",
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

  Widget _infoCard({
    required String iconPath,
    required String label,
    required String value,
    required String description,
  }) {
    return Container(
      width: 331.w,
      height: 98.h,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.91.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF7DC),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 17.05.w,
              height: 17.28.h,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: -0.01,
                    color: const Color(0xFF7D7D7D),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  value,
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
                  description,
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
        ],
      ),
    );
  }
}