import 'package:flowers_ecommerce_app/core/di/di.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/features/occasions/presentation/manager/occasions_cubit.dart';
import 'package:flowers_ecommerce_app/features/occasions/presentation/manager/occasions_event.dart';
import 'package:flowers_ecommerce_app/features/occasions/presentation/widgets/occasions_appbar.dart';
import 'package:flowers_ecommerce_app/features/occasions/presentation/widgets/tab_bar_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/occasions_tabs_entity.dart';

class OccasionsScreen extends StatefulWidget {
  const OccasionsScreen({super.key, required this.occasionsList});
  final List<OccasionsTabsEntity> occasionsList;

  @override
  State<OccasionsScreen> createState() => _OccasionsScreenState();
}

class _OccasionsScreenState extends State<OccasionsScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.occasionsList.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabs = widget.occasionsList.map((e) => e.name!).toList();
    List<String> ids = widget.occasionsList.map((e) => e.id!).toList();
    return BlocProvider(
      create: (context) => getIt<OccasionsCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.only(left: 14.w, bottom: 16.h, right: 14.w),
            child: Column(
              children: [
                verticalSpace(16),
                const OccasionsAppbar(),
                verticalSpace(10),
                Expanded(
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        onTap: (index) {
                          context.read<OccasionsCubit>().doIntent(
                            LoadOccasionsEvent(),
                            ids[index],
                          );
                        },
                        isScrollable: true,
                        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                      ),
                      verticalSpace(28),
                      TabBarViewBlocBuilder(
                        ids: ids,
                        tabs: tabs,
                        controller: _tabController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
