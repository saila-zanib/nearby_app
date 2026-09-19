import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'my_bookings_provider_screen.dart';
import 'booking_requests_list_screen.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  bool _isAvailable = true;

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
              SizedBox(height: 61.h),
              // Header: avatar + greeting + bell
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage:
                          const AssetImage('assets/images/provider_avatar.png'),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Ahmed',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              height: 1.5,
                              color: const Color(0xFF2B2A2F),
                            ),
                          ),
                          Text(
                            'Service Provider',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              height: 1.0,
                              color: const Color(0xFF131313),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/notification_icon.svg',
                      width: 24.w,
                      height: 24.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              // Availability card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  width: 331.w,
                  height: 76.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.91.r),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 32.h,
                        left: 14.w,
                        child: Container(
                          width: 12.w,
                          height: 12.w,
                          decoration: const BoxDecoration(
                            color: Color(0xFF95D041),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16.h,
                        left: 37.w,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              height: 1.5,
                              letterSpacing: -0.14,
                            ),
                            children: [
                              const TextSpan(
                                text: 'You are ',
                                style: TextStyle(color: Color(0xFF1B1A1F)),
                              ),
                              const TextSpan(
                                text: 'available',
                                style: TextStyle(color: Color(0xFF95D041)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 41.h,
                        left: 37.w,
                        child: SizedBox(
                          width: 195.w,
                          child: Text(
                            'Customers can back your services',
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
                        top: 24.h,
                        left: 274.w,
                        child: SizedBox(
                          width: 49.w,
                          height: 27.h,
                          child: Switch(
                            value: _isAvailable,
                            onChanged: (value) {
                              setState(() {
                                _isAvailable = value;
                              });
                            },
                            activeColor: Colors.white,
                            activeTrackColor: const Color(0xFF95D041),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 33.h),
              // Stat cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: SizedBox(
                  width: 328.w,
                  height: 92.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatCard(
                        backgroundColor: const Color(0xFFEDF5F8),
                        iconBoxColor: const Color(0xFFD9EDF5),
                        iconBoxRadius: 0,
                        iconPath: 'assets/icons/today_bookings_icon.svg',
                        value: '3',
                        label: "Today's Bookings",
                      ),
                      _StatCard(
                        backgroundColor: const Color(0xFFECF7E0),
                        iconBoxColor: const Color(0xFFE0F3C5),
                        iconBoxRadius: 6.5,
                        iconPath: 'assets/icons/upcoming_icon.svg',
                        value: '5',
                        label: 'Upcoming',
                      ),
                      _StatCard(
                        backgroundColor: const Color(0xFFFBE4DD),
                        iconBoxColor: const Color(0xFFFFCCBE),
                        iconBoxRadius: 6.5,
                        iconPath: 'assets/icons/pending_requests_icon.svg',
                        value: '2',
                        label: 'Pending Requests',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              // Action cards section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Document Type',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.09.sp,
                        height: 1.5,
                        color: const Color(0xFF2A2C2B),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    _ActionCard(
                      iconPath: 'assets/icons/booking_requests_icon.svg',
                      title: 'Booking Requests',
                      description:
                          'View and respond to new boking requests.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingRequestsListScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    _ActionCard(
                      iconPath: 'assets/icons/booking_requests_icon.svg',
                      title: 'My Bookings',
                      description:
                          'Manage your upcoming and past bookings.',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MyBookingsProviderScreen(),
                          ),
                        );
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

class _StatCard extends StatelessWidget {
  final Color backgroundColor;
  final Color iconBoxColor;
  final double iconBoxRadius;
  final String iconPath;
  final String value;
  final String label;

  const _StatCard({
    required this.backgroundColor,
    required this.iconBoxColor,
    required this.iconBoxRadius,
    required this.iconPath,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 92.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 26.w,
            height: 26.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: iconBoxColor,
              borderRadius: BorderRadius.circular(iconBoxRadius.r),
            ),
            child: SvgPicture.asset(
              iconPath,
              width: 14.w,
              height: 14.h,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              height: 1.2,
              letterSpacing: -0.14,
              color: const Color(0xFF1B1A1F),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 9.sp,
              height: 1.2,
              letterSpacing: -0.09,
              color: const Color(0xFF7D7D7D),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ActionCard({
    required this.iconPath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 331.w,
        height: 91.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.91.r),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 17.h,
              left: 14.w,
              child: Container(
                width: 40.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFECF7E0),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SvgPicture.asset(
                  iconPath,
                  width: 25.w,
                  height: 27.38.h,
                ),
              ),
            ),
            Positioned(
              top: 14.h,
              left: 69.w,
              child: SizedBox(
                width: 194.w,
                child: Text(
                  title,
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
            Positioned(
              top: 41.h,
              left: 69.w,
              child: SizedBox(
                width: 223.w,
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
              top: 40.h,
              right: 17.w,
              child: Icon(
                Icons.chevron_right,
                size: 18.sp,
                color: const Color(0xFF525151),
              ),
            ),
          ],
        ),
      ),
    );
  }
}