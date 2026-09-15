import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddServicesScreen extends StatefulWidget {
  const AddServicesScreen({super.key});

  @override
  State<AddServicesScreen> createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends State<AddServicesScreen> {
  final List<Map<String, String>> _services = [
    {
      'icon': 'assets/icons/home_cleaning_icon.svg',
      'name': 'Home Cleaning',
      'price': 'Rs30 / hour',
    },
    {
      'icon': 'assets/icons/sofa_cleaning_icon.svg',
      'name': 'Sofa Cleaning',
      'price': 'Rs50 / hour',
    },
    {
      'icon': 'assets/icons/kitchen_cleaning_icon.svg',
      'name': 'Kitchen Cleaning',
      'price': 'Rs80 / hour',
    },
  ];

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
                      'Step 2 of 4',
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
                    child: _ProgressBar(currentStep: 2, totalSteps: 4),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              // Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Services',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        height: 1.54,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Column(
                      children: _services.map((service) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: _ServiceCard(
                            iconPath: service['icon']!,
                            name: service['name']!,
                            price: service['price']!,
                            onEdit: () {
                              // TODO: Edit this service
                            },
                            onDelete: () {
                              setState(() {
                                _services.remove(service);
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 12.h),
                    // Add New Service button
                    GestureDetector(
                      onTap: () {
                        // TODO: Show add-service form/dialog
                      },
                      child: DottedBorderContainer(
                        child: Center(
                          child: Text(
                            '+ Add New Service',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              height: 1.0,
                              color: const Color(0xFF739147),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Next button
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to Step 3 once built
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

class _ServiceCard extends StatelessWidget {
  final String iconPath;
  final String name;
  final String price;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ServiceCard({
    required this.iconPath,
    required this.name,
    required this.price,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 79.h,
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
                width: 23.14.w,
                height: 23.14.h,
              ),
            ),
          ),
          Positioned(
            top: 17.h,
            left: 71.w,
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
            top: 44.h,
            left: 71.w,
            child: SizedBox(
              width: 66.w,
              child: Text(
                price,
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
            top: 30.72.h,
            left: 268.w,
            child: GestureDetector(
              onTap: onEdit,
              child: SvgPicture.asset(
                'assets/icons/edit_pencil_icon.svg',
                width: 16.w,
                height: 16.56.h,
              ),
            ),
          ),
          Positioned(
            top: 30.h,
            left: 298.w,
            child: GestureDetector(
              onTap: onDelete,
              child: SvgPicture.asset(
                'assets/icons/delete_icon.svg',
                width: 18.w,
                height: 18.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  const DottedBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: const Color(0xFF739147),
        strokeWidth: 1.2,
        dashWidth: 3,
        dashSpace: 3,
        radius: 12,
      ),
      child: Container(
        width: 330.w,
        height: 49.h,
        decoration: BoxDecoration(
          color: const Color(0xFFECF7E0),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double radius;

  _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
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
                    color: Colors.white,
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