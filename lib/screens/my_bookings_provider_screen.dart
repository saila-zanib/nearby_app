import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'booking_details_provider_screen.dart';

class MyBookingsProviderScreen extends StatefulWidget {
  const MyBookingsProviderScreen({super.key});

  @override
  State<MyBookingsProviderScreen> createState() =>
      _MyBookingsProviderScreenState();
}

class _MyBookingsProviderScreenState extends State<MyBookingsProviderScreen> {
  String _selectedTab = 'Upcoming';
  final List<String> _tabs = ['Upcoming', 'Ongoing', 'Completed', 'Cancelled'];

  final List<Map<String, dynamic>> _bookings = [
    {
      'name': 'Priya Sharma',
      'service': 'Home Cleaning',
      'dateTime': 'Tue, 22 Apr 2025    10:00 AM',
      'address': '123 Green Park, Sector 15, Noida, Uttar Pradesh 201301',
      'status': 'Upcoming',
      'avatarColor': const Color(0xFFD9EDF5),
    },
    {
      'name': 'Neha Khan',
      'service': 'AC Repair',
      'dateTime': 'Tue, 22 Apr 2025    02:00 PM',
      'address': '45 Sector 18, Noida, Uttar Pradesh 201301',
      'status': 'Upcoming',
      'avatarColor': const Color(0xFFC9C3ED),
    },
    {
      'name': 'Rohit',
      'service': 'Plumbing',
      'dateTime': 'Wed, 23 Apr 2025    11:00 AM',
      'address': '78 Model Town, Faisalabad, Punjab 38000',
      'status': 'Upcoming',
      'avatarColor': const Color(0xFFF6DFC3),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredBookings =
        _bookings.where((b) => b['status'] == _selectedTab).toList();

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
                    left: 132.w,
                    child: Text(
                      'My Bookings',
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
            SizedBox(height: 41.h),
            // Tab row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _tabs.map((tab) {
                  final isActive = _selectedTab == tab;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedTab = tab),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          tab,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                            height: 17.75 / 14,
                            color: isActive
                                ? const Color(0xFF9AD448)
                                : const Color(0xFF8E8E8E),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        if (isActive)
                          Container(
                            width: 40.w,
                            height: 2.h,
                            color: const Color(0xFF9AD448),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 24.h),
            // Bookings list
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: filteredBookings.isEmpty
                    ? Center(
                        child: Text(
                          'No $_selectedTab bookings',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14.sp,
                            color: const Color(0xFF8E8E8E),
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: filteredBookings.length,
                        separatorBuilder: (_, _) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          final booking = filteredBookings[index];
                          return _BookingCard(
                            name: booking['name'],
                            service: booking['service'],
                            dateTime: booking['dateTime'],
                            status: booking['status'],
                            avatarColor: booking['avatarColor'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BookingDetailsProviderScreen(
                                    customerName: booking['name'],
                                    service: booking['service'],
                                    dateTime: booking['dateTime'],
                                    address: booking['address'],
                                  ),
                                ),
                              );
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

class _BookingCard extends StatelessWidget {
  final String name;
  final String service;
  final String dateTime;
  final String status;
  final Color avatarColor;
  final VoidCallback onTap;

  const _BookingCard({
    required this.name,
    required this.service,
    required this.dateTime,
    required this.status,
    required this.avatarColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 331.w,
        height: 96.h,
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
                  height: 21.64.h,
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
              top: 14.h,
              left: 250.w,
              child: Container(
                width: 66.w,
                height: 22.25.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFECF7E0),
                  borderRadius: BorderRadius.circular(16.8.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 9.1.sp,
                    height: 1.5,
                    color: const Color(0xFF739147),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 56.h,
              right: 15.w,
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