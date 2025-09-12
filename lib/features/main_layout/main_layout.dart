import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/pages/cart_page.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/pages/home_screen.dart';
import 'package:flowers_ecommerce_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final List<Widget> pages = [
       const Center(child: HomeScreen()),
      Center(child: Text(locale.categories)),
     const Center(child: CartPage()),
      const ProfileSettingScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _buildBottomNavigationBarItem(AppImages.homeIcon, locale.home, 0),
          _buildBottomNavigationBarItem(
            AppImages.categoriesIcon,
            locale.categories,
            1,
          ),
          _buildBottomNavigationBarItem(AppImages.cartIcon, locale.cart, 2),
          _buildBottomNavigationBarItem(
            AppImages.profileIcon,
            locale.profile,
            3,
          ),
        ],
      ),
      body: pages[_currentIndex]
      //IndexedStack(index: _currentIndex, children: pages),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              _currentIndex == index ? AppColors.pink : AppColors.white[80]!,
              BlendMode.srcIn,
            ),
          ),
          verticalSpace(7),
        ],
      ),
      label: label,
    );
  }
}
