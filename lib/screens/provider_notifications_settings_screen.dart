import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderNotificationsSettingsScreen extends StatefulWidget {
  const ProviderNotificationsSettingsScreen({super.key});

  @override
  State<ProviderNotificationsSettingsScreen> createState() =>
      _ProviderNotificationsSettingsScreenState();
}

class _ProviderNotificationsSettingsScreenState
    extends State<ProviderNotificationsSettingsScreen> {
  bool _newBookingRequests = true;
  bool _bookingCancellation = true;
  bool _reviewReceived = true;

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
              SizedBox(height: 55.h),
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
                      left: 130.w,
                      child: Text(
                        'Notifications',
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
              SizedBox(height: 24.h),
              // Notification cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    _NotificationToggleCard(
                      title: 'New Booking Requests',
                      description:
                          'Get notified when a customer sends a\nbooking request.',
                      value: _newBookingRequests,
                      onChanged: (value) {
                        setState(() => _newBookingRequests = value);
                      },
                    ),
                    SizedBox(height: 12.h),
                    _NotificationToggleCard(
                      title: 'Booking Cancellation',
                      description:
                          'Get notified when a booking is\ncancelled.',
                      value: _bookingCancellation,
                      onChanged: (value) {
                        setState(() => _bookingCancellation = value);
                      },
                    ),
                    SizedBox(height: 12.h),
                    _NotificationToggleCard(
                      title: 'Review Received',
                      description:
                          'Get notified when a customer\nleaves a review.',
                      value: _reviewReceived,
                      onChanged: (value) {
                        setState(() => _reviewReceived = value);
                      },
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

class _NotificationToggleCard extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationToggleCard({
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 92.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.91.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16.h,
            left: 20.w,
            child: SizedBox(
              width: 194.w,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  height: 1.5,
                  letterSpacing: -0.14,
                  color: const Color(0xFF1B1A1F),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            child: SizedBox(
              width: 214.w,
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  height: 1.5,
                  letterSpacing: -0.12,
                  color: const Color(0xFF7D7D7D),
                ),
              ),
            ),
          ),
          Positioned(
            top: 32.h,
            left: 273.w,
            child: GestureDetector(
              onTap: () => onChanged(!value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 49.w,
                height: 27.h,
                padding: EdgeInsets.all(2.5.w),
                decoration: BoxDecoration(
                  color: value
                      ? const Color(0xFF95D041)
                      : const Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(26.r),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment:
                      value ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: 22.w,
                    height: 22.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}