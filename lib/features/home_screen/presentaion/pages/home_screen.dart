import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/view_model/home_bloc.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/view_model/home_event.dart';
import 'package:flowers_ecommerce_app/features/home_screen/domain/view_model/home_state.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/widget/custom_card_best_saller.dart';
import 'package:flowers_ecommerce_app/features/home_screen/presentaion/widget/custom_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..doIntent(GetHomeDataEvent()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.isLoadding == true) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.errorMassage.isNotEmpty) {
                print('eeeeeeeeeeeeeee${state.errorMassage.toString()}');
                return Center(child: Text(state.errorMassage.toString()));
              }
              print('categortttt${state.homeEntity!.categoryEntity.length}');
              print('BestSallller${state.homeEntity!.bestSallerEntity.length}');
              print('occisssion${state.homeEntity!.occasionEntity.length}');
              print('produccct${state.homeEntity!.productEntity.length}');

              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Image.asset(
                          AppImages.imagePhoto,
                          width: 12,
                          height: 12,
                        ),
                      ),
                      const Text('Flower'),
                      // const Spacer(),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: 'search',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.location_on_sharp),
                      Text(
                        'Deliver to 2XVP+XC - Sheikh Zayed ',
                        style: TextStyle(color: Colors.red),
                      ),
                      Icon(Icons.keyboard_arrow_down_sharp),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Category'),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text('viewAll'),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ListView.separated(
                      itemCount: state.homeEntity!.categoryEntity.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const Padding(padding: EdgeInsetsGeometry.all(10)),
                      itemBuilder: (context, index) {
                        return CustomCategoryCard(
                          imageUrl:
                              state.homeEntity!.categoryEntity[index].image,
                          // ,
                          title: state.homeEntity!.categoryEntity[index].name,
                        );
                      },
                    ),
                  ),

                  Row(
                    children: [
                      const Text('Best seller'),
                      const Spacer(),
                      TextButton(onPressed: () {}, child: const Text('vewAll')),
                    ],
                  ),

                  SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: ListView.separated(separatorBuilder: (context, index) =>const Padding(padding: EdgeInsetsGeometry.all(10)),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomCardBestSaller(
                          imageUrl: state
                              .homeEntity!
                              .bestSallerEntity[index]
                              .imgCover,
                          title:
                              state.homeEntity!.bestSallerEntity[index].title,
                          price: state.homeEntity!.bestSallerEntity[index].price.toInt()
                             
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
