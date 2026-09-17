import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAvailabilityScreen extends StatefulWidget {
  const EditAvailabilityScreen({super.key});

  @override
  State<EditAvailabilityScreen> createState() =>
      _EditAvailabilityScreenState();
}

class _EditAvailabilityScreenState extends State<EditAvailabilityScreen> {
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final Set<String> _selectedDays = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri'};

  final List<String> _timeSlots = ['09:00 AM - 06:00 PM'];
  bool _vacationMode = false;

  void _toggleDay(String day) {
    setState(() {
      if (_selectedDays.contains(day)) {
        _selectedDays.remove(day);
      } else {
        _selectedDays.add(day);
      }
    });
  }

  Future<void> _addTimeSlot() async {
    final startTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
      helpText: 'Select Start Time',
    );
    if (startTime == null || !mounted) return;

    final endTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 18, minute: 0),
      helpText: 'Select End Time',
    );
    if (endTime == null || !mounted) return;

    setState(() {
      _timeSlots.add(
        '${startTime.format(context)} - ${endTime.format(context)}',
      );
    });
  }

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
                      left: 119.w,
                      child: Text(
                        'Edit Availability',
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
              // Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Working Days
                    Text(
                      'Working Days',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        height: 1.5,
                        color: const Color(0xFF1B1A1F),
                      ),
                    ),
                    Text(
                      'Select the days you are available for bookings.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        height: 1.54,
                        color: const Color(0xFF7E7E93),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: 332.w,
                      height: 63.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: _days.map((day) {
                          final isSelected = _selectedDays.contains(day);
                          return GestureDetector(
                            onTap: () => _toggleDay(day),
                            child: Container(
                              width: 44.w,
                              height: 63.h,
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFFECF7E0)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(7.r),
                                border: Border.all(
                                  color: const Color(0xFFE4E4E4),
                                  width: 1.3,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 17.w,
                                    height: 15.94.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xFF95D041)
                                          : Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(4.25.r),
                                      border: isSelected
                                          ? null
                                          : Border.all(
                                              color: const Color(0xFFD5D5D5),
                                              width: 1.3,
                                            ),
                                    ),
                                    child: isSelected
                                        ? Icon(
                                            Icons.check,
                                            size: 10.sp,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    day,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      height: 1.2,
                                      letterSpacing: -0.12,
                                      color: isSelected
                                          ? const Color(0xFF020202)
                                          : const Color(0xFFC9C9C9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Working Hours title
                    Text(
                      'Working Hours',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.09.sp,
                        height: 1.5,
                        color: const Color(0xFF2A2C2B),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // Subtitle + Add Time Slot button on same row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Set your daily time slots.',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            height: 1.54,
                            color: const Color(0xFF7E7E93),
                          ),
                        ),
                        GestureDetector(
                          onTap: _addTimeSlot,
                          child: Container(
                            width: 96.w,
                            height: 23.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFECF7E0),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              '+ Add Time Slot',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 9.41.sp,
                                height: 1.0,
                                color: const Color(0xFF739147),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Column(
                      children: _timeSlots.map((slot) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Container(
                            width: 331.w,
                            height: 60.h,
                            padding: EdgeInsets.symmetric(horizontal: 19.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.73.r),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  slot,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.09.sp,
                                    height: 1.5,
                                    color: const Color(0xFF2A2C2B),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  size: 18.sp,
                                  color: const Color(0xFF525151),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 12.h),
                    // Vacation Mode card
                    Container(
                      width: 331.w,
                      height: 76.h,
                      padding: EdgeInsets.symmetric(horizontal: 23.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11.91.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Vacation Mode',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    height: 1.5,
                                    letterSpacing: -0.14,
                                    color: const Color(0xFF1B1A1F),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Temporarily stop receiving new bookings.',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    height: 1.5,
                                    letterSpacing: -0.12,
                                    color: const Color(0xFF7D7D7D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() => _vacationMode = !_vacationMode);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 49.w,
                              height: 27.h,
                              padding: EdgeInsets.all(2.5.w),
                              decoration: BoxDecoration(
                                color: _vacationMode
                                    ? const Color(0xFF95D041)
                                    : const Color(0xFFE5E5E5),
                                borderRadius: BorderRadius.circular(26.r),
                              ),
                              child: AnimatedAlign(
                                duration: const Duration(milliseconds: 200),
                                alignment: _vacationMode
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
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
                        ],
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