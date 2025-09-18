import 'dart:async';
import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/app_images.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flowers_ecommerce_app/features/cart/domin/entities/cart_item.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_cubit.dart';
import 'package:flowers_ecommerce_app/features/cart/presentation/view_model/cubit/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key, required this.userItem, this.onDelete});

  final CartItem userItem;
  final void Function()? onDelete;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  Timer? _debounce;

  void _debounceUpdateQuantity(
    BuildContext context,
    String productId,
    int quantity,
  ) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 200), () {
      context.read<CartCubit>().doIntent(
        UpdeateCartItemQuantityEvent(productId, quantity),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return Container(
      height: 117.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGrey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 101.h,
              width: 101.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: NetworkImage(widget.userItem.product!.imgCover!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            horizontalSpace(8.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(6.h),
                SizedBox(
                  width: 200.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 140.w,
                        child: Text(
                          widget.userItem.product!.title!,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColors.black,
                                fontWeight: AppFontWeight.medium,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onDelete,
                        child: SvgPicture.asset(
                          AppImages.trashIcon,
                          width: 24.w,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),
                SizedBox(
                  width: 200.w,

                  child: Row(
                    children: [
                      Text(
                        '${trans.egp} ${widget.userItem.product!.price}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.black,
                          fontWeight: AppFontWeight.medium,
                        ),
                      ),
                      const Spacer(),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            final item = widget.userItem;
                            if (item.quantity! > 0) {
                              item.quantity = item.quantity! - 1;

                              _debounceUpdateQuantity(
                                context,
                                item.product!.id!,
                                item.quantity!,
                              );
                            }
                          });
                        },
                        child: const Icon(Icons.remove),
                      ),
                      horizontalSpace(8.w),
                      Text(
                        '${widget.userItem.quantity}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.black,
                          fontWeight: AppFontWeight.medium,
                        ),
                      ),
                      horizontalSpace(8.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            final item = widget.userItem;
                            item.quantity = item.quantity! + 1;

                            _debounceUpdateQuantity(
                              context,
                              item.product!.id!,
                              item.quantity!,
                            );
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                verticalSpace(8.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
