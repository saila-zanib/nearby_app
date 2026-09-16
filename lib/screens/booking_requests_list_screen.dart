import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingRequestsListScreen extends StatefulWidget {
  const BookingRequestsListScreen({super.key});

  @override
  State<BookingRequestsListScreen> createState() =>
      _BookingRequestsListScreenState();
}

class _BookingRequestsListScreenState
    extends State<BookingRequestsListScreen> {
  final List<Map<String, dynamic>> _requests = [
    {
      'name': 'Priya Sharma',
      'service': 'Home Cleaning',
      'dateTime': 'Tue, 22 Apr 2025    10:00 AM',
      'avatarColor': const Color(0xFFD9EDF5),
    },
    {
      'name': 'Neha Khan',
      'service': 'AC Repair',
      'dateTime': 'Tue, 22 Apr 2025    02:00 PM',
      'avatarColor': const Color(0xFFC9C3ED),
    },
    {
      'name': 'Rohit',
      'service': 'Plumbing',
      'dateTime': 'Wed, 23 Apr 2025    11:00 AM',
      'avatarColor': const Color(0xFFF6DFC3),
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
            SizedBox(height: 58.h),
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
                    left: 111.w,
                    child: Text(
                      'Booking Requests',
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
            SizedBox(height: 34.h),
            // List
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ListView.separated(
                  itemCount: _requests.length,
                  separatorBuilder: (_, _) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final request = _requests[index];
                    return _BookingRequestCard(
                      name: request['name'],
                      service: request['service'],
                      dateTime: request['dateTime'],
                      avatarColor: request['avatarColor'],
                      onDecline: () {
                        setState(() {
                          _requests.removeAt(index);
                        });
                      },
                      onAccept: () {
                        setState(() {
                          _requests.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingRequestCard extends StatelessWidget {
  final String name;
  final String service;
  final String dateTime;
  final Color avatarColor;
  final VoidCallback onDecline;
  final VoidCallback onAccept;

  const _BookingRequestCard({
    required this.name,
    required this.service,
    required this.dateTime,
    required this.avatarColor,
    required this.onDecline,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 119.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.91.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15.5.h,
            left: 12.5.w,
            child: Container(
              width: 43.w,
              height: 43.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: avatarColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/provider_person_white_icon.svg',
                width: 20.w,
                height: 23.68.h,
              ),
            ),
          ),
          Positioned(
            top: 14.h,
            left: 69.w,
            child: SizedBox(
              width: 194.w,
              child: Text(
                name,
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
              width: 86.w,
              child: Text(
                service,
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
            top: 61.h,
            left: 69.w,
            child: SizedBox(
              width: 188.w,
              child: Text(
                dateTime,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  height: 1.5,
                  color: const Color(0xFF919191),
                ),
              ),
            ),
          ),
          Positioned(
            top: 51.h,
            right: 15.w,
            child: Icon(
              Icons.chevron_right,
              size: 18.sp,
              color: const Color(0xFF525151),
            ),
          ),
          Positioned(
            top: 86.h,
            left: 198.w,
            child: GestureDetector(
              onTap: onDecline,
              child: Container(
                width: 57.w,
                height: 23.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFCECE).withOpacity(0.75),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  'Decline',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    height: 1.5,
                    color: const Color(0xFFED0000),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 86.h,
            left: 261.w,
            child: GestureDetector(
              onTap: onAccept,
              child: Container(
                width: 57.w,
                height: 23.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFB8F267),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  'Accept',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    height: 1.5,
                    color: Colors.black,
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