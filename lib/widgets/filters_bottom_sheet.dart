import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showFiltersBottomSheet(
  BuildContext context, {
  required String initialFilter,
  required void Function(String) onApply,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return const _FiltersBottomSheetContent();
    },
  );
}

class _FiltersBottomSheetContent extends StatefulWidget {
  const _FiltersBottomSheetContent();

  @override
  State<_FiltersBottomSheetContent> createState() =>
      _FiltersBottomSheetContentState();
}

class _FiltersBottomSheetContentState
    extends State<_FiltersBottomSheetContent> {
  String _rating = "Any";
  String _price = "Any";
  String _distance = "Any";
  String _availability = "Any";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              "Filters",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                height: 1.0,
                letterSpacing: 0,
                color: const Color(0xFF1B1A1F),
              ),
            ),

            SizedBox(height: 28.h),

            _filterRow("Rating", _rating, (value) {
              setState(() => _rating = value);
            }),
            Divider(
              height: 1,
              thickness: 0.7,
              color: const Color(0xFFEFEFEF),
            ),

            _filterRow("Price", _price, (value) {
              setState(() => _price = value);
            }),
            Divider(
              height: 1,
              thickness: 0.7,
              color: const Color(0xFFEFEFEF),
            ),

            _filterRow("Distance", _distance, (value) {
              setState(() => _distance = value);
            }),
            Divider(
              height: 1,
              thickness: 0.7,
              color: const Color(0xFFEFEFEF),
            ),

            _filterRow("Availability", _availability, (value) {
              setState(() => _availability = value);
            }),
            Divider(
              height: 1,
              thickness: 0.7,
              color: const Color(0xFFEFEFEF),
            ),

            SizedBox(height: 28.h),

            SizedBox(
              width: 330.w,
              height: 49.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9DDA47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // TODO: Navigate to Search result once built
                },
                child: Text(
                  "Apply Filters",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1B1A1F),
                  ),
                ),
              ),
            ),

            SizedBox(height: 14.h),

            SizedBox(
              width: 330.w,
              height: 49.h,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFF838186),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _rating = "Any";
                    _price = "Any";
                    _distance = "Any";
                    _availability = "Any";
                  });
                },
                child: Text(
                  "Reset",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1B1A1F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterRow(
    String label,
    String value,
    void Function(String) onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 1.0,
              letterSpacing: 0,
              color: const Color(0xFF1B1A1F),
            ),
          ),
          GestureDetector(
            onTap: () {
              // TODO: Show dropdown/picker for this filter
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: 0,
                    color: const Color(0xFF767676),
                  ),
                ),
                SizedBox(width: 6.w),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 14.sp,
                  color: const Color(0xFF767676),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}