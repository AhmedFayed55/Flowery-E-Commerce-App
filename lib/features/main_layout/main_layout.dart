import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/main_layout/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

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
      Center(child: Text(locale.home)),
      Center(child: Text(locale.categories)),
      Center(child: Text(locale.cart)),
      Center(child: Text(locale.profile)),
    ];
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: _currentIndex, onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },),
      body: IndexedStack(index: _currentIndex, children: pages),
    );
  }
}
