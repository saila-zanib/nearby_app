import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'document_verification_screen.dart';

class WorkingScheduleScreen extends StatefulWidget {
  const WorkingScheduleScreen({super.key});

  @override
  State<WorkingScheduleScreen> createState() => _WorkingScheduleScreenState();
}

class _WorkingScheduleScreenState extends State<WorkingScheduleScreen> {
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final Set<String> _selectedDays = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri'};

  String _workingHours = '09:00 AM - 06:00 PM';
  String _serviceArea = 'Within 10 Km';

  void _toggleDay(String day) {
    setState(() {
      if (_selectedDays.contains(day)) {
        _selectedDays.remove(day);
      } else {
        _selectedDays.add(day);
      }
    });
  }

  Future<void> _selectWorkingHours() async {
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
      _workingHours =
          '${startTime.format(context)} - ${endTime.format(context)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F9),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 58.h),
              // Header block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: SizedBox(
                      width: double.infinity,
                      height: 24.h,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                              Icons.arrow_back,
                              size: 22.sp,
                              color: const Color(0xFF2B2A2F),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Provider Profile setup',
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
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      'Step 3 of 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        height: 1.54,
                        color: const Color(0xFF7E7E93),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: _ProgressBar(currentStep: 3, totalSteps: 4),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
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
                    // Working Hours
                    Text(
                      'Working Hours / Time Slots',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.09.sp,
                        height: 1.5,
                        color: const Color(0xFF2A2C2B),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    GestureDetector(
                      onTap: _selectWorkingHours,
                      child: Container(
                        width: 331.w,
                        height: 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 19.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.73.r),
                          border: Border.all(
                            color: const Color(0xFFF4F4F4),
                            width: 0.82,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _workingHours,
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
                    ),
                    SizedBox(height: 24.h),
                    // Service Area
                    Text(
                      'Service Area / Radius',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.09.sp,
                        height: 1.5,
                        color: const Color(0xFF2A2C2B),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    GestureDetector(
                      onTap: () {
                        // TODO: Show service area/radius picker
                      },
                      child: Container(
                        width: 331.w,
                        height: 60.h,
                        padding: EdgeInsets.symmetric(horizontal: 19.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.73.r),
                          border: Border.all(
                            color: const Color(0xFFF4F4F4),
                            width: 0.82,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _serviceArea,
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
                    ),
                    SizedBox(height: 32.h),
                    // Next button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DocumentVerificationScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 330.w,
                        height: 49.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8F267),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Next',
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

class _ProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const _ProgressBar({required this.currentStep, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 273.w,
      height: 21.33.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 2.55,
            color: const Color(0xFFDADADA),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(totalSteps, (index) {
              final stepNumber = index + 1;
              final isActive = stepNumber == currentStep;
              return Container(
                width: 21.33.w,
                height: 21.33.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF95D041)
                      : const Color(0xFFDADADA),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$stepNumber',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.38.sp,
                    height: 1.54,
                    color: isActive ? Colors.white : const Color(0xFF9A9A9A),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}