import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancelBookingScreen extends StatefulWidget {
  final String customerName;
  final String service;
  final String dateTime;
  final String address;

  const CancelBookingScreen({
    super.key,
    this.customerName = 'Priya Sharma',
    this.service = 'Home Cleaning',
    this.dateTime = 'Tue, 22 Apr 2025    10:00 AM',
    this.address = '123 Green Park, Sector 15, Noida, Uttar Pradesh 201301',
  });

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  String? _selectedReason;

  final List<String> _reasons = const [
    'Customer requested cancellation',
    'Unable to reach the customer',
    'Personal / emergency reason',
    'Schedule conflict',
    'Other',
  ];

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
              SizedBox(height: 50.h),
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
                      left: 121.w,
                      child: Text(
                        'Cancel Booking',
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
              SizedBox(height: 36.h),
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
                      value: widget.customerName,
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
                      value: widget.service,
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
                      value: widget.dateTime,
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
                      value: widget.address,
                      valueMaxLines: 2,
                    ),
                    SizedBox(height: 28.h),
                    // Reason for Cancellation
                    Text(
                      'Reason for Cancellation',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.09.sp,
                        height: 1.5,
                        color: const Color(0xFF2A2C2B),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Column(
                      children: _reasons.map((reason) {
                        final isSelected = _selectedReason == reason;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedReason = reason;
                              });
                            },
                            child: Container(
                              width: 331.w,
                              height: 48.1.h,
                              padding: EdgeInsets.symmetric(horizontal: 19.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: const Color(0xFFF4F4F4),
                                  width: 0.82,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      reason,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                        height: 1.5,
                                        color: const Color(0xFF2A2C2B),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 17.w,
                                    height: 17.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? const Color(0xFF95D041)
                                            : const Color(0xFFBDBDBD),
                                        width: 1.6,
                                      ),
                                    ),
                                    child: isSelected
                                        ? Container(
                                            width: 9.w,
                                            height: 9.h,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF95D041),
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20.h),
                    // Confirm Cancellation button
                    GestureDetector(
                      onTap: () {
                        // TODO: Confirm cancellation with selected reason
                        Navigator.of(context).pop();
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
                          'Confirm Cancellation',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.0,
                            color: const Color(0xFFEE0D0D),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Go Back button
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 330.w,
                        height: 49.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: const Color(0xFF838186),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Go Back',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.0,
                            color: const Color(0xFF1B1A1F),
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