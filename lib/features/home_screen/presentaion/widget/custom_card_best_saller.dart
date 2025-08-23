import 'package:flutter/material.dart';

class CustomCardBestSaller extends StatelessWidget {
  const CustomCardBestSaller({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
  final String title;
  final int price;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, fit: BoxFit.fill, width: 130, height: 150),
        Text(
          title.substring(0, title.length >= 20 ? 20 : title.length),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text('${price.toString()} EGP',style: Theme.of(context).textTheme.labelMedium,),
      ],
    );
  }
}
