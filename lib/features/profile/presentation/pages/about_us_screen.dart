import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/about_us_entity.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key, required this.aboutUsList});
  final List<AboutUsEntity> aboutUsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(AppLocalizations.of(context)!.about_us),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: aboutUsList.length,
        itemBuilder: (context, indexTerm) {
          final aboutUs = aboutUsList[indexTerm];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Title section
                if (aboutUs.title!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      aboutUs.title ?? '',
                      style: TextStyle(
                        fontSize: aboutUs.style.fontSize + 4,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          int.parse(
                            aboutUs.style.color.replaceAll('#', '0xFF'),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Content section
                ...aboutUs.content.expand((line) {
                  final parts = line
                      .replaceAll('[', '')
                      .replaceAll(']', '')
                      .split('r[.\n]')
                      .map((e) => e.trim())
                      .where((e) => e.isNotEmpty);

                  return parts.map(
                    (part) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        part,
                        style: TextStyle(
                          fontSize: aboutUs.style.fontSize,
                          fontWeight:
                              aboutUs.style.fontWeight.toLowerCase() == 'bold'
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Color(
                            int.parse(
                              aboutUs.style.color.replaceAll('#', '0xFF'),
                            ),
                          ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
