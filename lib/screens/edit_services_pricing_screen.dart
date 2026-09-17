import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditServicesPricingScreen extends StatefulWidget {
  const EditServicesPricingScreen({super.key});

  @override
  State<EditServicesPricingScreen> createState() =>
      _EditServicesPricingScreenState();
}

class _EditServicesPricingScreenState
    extends State<EditServicesPricingScreen> {
  final List<Map<String, String>> _services = [
    {
      'image': 'assets/images/regular_cleaning_image.png',
      'name': 'Regular Cleaning',
      'price': 'Rs. 1,400',
    },
    {
      'image': 'assets/images/deep_cleaning_image.png',
      'name': 'Deep Cleaning',
      'price': 'Rs. 2,200',
    },
    {
      'image': 'assets/images/kitchen_cleaning_image.png',
      'name': 'Kitchen Cleaning',
      'price': 'Rs. 1,800',
    },
  ];

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
                      left: 89.w,
                      child: Text(
                        'Edit Services & Pricing',
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
              // Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Services',
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
                          child: _ServiceEditCard(
                            imagePath: service['image']!,
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
                    // Add New Service button (dashed)
                    GestureDetector(
                      onTap: () {
                        // TODO: Show add-service form/dialog
                      },
                      child: _DashedBorderContainer(
                        width: 330.w,
                        height: 49.h,
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
                    // Save Changes button
                    GestureDetector(
                      onTap: () {
                        // TODO: Save changes to backend
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
                          'Save Changes',
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

class _ServiceEditCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ServiceEditCard({
    required this.imagePath,
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
            top: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                imagePath,
                width: 82.w,
                height: 79.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 17.h,
            left: 96.w,
            child: SizedBox(
              width: 160.w,
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
            left: 96.w,
            child: SizedBox(
              width: 52.w,
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
            top: 32.1.h,
            left: 268.w,
            child: GestureDetector(
              onTap: onEdit,
              child: SvgPicture.asset(
                'assets/icons/edit_pencil_icon.svg',
                width: 13.91.w,
                height: 15.18.h,
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

class _DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const _DashedBorderContainer({
    required this.child,
    required this.width,
    required this.height,
  });

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
        width: width,
        height: height,
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