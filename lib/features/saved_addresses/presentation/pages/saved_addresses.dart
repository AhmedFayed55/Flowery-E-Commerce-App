import 'package:flowers_ecommerce_app/config/routing/routing_extensions.dart';
import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/saved_address_list_view_item.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(AppLocalizations.of(context)!.saved_addresses),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => verticalSpace(16),
                itemBuilder: (context, index) =>
                    const SavedAddressListViewItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
