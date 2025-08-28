import 'package:flowers_ecommerce_app/core/helpers/spacing.dart';
import 'package:flowers_ecommerce_app/core/l10n/translations/app_localizations.dart';
import 'package:flowers_ecommerce_app/features/most_selling/presentation/entites/products_entity.dart';
import 'package:flowers_ecommerce_app/features/most_selling/presentation/pages/widgets/most_selling_products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostSellingPage extends StatelessWidget {
  const MostSellingPage({super.key , required this.products});
  final List<ProductsEntity> products;

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(13.h),
                    Text(trans.best_seller),
                    Text(
                      trans.bloom_with_our_exquisite_best_sellers,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(13.h),
          ],
        ),
      ),
      body: products.isEmpty
          ? Center(
              child: Text(
                trans.no_products,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView(
              children: [
                verticalSpace(11.h),
                MostSellingProductsGridView(products: products),
              ],
            ),
    );
  }
}

// final List<ProductsEntity> empty = [];
// final List<ProductsEntity> products = [
//   ProductsEntity(
//     id: "673e1cd711599201718280fb",
//     title: "Wdding Flower",
//     slug: "wdding-flower",
//     description: "This is a Pack of White Widding Flowers",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png",
//       "https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png",
//       "https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png",
//     ],
//     price: 250,
//     priceAfterDiscount: 100,
//     quantity: -65,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b34c21159920171827ae0",
//     createdAt: "2024-11-20T17:31:03.303Z",
//     updatedAt: "2025-07-24T10:43:49.351Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 285,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2bd91159920171828139",
//     title: "Red Wdding Flower",
//     slug: "red-wdding-flower",
//     description: "This is a Pack of Red Widding Flowers",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png",
//       "https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png",
//       "https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png",
//       "https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png",
//     ],
//     price: 250,
//     priceAfterDiscount: 150,
//     quantity: 832,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b34c21159920171827ae0",
//     createdAt: "2024-11-20T18:35:05.594Z",
//     updatedAt: "2025-08-26T06:24:40.964Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 168,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2d1b1159920171828146",
//     title: "GABRIELLE CHANEL",
//     slug: "gabrielle-chanel",
//     description:
//         "PRODUCT\nBefore creating the House of CHANEL, Coco was Gabrielle...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/0c6c00d1-d816-44e4-8119-cf97807427f2-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/f286e018-63bb-4e6b-9d6b-feefdf28cdf3-image_one.png",
//       "https://flower.elevateegy.com/uploads/75fae675-a16e-4d26-98a4-63f34e8423f0-image_three.png",
//       "https://flower.elevateegy.com/uploads/7f3bcf05-7e55-476c-9d3d-8026c709a80c-image_two.png",
//     ],
//     price: 340,
//     priceAfterDiscount: 172,
//     quantity: 970,
//     category: "673c47751159920171827c93",
//     occasion: "673b368c1159920171827afc",
//     createdAt: "2024-11-20T18:40:27.076Z",
//     updatedAt: "2025-08-23T13:16:42.716Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 30,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2e1f1159920171828153",
//     title: "Dreamy White Roses Bouquet",
//     slug: "dreamy-white-roses-bouquet",
//     description: "Elevate any celebration with our luxury rose bouquet...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/2d8ddf11-935f-4a45-a100-e1e0765a39c3-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/8ee8e389-da6a-4371-8b13-5e35fcca16c6-image_one.png",
//       "https://flower.elevateegy.com/uploads/66fc9304-3ceb-4b73-97dd-730ccf790c49-image_three.png",
//       "https://flower.elevateegy.com/uploads/acf9531b-5ca9-4c45-97fc-f81df9d62091-image_two.png",
//     ],
//     price: 320,
//     priceAfterDiscount: 199,
//     quantity: -1,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b35c01159920171827aed",
//     createdAt: "2024-11-20T18:44:47.407Z",
//     updatedAt: "2025-07-05T11:30:17.866Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 101,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2f701159920171828164",
//     title: "Fuchsia Brilliance Vase",
//     slug: "fuchsia-brilliance-vase",
//     description: "Discover the elegance of Fuchsia Roses in a Glass Vase...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/535a663d-b5de-497b-aa4b-cfde74ab7f92-image_one.png",
//       "https://flower.elevateegy.com/uploads/172e848c-e43b-4f1b-8cf9-d4e4ef90101c-image_three.png",
//     ],
//     price: 220,
//     priceAfterDiscount: 112,
//     quantity: 971,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b351e1159920171827ae5",
//     createdAt: "2024-11-20T18:50:24.117Z",
//     updatedAt: "2025-08-21T13:16:54.691Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 29,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   // 🔽 كمل بنفس الشكل لباقي البرودكتس (لحد 15) بنفس الداتا من الريسبونس
//   ProductsEntity(
//     id: "673e1cd711599201718280fb",
//     title: "Wdding Flower",
//     slug: "wdding-flower",
//     description: "This is a Pack of White Widding Flowers",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png",
//       "https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png",
//       "https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png",
//     ],
//     price: 250,
//     priceAfterDiscount: 100,
//     quantity: -65,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b34c21159920171827ae0",
//     createdAt: "2024-11-20T17:31:03.303Z",
//     updatedAt: "2025-07-24T10:43:49.351Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 285,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2bd91159920171828139",
//     title: "Red Wdding Flower",
//     slug: "red-wdding-flower",
//     description: "This is a Pack of Red Widding Flowers",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png",
//       "https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png",
//       "https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png",
//       "https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png",
//     ],
//     price: 250,
//     priceAfterDiscount: 150,
//     quantity: 832,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b34c21159920171827ae0",
//     createdAt: "2024-11-20T18:35:05.594Z",
//     updatedAt: "2025-08-26T06:24:40.964Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 168,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2d1b1159920171828146",
//     title: "GABRIELLE CHANEL",
//     slug: "gabrielle-chanel",
//     description:
//         "PRODUCT\nBefore creating the House of CHANEL, Coco was Gabrielle...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/0c6c00d1-d816-44e4-8119-cf97807427f2-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/f286e018-63bb-4e6b-9d6b-feefdf28cdf3-image_one.png",
//       "https://flower.elevateegy.com/uploads/75fae675-a16e-4d26-98a4-63f34e8423f0-image_three.png",
//       "https://flower.elevateegy.com/uploads/7f3bcf05-7e55-476c-9d3d-8026c709a80c-image_two.png",
//     ],
//     price: 340,
//     priceAfterDiscount: 172,
//     quantity: 970,
//     category: "673c47751159920171827c93",
//     occasion: "673b368c1159920171827afc",
//     createdAt: "2024-11-20T18:40:27.076Z",
//     updatedAt: "2025-08-23T13:16:42.716Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 30,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2e1f1159920171828153",
//     title: "Dreamy White Roses Bouquet",
//     slug: "dreamy-white-roses-bouquet",
//     description: "Elevate any celebration with our luxury rose bouquet...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/2d8ddf11-935f-4a45-a100-e1e0765a39c3-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/8ee8e389-da6a-4371-8b13-5e35fcca16c6-image_one.png",
//       "https://flower.elevateegy.com/uploads/66fc9304-3ceb-4b73-97dd-730ccf790c49-image_three.png",
//       "https://flower.elevateegy.com/uploads/acf9531b-5ca9-4c45-97fc-f81df9d62091-image_two.png",
//     ],
//     price: 320,
//     priceAfterDiscount: 199,
//     quantity: -1,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b35c01159920171827aed",
//     createdAt: "2024-11-20T18:44:47.407Z",
//     updatedAt: "2025-07-05T11:30:17.866Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 101,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2f701159920171828164",
//     title: "Fuchsia Brilliance Vase",
//     slug: "fuchsia-brilliance-vase",
//     description: "Discover the elegance of Fuchsia Roses in a Glass Vase...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/535a663d-b5de-497b-aa4b-cfde74ab7f92-image_one.png",
//       "https://flower.elevateegy.com/uploads/172e848c-e43b-4f1b-8cf9-d4e4ef90101c-image_three.png",
//     ],
//     price: 220,
//     priceAfterDiscount: 112,
//     quantity: 971,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b351e1159920171827ae5",
//     createdAt: "2024-11-20T18:50:24.117Z",
//     updatedAt: "2025-08-21T13:16:54.691Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 29,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   // 🔽 كمل بنفس الشكل لباقي البرودكتس (لحد 15) بنفس الداتا من الريسبونس
//   ProductsEntity(
//     id: "673e1cd711599201718280fb",
//     title: "Wdding Flower",
//     slug: "wdding-flower",
//     description: "This is a Pack of White Widding Flowers",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png",
//       "https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png",
//       "https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png",
//     ],
//     price: 250,
//     priceAfterDiscount: 100,
//     quantity: -65,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b34c21159920171827ae0",
//     createdAt: "2024-11-20T17:31:03.303Z",
//     updatedAt: "2025-07-24T10:43:49.351Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 285,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2bd91159920171828139",
//     title: "Red Wdding Flower",
//     slug: "red-wdding-flower",
//     description: "This is a Pack of Red Widding Flowers",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png",
//       "https://flower.elevateegy.com/uploads/f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png",
//       "https://flower.elevateegy.com/uploads/5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png",
//       "https://flower.elevateegy.com/uploads/c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png",
//     ],
//     price: 250,
//     priceAfterDiscount: 150,
//     quantity: 832,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b34c21159920171827ae0",
//     createdAt: "2024-11-20T18:35:05.594Z",
//     updatedAt: "2025-08-26T06:24:40.964Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 168,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2d1b1159920171828146",
//     title: "GABRIELLE CHANEL",
//     slug: "gabrielle-chanel",
//     description:
//         "PRODUCT\nBefore creating the House of CHANEL, Coco was Gabrielle...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/0c6c00d1-d816-44e4-8119-cf97807427f2-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/f286e018-63bb-4e6b-9d6b-feefdf28cdf3-image_one.png",
//       "https://flower.elevateegy.com/uploads/75fae675-a16e-4d26-98a4-63f34e8423f0-image_three.png",
//       "https://flower.elevateegy.com/uploads/7f3bcf05-7e55-476c-9d3d-8026c709a80c-image_two.png",
//     ],
//     price: 340,
//     priceAfterDiscount: 172,
//     quantity: 970,
//     category: "673c47751159920171827c93",
//     occasion: "673b368c1159920171827afc",
//     createdAt: "2024-11-20T18:40:27.076Z",
//     updatedAt: "2025-08-23T13:16:42.716Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 30,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2e1f1159920171828153",
//     title: "Dreamy White Roses Bouquet",
//     slug: "dreamy-white-roses-bouquet",
//     description: "Elevate any celebration with our luxury rose bouquet...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/2d8ddf11-935f-4a45-a100-e1e0765a39c3-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/8ee8e389-da6a-4371-8b13-5e35fcca16c6-image_one.png",
//       "https://flower.elevateegy.com/uploads/66fc9304-3ceb-4b73-97dd-730ccf790c49-image_three.png",
//       "https://flower.elevateegy.com/uploads/acf9531b-5ca9-4c45-97fc-f81df9d62091-image_two.png",
//     ],
//     price: 320,
//     priceAfterDiscount: 199,
//     quantity: -1,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b35c01159920171827aed",
//     createdAt: "2024-11-20T18:44:47.407Z",
//     updatedAt: "2025-07-05T11:30:17.866Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 101,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   ProductsEntity(
//     id: "673e2f701159920171828164",
//     title: "Fuchsia Brilliance Vase",
//     slug: "fuchsia-brilliance-vase",
//     description: "Discover the elegance of Fuchsia Roses in a Glass Vase...",
//     imgCover:
//         "https://flower.elevateegy.com/uploads/5165a2c1-3e6c-44db-96f3-97ee83a29da9-cover_image.png",
//     images: [
//       "https://flower.elevateegy.com/uploads/535a663d-b5de-497b-aa4b-cfde74ab7f92-image_one.png",
//       "https://flower.elevateegy.com/uploads/172e848c-e43b-4f1b-8cf9-d4e4ef90101c-image_three.png",
//     ],
//     price: 220,
//     priceAfterDiscount: 112,
//     quantity: 971,
//     category: "673c46fd1159920171827c85",
//     occasion: "673b351e1159920171827ae5",
//     createdAt: "2024-11-20T18:50:24.117Z",
//     updatedAt: "2025-08-21T13:16:54.691Z",
//     V: 0,
//     isSuperAdmin: true,
//     sold: 29,
//     rateAvg: 5,
//     rateCount: 0,
//   ),
//   // 🔽 كمل بنفس الشكل لباقي البرودكتس (لحد 15) بنفس الداتا من الريسبونس
// ];
