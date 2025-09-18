import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/search/search_screen.dart';
import 'package:flutter/material.dart';

class TextFiledScreen extends StatelessWidget {
  const TextFiledScreen({super.key});

  // final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                // controller: searchController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.search,
                ),
                onTap: () {
                  showSearch(context: context, delegate: SearchScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
