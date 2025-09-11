import 'package:flowers_ecommerce_app/config/theme/colors.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });
  final String title;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.darkGrey,
                ),
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                description,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.darkGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
