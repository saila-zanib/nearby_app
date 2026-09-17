import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cancel_booking_screen.dart';
import 'reschedule_request_screen.dart';

class BookingDetailsProviderScreen extends StatelessWidget {
  final String customerName;
  final String service;
  final String dateTime;
  final String address;

  const BookingDetailsProviderScreen({
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
                      left: 105.w,
                      child: Text(
                        'Booking Details',
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
                    SizedBox(height: 44.h),
                    // Action buttons 2x2 grid
                    Row(
                      children: [
                        Expanded(
                          child: _ActionButton(
                            backgroundColor: const Color(0xFFECF7E0),
                            textColor: const Color(0xFF739147),
                            label: 'Mark as Completed',
                            onTap: () {
                              // TODO: Mark booking as completed
                            },
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: _ActionButton(
                            backgroundColor: const Color(0xFFFDD8D9),
                            textColor: const Color(0xFFED0000),
                            label: 'Cancel Booking',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CancelBookingScreen(
                                    customerName: customerName,
                                    service: service,
                                    dateTime: dateTime,
                                    address: address,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: _ActionButton(
                            backgroundColor: const Color(0xFFD9EDF5),
                            textColor: const Color(0xFF4499C4),
                            label: 'Message Customer',
                            onTap: () {
                              // TODO: Message customer
                            },
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: _ActionButton(
                            backgroundColor: const Color(0xFFE8E1F9),
                            textColor: const Color(0xFF9E0BC3),
                            label: 'Reschedule Request',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RescheduleRequestScreen(
                                    customerName: customerName,
                                    service: service,
                                    currentDateTime: dateTime,
                                    address: address,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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

class _ActionButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.backgroundColor,
    required this.textColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            height: 1.0,
            color: textColor,
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