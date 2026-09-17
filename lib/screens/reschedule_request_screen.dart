import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RescheduleRequestScreen extends StatefulWidget {
  final String customerName;
  final String service;
  final String currentDateTime;
  final String address;

  const RescheduleRequestScreen({
    super.key,
    this.customerName = 'Piya Sharma',
    this.service = 'Home Cleaning',
    this.currentDateTime = 'Tue, 22 Apr 2026 . 10:00 AM',
    this.address = '123 Green Park, Sector 15, Noida, Uttar Pradesh 201301',
  });

  @override
  State<RescheduleRequestScreen> createState() =>
      _RescheduleRequestScreenState();
}

class _RescheduleRequestScreenState extends State<RescheduleRequestScreen> {
  String? _selectedReason;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final TextEditingController _noteController = TextEditingController();

  final List<String> _reasons = const [
    'Customer requested new time',
    'Provider unavailable',
    'Weather/travel issue',
    'Other',
  ];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() => _selectedDate = date);
    }
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    }
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
              SizedBox(height: 48.h),
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
                      left: 97.w,
                      child: Text(
                        'Reschedule Request',
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
              SizedBox(height: 35.h),
              // Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Booking Details summary card
                    Container(
                      width: 330.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 17.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking Details',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              height: 1.5,
                              letterSpacing: -0.15,
                              color: const Color(0xFF1B1A1F),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          _DetailRow(
                            label: 'Customer Name',
                            value: widget.customerName,
                          ),
                          SizedBox(height: 8.h),
                          _DetailRow(
                            label: 'Service',
                            value: widget.service,
                          ),
                          SizedBox(height: 8.h),
                          _DetailRow(
                            label: 'Current Date & Time',
                            value: widget.currentDateTime,
                          ),
                          SizedBox(height: 8.h),
                          _DetailRow(
                            label: 'Address',
                            value: widget.address,
                            valueMaxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 21.h),
                    // Reason for Rescheduling
                    Text(
                      'Reason for Rescheduling',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.09.sp,
                        height: 1.5,
                        color: const Color(0xFF2A2C2B),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
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
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedReason,
                          isExpanded: true,
                          hint: Text(
                            'Choose reason',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 13.09.sp,
                              height: 1.5,
                              color: const Color(0xFF7C7C7C),
                            ),
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: const Color(0xFF525151),
                          ),
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.09.sp,
                            height: 1.5,
                            color: const Color(0xFF2A2C2B),
                          ),
                          items: _reasons.map((reason) {
                            return DropdownMenuItem(
                              value: reason,
                              child: Text(reason),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() => _selectedReason = value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // New Date
                    Text(
                      'New Date',
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
                      onTap: _pickDate,
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
                              _selectedDate == null
                                  ? 'Choose date'
                                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 13.09.sp,
                                height: 1.5,
                                color: _selectedDate == null
                                    ? const Color(0xFF7C7C7C)
                                    : const Color(0xFF2A2C2B),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: const Color(0xFF525151),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // New Time
                    Text(
                      'New Time',
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
                      onTap: _pickTime,
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
                              _selectedTime == null
                                  ? 'Choose time'
                                  : _selectedTime!.format(context),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 13.09.sp,
                                height: 1.5,
                                color: _selectedTime == null
                                    ? const Color(0xFF7C7C7C)
                                    : const Color(0xFF2A2C2B),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: const Color(0xFF525151),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // Additional Note
                    Text(
                      'Additional Note (Optional)',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.09.sp,
                        height: 1.5,
                        color: const Color(0xFF2A2C2B),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: 331.w,
                      height: 90.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.73.r),
                        border: Border.all(
                          color: const Color(0xFFF4F4F4),
                          width: 0.82,
                        ),
                      ),
                      child: TextField(
                        controller: _noteController,
                        maxLines: 3,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13.09.sp,
                          color: const Color(0xFF2A2C2B),
                        ),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          border: InputBorder.none,
                          hintText: 'Type your message here...',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.09.sp,
                            color: const Color(0xFF7C7C7C),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // Send Reschedule Request button
                    GestureDetector(
                      onTap: () {
                        // TODO: Send reschedule request to backend
                        Navigator.of(context).pop();
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
                          'Send Reschedule Request',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            height: 1.0,
                            color: Colors.black,
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

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final int valueMaxLines;

  const _DetailRow({
    required this.label,
    required this.value,
    this.valueMaxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 137.w,
          child: Text(
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
        ),
        Expanded(
          child: Text(
            value,
            maxLines: valueMaxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              height: 1.5,
              letterSpacing: -0.12,
              color: const Color(0xFF1B1A1F),
            ),
          ),
        ),
      ],
    );
  }
}