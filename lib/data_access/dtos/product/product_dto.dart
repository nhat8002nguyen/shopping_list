import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  final int id;
  final String title;
  final double price;

  const ProductDto({
    required this.id,
    required this.title,
    required this.price,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

@JsonSerializable()
class ProductRatingDto {
  final double rate;
  final int count;

  const ProductRatingDto({
    required this.rate,
    required this.count,
  });

  factory ProductRatingDto.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductRatingDtoToJson(this);
}
