import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../widgets/filters_bottom_sheet.dart';
import 'provider_profile_screen.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  List<String> _activeFilters = const [
    "Rating: 4.0+",
    "Price: Rs. 1,000-1,500",
    "Distance: 0 - 5 km",
    "Availability: Today",
  ];

  final List<Map<String, dynamic>> _results = const [
    {
      'name': 'FreshNest Cleaning',
      'rating': '4.8 (98)',
      'distance': '1.2 Km away',
      'price': 'Rs. 1,400',
      'image': 'assets/images/freshnest.png',
    },
    {
      'name': 'TidyTouch Cleaning',
      'rating': '4.5 (64)',
      'distance': '2.1 Km away',
      'price': 'Rs. 1,500',
      'image': 'assets/images/tidytouch.png',
    },
    {
      'name': 'ShinePro Home Services',
      'rating': '4.6 (75)',
      'distance': '1.8 Km away',
      'price': 'Rs. 1,300',
      'image': 'assets/images/shinepro.png',
    },
  ];

  void _removeFilter(String filter) {
    setState(() {
      _activeFilters = _activeFilters.where((f) => f != filter).toList();
    });
  }

  Widget _buildFilterChip(String filter) {
    if (!_activeFilters.contains(filter)) return const SizedBox();
    return Container(
      height: 26.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF5E8),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            filter,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 9.sp,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: const Color(0xFF212121),
            ),
          ),
          SizedBox(width: 6.w),
          GestureDetector(
            onTap: () => _removeFilter(filter),
            child: SvgPicture.asset(
              'assets/icons/cross_icon.svg',
              width: 5.w,
              height: 5.h,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search Results",
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

              // Search bar
              Container(
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
                    SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      width: 17.08.w,
                      height: 17.08.w,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF2B2A2F),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
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
                    GestureDetector(
                      onTap: () {
                        showFiltersBottomSheet(
                          context,
                          initialFilter: "Any",
                          onApply: (value) {},
                        );
                      },
                      child: SvgPicture.asset(
                        'assets/icons/filter_icon.svg',
                        width: 17.w,
                        height: 16.51.h,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 14.h),

              // Active filter chips (Rating/Price/Distance in scrollable row 1, Availability in row 2)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip("Rating: 4.0+"),
                    SizedBox(width: 8.w),
                    _buildFilterChip("Price: Rs. 1,000-1,500"),
                    SizedBox(width: 8.w),
                    _buildFilterChip("Distance: 0 - 5 km"),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  _buildFilterChip("Availability: Today"),
                ],
              ),

              SizedBox(height: 20.h),

              // Results list
              Column(
                children: _results.map((result) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const ProviderProfileScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 333.w,
                        height: 102.h,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              result['image'] as String,
                              width: 102.w,
                              height: 102.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 14.h,
                                  right: 10.w,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      result['name'] as String,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                        letterSpacing: -0.01,
                                        color: const Color(0xFF1B1A1F),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/star_icon.svg',
                                          width: 11.w,
                                          height: 11.w,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          result['rating'] as String,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            letterSpacing: -0.01,
                                            color: const Color(0xFF7D7D7D),
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          result['distance'] as String,
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            letterSpacing: -0.01,
                                            color: const Color(0xFF7D7D7D),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5,
                                              letterSpacing: -0.01,
                                            ),
                                            children: [
                                              const TextSpan(
                                                text: "From ",
                                                style: TextStyle(
                                                  color: Color(0xFF7D7D7D),
                                                ),
                                              ),
                                              TextSpan(
                                                text: result['price']
                                                    as String,
                                                style: const TextStyle(
                                                  color: Color(0xFF9AD448),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 63.43.w,
                                          height: 23.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF9DDA47),
                                            borderRadius:
                                                BorderRadius.circular(
                                                    6.92.r),
                                          ),
                                          child: Text(
                                            "Book Now",
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.01,
                                              color: const Color(0xFF2B2A2F),
                                            ),
                                          ),
                                        ),
                                      ],
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
      ),
    );
  }
}