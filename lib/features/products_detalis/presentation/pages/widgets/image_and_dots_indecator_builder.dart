import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class ImageAndDotsIndecatorBuilder extends StatefulWidget {
  const ImageAndDotsIndecatorBuilder({super.key, required this.images});
  final List<String> images;

  @override
  State<ImageAndDotsIndecatorBuilder> createState() =>
      _ImageAndDotsIndecatorBuilderState();
}

class _ImageAndDotsIndecatorBuilderState
    extends State<ImageAndDotsIndecatorBuilder> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.lightPink,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  verticalSpace(78),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16),
                          
                        ),
                        child: Image.network(
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null ? child : const Center(child: CircularProgressIndicator()),
                          widget.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? AppColors.pink
                      : AppColors.darkGrey.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
