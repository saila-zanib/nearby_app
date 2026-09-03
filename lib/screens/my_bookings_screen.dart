import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import 'booking_details_screen.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  final List<Map<String, String>> _bookings = const [
    {
      'name': 'FreshNest Cleaning',
      'subtitle': 'House Cleaning Service',
      'date': 'Tue, 12 Aug 2025',
      'time': '10:00 AM - 12:00 PM',
      'address': 'DHA Phase 5, Lahore',
      'price': 'PKR 2,500',
      'image': 'assets/images/booking_1.png',
    },
    {
      'name': 'FreshNest Cleaning',
      'subtitle': 'Deep Cleaning',
      'date': 'Fri, 15 Aug 2025',
      'time': '02:00 PM - 04:00 PM',
      'address': 'DHA Phase 5, Lahore',
      'price': 'PKR 3,500',
      'image': 'assets/images/booking_2.png',
    },
    {
      'name': 'FreshNest Cleaning',
      'subtitle': 'Kitchen Cleaning',
      'date': 'Mon, 18 Aug 2025',
      'time': '11:00 PM - 01:00 PM',
      'address': 'DHA Phase 5, Lahore',
      'price': 'PKR 1,800',
      'image': 'assets/images/booking_3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
            top: 16.h,
            bottom: 32.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Bookings",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: 0,
                  color: const Color(0xFF2B2A2F),
                ),
              ),

              SizedBox(height: 16.h),

              Column(
                children: _bookings.map((booking) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const BookingDetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 330.w,
                        height: 198.h,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  booking['image']!,
                                  width: 145.w,
                                  height: 140.h,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 12.h,
                                      right: 12.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          booking['name']!,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            letterSpacing: -0.01,
                                            color:
                                                const Color(0xFF1B1A1F),
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          booking['subtitle']!,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            letterSpacing: -0.01,
                                            color:
                                                const Color(0xFF7D7D7D),
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                        Text(
                                          booking['date']!,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            letterSpacing: -0.01,
                                            color:
                                                const Color(0xFF1B1A1F),
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          booking['time']!,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            letterSpacing: -0.01,
                                            color:
                                                const Color(0xFF1B1A1F),
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          booking['address']!,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            letterSpacing: -0.01,
                                            color:
                                                const Color(0xFF1B1A1F),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 70.w,
                                    height: 22.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEAF7DC),
                                      borderRadius:
                                          BorderRadius.circular(8.r),
                                    ),
                                    child: Text(
                                      "Confirmed",
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.03,
                                        color: const Color(0xFF8ECE35),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    booking['price']!,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      letterSpacing: -0.01,
                                      color: const Color(0xFF1B1A1F),
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
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}