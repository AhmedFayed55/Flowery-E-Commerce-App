import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/view_model/home_bloc.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/view_model/home_event.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/view_model/home_state.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/widget/custom_card_best_saller.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/widget/custom_card_category.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/widget/custom_card_occasion.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/widget/header_row.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/widget/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../config/routing/app_routes.dart';
import '../../../../core/utils/app_constants.dart';

class HomeScreen extends StatelessWidget {
   int? homeIndex;
  final VoidCallback? onViewAllPressed;
   final Function(int?)? onCategorySelected;

   HomeScreen({super.key,this.onViewAllPressed,this.onCategorySelected});


   void homeOnTap(int? index) {
     if (onCategorySelected != null) {
       onCategorySelected!(index);
     }
   }

  @override
  Widget build(BuildContext context) {
    final HomeBloc viewModel = getIt<HomeBloc>();
    return BlocProvider(
      create: (context) => viewModel..doIntent(GetHomeDataEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50.h, left: 10.w, right: 10.w),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.errorMassage.isNotEmpty) {
                  return Center(child: Text(state.errorMassage.toString()));
                }

                return Skeletonizer(
                  enabled: state.isLoading ? true : false,
                  child: Column(
                    children: [
                      const HomeSearchBar(),
                      const Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(
                            'Deliver to 2XVP+XC - Sheikh Zayed',
                            style: TextStyle(color: AppColors.black),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: AppColors.pink,
                          ),
                        ],
                      ),
                      HeaderRow(
                        nameSection: AppLocalizations.of(context)!.categories,
                        //navigator to category Screen
                        onPressed: () {
                            if (onViewAllPressed != null) {
                              onViewAllPressed!();

                            }
                        },
                      ),

                      CustomCardCategory(
                        onTap: (index) => homeOnTap(index),
                        itemCategory: state.homeEntity?.categoryEntity ?? [],
                      ),

                      HeaderRow(
                        nameSection: AppLocalizations.of(context)!.best_seller,
                        //navigator to bestSeller Screen
                        onPressed: () {
                          context.pushNamed(
                            AppRoutes.mostSelling,
                            arguments: state.homeEntity?.bestSallerEntity,
                          );
                        },
                      ),

                      CustomCardBestSaller(
                        onTap: () {},
                        itemBestSeller:
                            state.homeEntity?.bestSallerEntity ?? [],
                      ),
                      HeaderRow(
                        nameSection: AppLocalizations.of(context)!.occasion,
                        onPressed: () => context.pushNamed(
                          AppRoutes.occasions,
                          arguments: {
                            AppConstants.occasionsParam: viewModel.occasion,
                            AppConstants.index: 0,
                          },
                        ),
                      ),

                      CustomCardOccasion(
                        itemOccasion: state.homeEntity?.occasionEntity ?? [],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
