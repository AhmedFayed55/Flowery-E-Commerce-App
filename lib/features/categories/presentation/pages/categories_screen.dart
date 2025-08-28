import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_event.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/cubit/category_state.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/widgets/custom_bottom_sheet.dart';
import 'package:flowers_ecommerce_app/features/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  final CategoryCubit categoryCubit = getIt.get<CategoryCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryCubit..doIntent(GetAllCategoryEvent()),
           child: BlocBuilder<CategoryCubit, CategoryState>(
             builder: (context, state) {
               return SafeArea(
               child: Scaffold(
                 floatingActionButtonLocation:
                 FloatingActionButtonLocation.centerFloat,
                 floatingActionButton: FloatingActionButton.extended(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadiusGeometry.circular(50),
                   ),
                   onPressed: () {
                     showModalBottomSheet(
                       context: context,
                       builder: (_) {
                         final cubit = context.read<CategoryCubit>();
                         return BlocProvider.value(
                           value: cubit,
                           child: const CustomBottomSheet(),
                         );
                       },
                     );
                   },
                   label: Row(
                     children: [
                       const Icon(Icons.tune),
                       horizontalSpace(12),
                       Text(AppLocalizations.of(context)!.filer),
                     ],
                   ),
                 ),
                 body: Padding(
                   padding: const EdgeInsets.all(16),
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Expanded(
                             flex: 5,
                             child: TextField(
                               controller: searchController,
                               decoration: InputDecoration(
                                 prefixIcon: const Icon(Icons.search),
                                 hintText: AppLocalizations.of(context)!.search,
                               ),
                             ),
                           ),
                           horizontalSpace(8),
                           Expanded(
                             flex: 1,
                             child: InkWell(
                               onTap: () {},
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadiusGeometry.circular(
                                     8,
                                   ),
                                   border: Border.all(width: 1),
                                 ),
                                 height: 48.h,
                                 child: const Icon(Icons.sort),
                               ),
                             ),
                           ),
                         ],
                       ),
                       verticalSpace(16),
                       BlocBuilder<CategoryCubit, CategoryState>(
                           builder: (context, state) {
                             if(state.isLoading){
                               return const Center(child: CircularProgressIndicator());
                             }
                             return Expanded(
                               child: Column(children: [
                                 DefaultTabController(
                                   length: state.listCategoryModel.length,
                                   child: TabBar(
                                     dividerColor: Colors.transparent,
                                     tabAlignment: TabAlignment.start,
                                     isScrollable: true,
                                     tabs: state.listCategoryModel
                                         .map((e) => Tab(child: Text(e.name)))
                                         .toList(),
                                   ),
                                 ),
                                 verticalSpace(32),
                                 Expanded(
                                   child: GridView.builder(
                                     itemCount: state.listCategoryModel.length,
                                     gridDelegate:
                                     SliverGridDelegateWithFixedCrossAxisCount(
                                       childAspectRatio: 163.w / 229.h,
                                       mainAxisSpacing: 17,
                                       crossAxisSpacing: 17,
                                       crossAxisCount: 2,
                                     ),
                                     itemBuilder: (context, index) {
                                       return CategoryItem(index: index);
                                     },
                                   ),
                                 ),
                               ],),
                             );
                           }


                       ),

                     ],
                   ),
                 ),
               ),
               );
             },
           ),
    );
  }
}
