import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../screens/home_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    HomeScreen(),
    _PlaceholderTab(label: "Bookings"),
    _PlaceholderTab(label: "Favorites"),
    _PlaceholderTab(label: "Profile"),
  ];

  final List<_NavItem> _navItems = const [
    _NavItem(
      label: "Home",
      icon: "assets/icons/nav_home.svg",
      width: 23.14,
      height: 23.14,
    ),
    _NavItem(
      label: "Bookings",
      icon: "assets/icons/nav_bookings.svg",
      width: 23.14,
      height: 23.51,
    ),
    _NavItem(
      label: "Favorites",
      icon: "assets/icons/nav_favorites.svg",
      width: 23.14,
      height: 19.85,
    ),
    _NavItem(
      label: "Profile",
      icon: "assets/icons/nav_profile.svg",
      width: 23.14,
      height: 23.14,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: 96.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 8.r,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              final isSelected = _currentIndex == index;
              final item = _navItems[index];
              final iconColor =
                  isSelected ? const Color(0xFF95D041) : const Color(0xFF212121);
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      item.icon,
                      width: item.width.w,
                      height: item.height.h,
                      colorFilter: ColorFilter.mode(
                        iconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    if (index == 0) ...[
                      SizedBox(height: 4.h),
                      Text(
                        item.label,
                        // TODO: switch to Quicksand once font files are added
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11.57.sp,
                          fontWeight: FontWeight.w500,
                          height: 17.35 / 11.57,
                          color: const Color(0xFF95D041),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String icon;
  final double width;
  final double height;
  const _NavItem({
    required this.label,
    required this.icon,
    required this.width,
    required this.height,
  });
}

class _PlaceholderTab extends StatelessWidget {
  final String label;
  const _PlaceholderTab({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          "$label\n(coming soon)",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
      ),
    );
  }
}