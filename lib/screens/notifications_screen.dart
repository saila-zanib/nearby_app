import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static final List<Map<String, dynamic>> _notifications = [
    {
      'icon': 'assets/icons/booking_confirmed_icon.svg',
      'title': 'Booking Confirmed',
      'description': 'Your booking has been confirmed successfully.',
      'time': '10:30 AM',
      'unread': true,
    },
    {
      'icon': 'assets/icons/booking_reminder_icon.svg',
      'title': 'Booking Reminder',
      'description': "Don't forget! You have a booking tomorrow.",
      'time': 'Yesterday',
      'unread': true,
    },
    {
      'icon': 'assets/icons/booking_rescheduled_icon.svg',
      'title': 'Booking Rescheduled',
      'description':
          'Your booking has been rescheduled. Please check the new date and time.',
      'time': '2 Days Ago',
      'unread': true,
    },
    {
      'icon': 'assets/icons/booking_completed_icon.svg',
      'title': 'Booking Completed',
      'description':
          'Your booking has been completed. Thank you for using our services.',
      'time': '3 Days Ago',
      'unread': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F9),
      body: SafeArea(
        top: false,
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
                    left: 133.w,
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
            SizedBox(height: 42.h),
            // List container
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  width: 339.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.91.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section header row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booking Updates & Reminders',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              height: 1.54,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // TODO: mark all notifications as read
                            },
                            child: Text(
                              'Mark all as read',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                height: 1.5,
                                color: const Color(0xFF9AD448),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      // Notification cards
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: _notifications.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            final notif = _notifications[index];
                            return _NotificationCard(notification: notif);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final Map<String, dynamic> notification;
  const _NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 98.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.91.r),
      ),
      child: Stack(
        children: [
          // Icon box
          Positioned(
            top: 29.h,
            left: 17.w,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: const Color(0xFFECF7E0),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  notification['icon'],
                  width: 18.w,
                  height: 20.69.h,
                ),
              ),
            ),
          ),
          // Title
          Positioned(
            top: 16.h,
            left: 79.w,
            child: SizedBox(
              width: 194.w,
              child: Text(
                notification['title'],
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  height: 1.5,
                  letterSpacing: -0.15,
                  color: const Color(0xFF1B1A1F),
                ),
              ),
            ),
          ),
          // Description
          Positioned(
            top: 45.h,
            left: 79.w,
            child: SizedBox(
              width: 207.w,
              child: Text(
                notification['description'],
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
          // Timestamp
          Positioned(
            top: 22.h,
            left: notification['title'] == 'Booking Confirmed'
                ? 276.w
                : 272.w,
            child: SizedBox(
              width: 54.w,
              child: Text(
                notification['time'],
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  height: 1.5,
                  letterSpacing: -0.1,
                  color: const Color(0xFF7D7D7D),
                ),
              ),
            ),
          ),
          // Unread dot
          if (notification['unread'] == true)
            Positioned(
              top: 49.25.h,
              left: 309.25.w,
              child: Container(
                width: 9.5.w,
                height: 9.5.h,
                decoration: const BoxDecoration(
                  color: Color(0xFF1D9132),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}