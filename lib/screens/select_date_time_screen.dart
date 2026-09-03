import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import 'booking_summary_screen.dart';

class SelectDateTimeScreen extends StatefulWidget {
  const SelectDateTimeScreen({super.key});

  @override
  State<SelectDateTimeScreen> createState() => _SelectDateTimeScreenState();
}

class _SelectDateTimeScreenState extends State<SelectDateTimeScreen> {
  int _selectedDateIndex = 2; // Wed 7 selected by default
  int _selectedTimeIndex = 1; // 10:00 AM selected by default

  final List<Map<String, String>> _dates = const [
    {'day': 'Mon', 'date': '5'},
    {'day': 'Tue', 'date': '6'},
    {'day': 'Wed', 'date': '7'},
    {'day': 'Thu', 'date': '8'},
    {'day': 'Fri', 'date': '9'},
    {'day': 'Sat', 'date': '10'},
    {'day': 'Sun', 'date': '11'},
  ];

  final List<String> _times = const [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
  ];

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
                      "Choose Date & Time",
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

              // Provider info card
              Container(
                width: 330.w,
                height: 107.h,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/freshnest_datetime.png',
                      width: 83.w,
                      height: 107.h,
                      fit: BoxFit.cover,
                      alignment: const Alignment(0, -0.3),
                    ),
                    SizedBox(width: 22.w),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 12.h,
                          bottom: 12.h,
                          right: 47.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            SizedBox(height: 6.h),
                            Text(
                              "House Cleaning Service",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                letterSpacing: -0.01,
                                color: const Color(0xFF7D7D7D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Select Date heading
              Text(
                "Select Date",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: 0,
                  color: const Color(0xFF1B1A1F),
                ),
              ),

              SizedBox(height: 12.h),

              // Date chips
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_dates.length, (index) {
                  final date = _dates[index];
                  final isSelected = _selectedDateIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDateIndex = index),
                    child: Container(
                      width: 44.w,
                      height: 63.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF9DDA47)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(7.r),
                        border: isSelected
                            ? null
                            : Border.all(
                                color: const Color(0xFFE4E4E4),
                                width: 1.3,
                              ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            date['day']!,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              letterSpacing: -0.01,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF5C5D61),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            date['date']!,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              letterSpacing: -0.01,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF020202),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 24.h),

              // Select Time heading
              Text(
                "Select Time",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: 0,
                  color: const Color(0xFF1B1A1F),
                ),
              ),

              SizedBox(height: 12.h),

              // Time slots grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 103 / 48,
                ),
                itemCount: _times.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedTimeIndex == index;
                  return GestureDetector(
                    onTap: () =>
                        setState(() => _selectedTimeIndex = index),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.r),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF9AD448)
                              : const Color(0xFFE4E4E4),
                          width: 1.4,
                        ),
                      ),
                      child: Text(
                        _times[index],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          letterSpacing: -0.01,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 24.h),

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingSummaryScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Continue",
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
}