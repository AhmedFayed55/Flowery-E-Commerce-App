import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/profile/domain/entities/term_entity.dart';
import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key, required this.termsList});
  final List<TermEntity> termsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        surfaceTintColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.terms_conditions),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: termsList.length,
        itemBuilder: (context, indexTerm) {
          final term = termsList[indexTerm];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Title section
                if (term.title!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      term.title ?? '',
                      style: TextStyle(
                        fontSize: term.style.fontSize + 4,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          int.parse(term.style.color.replaceAll('#', '0xFF')),
                        ),
                      ),
                    ),
                  ),

                // Content section
                ...term.content.expand((line) {
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
                          fontSize: term.style.fontSize,
                          fontWeight:
                              term.style.fontWeight.toLowerCase() == 'bold'
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: Color(
                            int.parse(term.style.color.replaceAll('#', '0xFF')),
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
