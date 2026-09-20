import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'profile_under_review_screen.dart';

class DocumentVerificationScreen extends StatefulWidget {
  const DocumentVerificationScreen({super.key});

  @override
  State<DocumentVerificationScreen> createState() =>
      _DocumentVerificationScreenState();
}

class _DocumentVerificationScreenState
    extends State<DocumentVerificationScreen> {
  String? _selectedDocumentType;
  String? _uploadedFileName;

  final List<String> _documentTypes = const [
    'CNIC',
    'Passport',
    'Driving License',
  ];

  Future<void> _pickDocument() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _uploadedFileName = pickedFile.name;
      });
    }
  }

  void _submitForReview() {
    // TODO: Submit provider profile data to backend
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileUnderReviewScreen(),
      ),
      (route) => false,
    );
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
                      'Step 4 of 4',
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
                    child: _ProgressBar(currentStep: 4, totalSteps: 4),
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
                    // Document Type
                    Text(
                      'Document Type',
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
                          value: _selectedDocumentType,
                          isExpanded: true,
                          hint: Text(
                            'Select document type',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 13.09.sp,
                              height: 1.5,
                              color: const Color(0xFF2A2C2B),
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
                          items: _documentTypes.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedDocumentType = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    // Upload Document
                    Text(
                      'Upload Document',
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
                      onTap: _pickDocument,
                      child: DottedBorderContainer(
                        width: 330.w,
                        height: 105.h,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/upload_icon.svg',
                                width: 39.w,
                                height: 32.7.h,
                              ),
                              SizedBox(height: 8.h),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  _uploadedFileName ?? 'Tap to Upload',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.03.sp,
                                    height: 1.35,
                                    color: const Color(0xFF739147),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'PDF, JPG, PNG up to 5MB',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.03.sp,
                                  height: 1.35,
                                  color: const Color(0xFF8E8E8E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    // Submit for Review button
                    GestureDetector(
                      onTap: _submitForReview,
                      child: Container(
                        width: 330.w,
                        height: 49.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8F267),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Submit for Review',
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

class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const DottedBorderContainer({
    super.key,
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