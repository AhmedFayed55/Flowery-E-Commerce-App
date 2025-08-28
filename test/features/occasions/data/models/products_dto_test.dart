import 'package:flowers_ecommerce_app/features/occasions/data/models/products_dto.dart';
import 'package:flowers_ecommerce_app/features/occasions/domain/entities/products_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call toEntity with nullable values it should return entity with null values', () {
    ProductsDto dto = ProductsDto(
      slug: null,
      updatedAt: null,
      isSuperAdmin: null,
       createdAt: null,
      id: null,
      price: null,
      title: null,
      category: null,
      description: null,
      images: null,
      imgCover: null,
      occasion: null,
      priceAfterDiscount: null,
      quantity: null,
      rateAvg: null,
      rateCount: null,
      sold: null,
      V: null
    );

    ProductsEntity entity = dto.toEntity();

    expect(entity.id, null);
    expect(entity.slug, null);
    expect(entity.updatedAt, null);
    expect(entity.isSuperAdmin, null);
    expect(entity.createdAt, null);
    expect(entity.price, null);
    expect(entity.title, null);
    expect(entity.category, null);
    expect(entity.description, null);
    expect(entity.images, null);
    expect(entity.imgCover, null);
    expect(entity.occasion, null);
    expect(entity.priceAfterDiscount, null);
    expect(entity.quantity, null);
    expect(entity.rateAvg, null);
    expect(entity.rateCount, null);
    expect(entity.sold, null);
    expect(entity.V, null);
  });

  test("when call toEntity with non-null values it should return entity with correct values", (){
    ProductsDto dto = ProductsDto(
      slug: "flower-slug",
      updatedAt: "2024-01-01T00:00:00Z",
      isSuperAdmin: true,
      createdAt: "2024-01-01T00:00:00Z",
      id: "123",
      price: 29,
      title: "Beautiful Flower",
      category: "Roses",
      description: "A beautiful red rose.",
      images: ["image1.png", "image2.png"],
      imgCover: "cover.png",
      occasion: "Valentine's Day",
      priceAfterDiscount: 24,
      quantity: 100,
      rateAvg: 4,
      rateCount: 150,
      sold: 75,
      V: 1
    );

    ProductsEntity entity = dto.toEntity();

    expect(entity.id, dto.id);
    expect(entity.slug, dto.slug);
    expect(entity.updatedAt, dto.updatedAt);
    expect(entity.isSuperAdmin, dto.isSuperAdmin);
    expect(entity.createdAt, dto.createdAt);
    expect(entity.price, dto.price);
    expect(entity.title, dto.title);
    expect(entity.category, dto.category);
    expect(entity.description, dto.description);
    expect(entity.images, dto.images);
    expect(entity.imgCover, dto.imgCover);
    expect(entity.occasion, dto.occasion);
    expect(entity.priceAfterDiscount, dto.priceAfterDiscount);
    expect(entity.quantity, dto.quantity);
    expect(entity.rateAvg, dto.rateAvg);
    expect(entity.rateCount, dto.rateCount);
    expect(entity.sold, dto.sold);
    expect(entity.V, dto.V);
  });
}