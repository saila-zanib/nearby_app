import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingRequestDetailsScreen extends StatelessWidget {
  final String customerName;
  final String service;
  final String dateTime;
  final String address;

  const BookingRequestDetailsScreen({
    super.key,
    this.customerName = 'Priya Sharma',
    this.service = 'Home Cleaning',
    this.dateTime = 'Tue, 22 Apr 2025    10:00 AM',
    this.address = '123 Green Park, Sector 15, Noida, Uttar Pradesh 201301',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F9),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 24.h),
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
                      left: 82.w,
                      child: Text(
                        'Booking Request Details',
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
              SizedBox(height: 35.h),
              // Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Customer Name card
                    _InfoCard(
                      iconPath: 'assets/icons/provider_person_white_icon.svg',
                      iconBoxColor: const Color(0xFFD9EDF5),
                      circleIcon: true,
                      iconWidth: 20.w,
                      iconHeight: 22.h,
                      label: 'Customer Name',
                      value: customerName,
                    ),
                    SizedBox(height: 12.h),
                    // Service Requested card
                    _InfoCard(
                      iconPath: 'assets/icons/provider_home_cleaning_icon.svg',
                      iconBoxColor: const Color(0xFFECF7E0),
                      circleIcon: false,
                      iconWidth: 20.83.w,
                      iconHeight: 22.82.h,
                      label: 'Service Requested',
                      value: service,
                    ),
                    SizedBox(height: 12.h),
                    // Date & Time card
                    _InfoCard(
                      iconPath: 'assets/icons/datetime_icon.svg',
                      iconBoxColor: const Color(0xFFECF7E0),
                      circleIcon: false,
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      label: 'Date & Time',
                      value: dateTime,
                    ),
                    SizedBox(height: 12.h),
                    // Address card
                    _InfoCard(
                      iconPath: 'assets/icons/booking_location_icon.svg',
                      iconBoxColor: const Color(0xFFECF7E0),
                      circleIcon: false,
                      iconWidth: 20.w,
                      iconHeight: 20.h,
                      label: 'Address',
                      value: address,
                      valueMaxLines: 2,
                    ),
                    SizedBox(height: 40.h),
                    // Decline button
                    GestureDetector(
                      onTap: () {
                        // TODO: Handle decline
                      },
                      child: Container(
                        width: 330.w,
                        height: 49.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFDD8D9),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Decline',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.0,
                            color: const Color(0xFFED0000),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Accept button
                    GestureDetector(
                      onTap: () {
                        // TODO: Handle accept
                      },
                      child: Container(
                        width: 330.w,
                        height: 49.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8F267),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.0,
                            color: Colors.black,
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
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String iconPath;
  final Color iconBoxColor;
  final bool circleIcon;
  final double iconWidth;
  final double iconHeight;
  final String label;
  final String value;
  final int valueMaxLines;

  const _InfoCard({
    required this.iconPath,
    required this.iconBoxColor,
    required this.circleIcon,
    required this.iconWidth,
    required this.iconHeight,
    required this.label,
    required this.value,
    this.valueMaxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      constraints: BoxConstraints(minHeight: 79.h),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.91.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 12.5.w),
          Container(
            width: 40.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBoxColor,
              shape: circleIcon ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: circleIcon ? null : BorderRadius.circular(10.r),
            ),
            child: SvgPicture.asset(
              iconPath,
              width: iconWidth,
              height: iconHeight,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    height: 1.5,
                    letterSpacing: -0.12,
                    color: const Color(0xFF7D7D7D),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  maxLines: valueMaxLines,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    height: 1.5,
                    letterSpacing: -0.14,
                    color: const Color(0xFF1B1A1F),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
    );
  }
}