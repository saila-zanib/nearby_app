import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../widgets/filters_bottom_sheet.dart';
import 'search_result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> _categories = const [
    {
      'label': 'Home\nCleaning',
      'image': 'assets/images/category_home_cleaning.png',
      'icon': 'assets/icons/category_home_icon.svg',
    },
    {
      'label': 'Sofa\nCleaning',
      'image': 'assets/images/category_sofa_cleaning.png',
      'icon': 'assets/icons/category_sofa_icon.svg',
    },
    {
      'label': 'Kitchen\nCleaning',
      'image': 'assets/images/category_kitchen_cleaning.png',
      'icon': 'assets/icons/category_kitchen_icon.svg',
    },
  ];

  final List<Map<String, dynamic>> _nearbyProviders = const [
    {
      'name': 'Sparkle Home Cleaners',
      'rating': '4.9 (120)',
      'distance': '1.2 km away',
      'price': 'Rs. 1,500',
      'image': 'assets/images/provider_1.png',
    },
    {
      'name': 'FreshNest Cleaning',
      'rating': '4.8 (98)',
      'distance': '1.5 km away',
      'price': 'Rs. 1,400',
      'image': 'assets/images/provider_2.png',
    },
    {
      'name': 'CleanCare Home Services',
      'rating': '4.7 (76)',
      'distance': '2.0 km away',
      'price': 'Rs. 1,600',
      'image': 'assets/images/provider_3.png',
    },
  ];

  final List<Map<String, String>> _topRated = const [
    {
      'name': 'Elite Cleaners',
      'rating': '4.9 (200+)',
      'distance': '1.3 km away',
      'image': 'assets/images/top_rated_1.png',
    },
    {
      'name': 'Spotless Pro',
      'rating': '4.8 (150+)',
      'distance': '1.6 km away',
      'image': 'assets/images/top_rated_2.png',
    },
  ];

  Widget _categoryIcon(String label, String iconPath) {
    if (label.startsWith('Kitchen')) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 34.w,
            height: 34.w,
            decoration: const BoxDecoration(
              color: Color(0xFFF4FFE6),
              shape: BoxShape.circle,
            ),
          ),
          SvgPicture.asset(
            iconPath,
            width: 18.w,
            height: 18.w,
          ),
        ],
      );
    }
    return SvgPicture.asset(
      iconPath,
      width: 34.w,
      height: 34.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: avatar + greeting/location + bell
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: AppColors.primary,
                      backgroundImage: const AssetImage(
                          'assets/images/good_morning_avatar.png'),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              letterSpacing: 0,
                              color: const Color(0xFF2B2A2F),
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/location_icon.svg',
                                width: 11.w,
                                height: 14.67.h,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF9AD448),
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                "Lahore, Pakistan",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.0,
                                  letterSpacing: 0,
                                  color: const Color(0xFF131313),
                                ),
                              ),
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                'assets/icons/down_arrow.svg',
                                width: 7.w,
                                height: 3.89.h,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF131313),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/bell_icon.svg',
                      width: 22.w,
                      height: 22.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF2B2A2F),
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Search bar (tappable -> Search Result screen)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Container(
                  width: 327.w,
                  height: 53.h,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color(0xFFE8E9EC),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SearchResultScreen(),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/icons/search_icon.svg',
                          width: 20.w,
                          height: 20.w,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF2B2A2F),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SearchResultScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Search for cleaning services...",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              letterSpacing: 0,
                              color: const Color(0xFF737B98),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showFiltersBottomSheet(
                            context,
                            initialFilter: "Any",
                            onApply: (value) {
                              // TODO: Apply filter and navigate to Search result
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/icons/filter_icon.svg',
                          width: 20.w,
                          height: 20.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Categories heading + See all (same margin as other sections)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: _sectionHeader(
                  "Categories",
                  onSeeAll: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchResultScreen(),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 12.h),

              // Categories cards (narrower padding to fit 3 cards)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _categories.map((category) {
                    return Container(
                      width: 116.w,
                      height: 159.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            category['image']!,
                            width: 116.w,
                            height: 106.h,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.symmetric(horizontal: 6.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _categoryIcon(
                                    category['label']!,
                                    category['icon']!,
                                  ),
                                  SizedBox(width: 4.w),
                                  Flexible(
                                    child: Text(
                                      category['label']!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3,
                                        letterSpacing: -0.01,
                                        color: const Color(0xFF1B1A1F),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 24.h),

              // Nearby Providers heading + See all
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionHeader(
                      "Nearby Providers",
                      onSeeAll: () {
                        // TODO: Navigate to full list once built
                      },
                    ),
                    SizedBox(height: 12.h),
                    Column(
                      children: _nearbyProviders.map((provider) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: GestureDetector(
                            onTap: () {
                              // TODO: Navigate to Provider profile once built
                            },
                            child: Container(
                              width: 328.w,
                              height: 121.h,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    provider['image'] as String,
                                    width: 128.w,
                                    height: 121.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 24.h,
                                        right: 12.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provider['name'] as String,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5,
                                              letterSpacing: -0.01,
                                              color:
                                                  const Color(0xFF1B1A1F),
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/star_icon.svg',
                                                width: 12.w,
                                                height: 12.w,
                                              ),
                                              SizedBox(width: 4.w),
                                              Text(
                                                provider['rating'] as String,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      FontWeight.w500,
                                                  height: 1.5,
                                                  letterSpacing: -0.01,
                                                  color: const Color(
                                                      0xFF1B1A1F),
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              Text(
                                                provider['distance']
                                                    as String,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12.sp,
                                                  fontWeight:
                                                      FontWeight.w500,
                                                  height: 1.5,
                                                  letterSpacing: -0.01,
                                                  color: const Color(
                                                      0xFF7D7D7D),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.h),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                letterSpacing: -0.01,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text: "From ",
                                                  style: TextStyle(
                                                    color:
                                                        Color(0xFF7D7D7D),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: provider['price']
                                                      as String,
                                                  style: const TextStyle(
                                                    color:
                                                        Color(0xFF9AD448),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          Align(
                                            alignment:
                                                Alignment.centerRight,
                                            child: Container(
                                              width: 60.w,
                                              height: 21.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color:
                                                    const Color(0xFF9DDA47),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        6.r),
                                              ),
                                              child: Text(
                                                "Book Now",
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 9.sp,
                                                  fontWeight:
                                                      FontWeight.w500,
                                                  letterSpacing: -0.01,
                                                  color: const Color(
                                                      0xFF2B2A2F),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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

              SizedBox(height: 12.h),

              // Top Rated Providers heading + See all
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionHeader(
                      "Top Rated Providers",
                      onSeeAll: () {
                        // TODO: Navigate to full list once built
                      },
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: _topRated.map((item) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: GestureDetector(
                              onTap: () {
                                // TODO: Navigate to Provider profile once built
                              },
                              child: Container(
                                height: 98.h,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      item['image']!,
                                      width: 70.w,
                                      height: 98.h,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8.h,
                                          horizontal: 4.w,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              item['name']!,
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                letterSpacing: -0.01,
                                                color:
                                                    const Color(0xFF1B1A1F),
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/star_icon.svg',
                                                  width: 10.w,
                                                  height: 10.w,
                                                ),
                                                SizedBox(width: 3.w),
                                                Text(
                                                  item['rating']!,
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 8.sp,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    height: 1.5,
                                                    letterSpacing: -0.01,
                                                    color: const Color(
                                                        0xFF7D7D7D),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4.h),
                                            Text(
                                              item['distance']!,
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5,
                                                letterSpacing: -0.01,
                                                color:
                                                    const Color(0xFF7D7D7D),
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                            Container(
                                              width: 43.w,
                                              height: 14.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color:
                                                    const Color(0xFF9DDA47),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        4.r),
                                              ),
                                              child: Text(
                                                "Book Now",
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.01,
                                                  color:
                                                      const Color(0xFF2B2A2F),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, {VoidCallback? onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 1.5,
            letterSpacing: 0,
            color: const Color(0xFF1B1A1F),
          ),
        ),
        GestureDetector(
          onTap: onSeeAll ??
              () {
                // TODO: Navigate to full list once built
              },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "See all",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9AD448),
                ),
              ),
              SizedBox(width: 4.w),
              SvgPicture.asset(
                'assets/icons/forward_arrow.svg',
                width: 7.w,
                height: 3.89.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF9AD448),
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}