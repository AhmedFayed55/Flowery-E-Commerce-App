import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flowers_ecommerce_app/core/helpers/validators.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/core/utils/font_weight.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flowers_ecommerce_app/features/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftSection extends StatefulWidget {
  const GiftSection({super.key});

  @override
  State<GiftSection> createState() => _GiftSectionState();
}

class _GiftSectionState extends State<GiftSection> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();
    final trans = AppLocalizations.of(context)!;
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Switch(
                      value: state.isGift,
                      onChanged: (val) => cubit.doIntent(ToggleGift(val)),
                    ),
                    Text(
                      trans.its_a_gift,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: AppFontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),

                if (state.isGift) ...[
                  const SizedBox(height: 12),
                  TextFormField(
                    onChanged: (val) {
                      cubit.doIntent(UpdateGiftStreet(val));
                    },
                    decoration: InputDecoration(
                      labelText: trans.street,
                      hintText: trans.enter_your_street,
                    ),
                    validator: Validations.validateName,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    onChanged: (val) {
                      cubit.doIntent(UpdateGiftCity(val));
                    },
                    decoration: InputDecoration(
                      labelText: trans.city,
                      hintText: trans.enter_your_city,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    maxLength: 11,
                    initialValue: '01',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      cubit.doIntent(UpdateGiftPhone(val));
                    },
                    decoration: InputDecoration(
                      labelText: trans.phone,
                      hintText: trans.enter_your_phone,
                      counter: const SizedBox.shrink(),
                    ),
                    validator: Validations.validatePhoneNumber,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
