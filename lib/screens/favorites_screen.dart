import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  final List<Map<String, dynamic>> _favorites = [
    {
      'name': 'FreshNest Cleaning',
      'rating': '4.8 (98)',
      'distance': '1.2 Km away',
      'price': '1,400',
      'image': 'assets/images/freshnest_cleaning.png',
    },
    {
      'name': 'TidyTouch Cleaning',
      'rating': '4.5 (64)',
      'distance': '2.1 Km away',
      'price': '1,500',
      'image': 'assets/images/tidytouch_cleaning.png',
    },
    {
      'name': 'ShinePro Home Services',
      'rating': '4.6 (75)',
      'distance': '1.8 Km away',
      'price': '1,300',
      'image': 'assets/images/shinepro_home.png',
    },
    {
      'name': 'CleanCare Home Services',
      'rating': '4.7 (76)',
      'distance': '2.0 Km away',
      'price': '1,600',
      'image': 'assets/images/cleancare_home.png',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _favorites
        .where((p) => p['name']
            .toString()
            .toLowerCase()
            .contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F9),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 57.h),
              // Title
              Center(
                child: Text(
                  'Saved / Favorites',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    height: 1.5,
                    color: const Color(0xFF2B2A2F),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              // Search field
              Container(
                width: 327.w,
                height: 53.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFFE8E9EC), width: 1),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      width: 20.w,
                      height: 20.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF2B2A2F),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (v) => setState(() => _query = v),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          height: 1.5,
                          color: const Color(0xFF737B98),
                        ),
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          border: InputBorder.none,
                          hintText: 'Search saved providers...',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF737B98),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // List
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => SizedBox(height: 14.h),
                  itemBuilder: (context, index) {
                    final provider = filtered[index];
                    return _FavoriteCard(provider: provider);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavoriteCard extends StatefulWidget {
  final Map<String, dynamic> provider;
  const _FavoriteCard({required this.provider});

  @override
  State<_FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<_FavoriteCard> {
  bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    final provider = widget.provider;
    return Container(
      width: 330.w,
      height: 102.h,
      margin: EdgeInsets.only(left: 3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    provider['image'],
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider['name'],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          height: 1.5,
                          letterSpacing: -0.13,
                          color: const Color(0xFF1B1A1F),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star_icon.svg',
                            width: 13.w,
                            height: 13.h,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            provider['rating'],
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              height: 1.5,
                              letterSpacing: -0.1,
                              color: const Color(0xFF7D7D7D),
                            ),
                          ),
                          SizedBox(width: 11.w),
                          Text(
                            provider['distance'],
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                              height: 1.5,
                              letterSpacing: -0.1,
                              color: const Color(0xFF7D7D7D),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            height: 1.5,
                            letterSpacing: -0.11,
                          ),
                          children: [
                            const TextSpan(
                              text: 'From ',
                              style: TextStyle(color: Color(0xFF7D7D7D)),
                            ),
                            TextSpan(
                              text: 'Rs. ${provider['price']}',
                              style: const TextStyle(color: Color(0xFF9DDA47)),
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
          Positioned(
            top: 39.h,
            left: 296.w - 10.w, // adjusted for card's own left inset
            child: GestureDetector(
              onTap: () => setState(() => _isFavorite = !_isFavorite),
              child: _isFavorite
                  ? SvgPicture.asset(
                      'assets/icons/heart_filled_red.svg',
                      width: 20.w,
                      height: 17.h,
                    )
                  : Icon(
                      Icons.favorite_border,
                      size: 18.sp,
                      color: const Color(0xFF7D7D7D),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}