import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flowers_ecommerce_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:flowers_ecommerce_app/features/search/presentation/cubit/search_event.dart';
import 'package:flowers_ecommerce_app/features/search/presentation/cubit/search_state.dart';
import 'package:flowers_ecommerce_app/features/search/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchCubit searchCubit = getIt.get<SearchCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchCubit,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              SearchBar(
                controller: searchCubit.searchController,
                elevation: const WidgetStatePropertyAll(0),
                leading: const Icon(Icons.search),
                trailing: [
                  IconButton(
                    onPressed: () {
                      /// delete controller.text || Navigator
                    },
                    icon: const Icon(Icons.cancel_outlined),
                  ),
                ],
                hintText: AppLocalizations.of(context)?.search,
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    side: BorderSide(width: 1, color: Colors.grey.shade400),
                  ),
                ),
                onChanged: (value) {
                  searchCubit.doIntent(SearchDelayedEvent(keyword: value));
                },
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.isError) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.error,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: AppColors.pink,
                                fontWeight: AppFontWeight.medium,
                              ),
                        ),
                      );
                    }
                    if (state.productsDtoEntity.isEmpty &&
                        searchCubit.searchController.text != "") {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.no_product_found,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: AppColors.pink,
                                fontWeight: AppFontWeight.medium,
                              ),
                        ),
                      );
                    }
                    if (state.isSuccess) {
                      return Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(top: 10.h),
                          itemCount: state.productsDtoEntity.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                          itemBuilder: (context, index) {
                            return BlocProvider.value(
                              value: searchCubit,
                              child: ProductItem(index: index),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          AppLocalizations.of(
                            context,
                          )!.search_for_any_product_you_want,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: AppColors.pink,
                                fontWeight: AppFontWeight.medium,
                              ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchCubit.searchController.dispose();
    super.dispose();
  }
}
