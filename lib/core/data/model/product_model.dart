import 'package:get/get.dart';

class ProductModel extends GetxController {
  final int id;
  final String name;
  final String image;
  final double price;
  int quantity;
  double total;
  double payment;
  final double discount;
  final double discountPrice;
  final double rate;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.total,
    required this.payment,
    required this.discount,
    required this.discountPrice,
    required this.rate,
    required this.description,
  });
}

List<ProductModel> listProduct = [
  ProductModel(
    id: 1,
    name: "Around the world, one plate at a time",
    image: "asset/image/Around the world, one plate at a time.jpg",
    price: 15,
    quantity: 1,
    total: 0,
    payment: 0,
    discount: 30,
    discountPrice: 0,
    rate: 3.4,
    description: "asset/image/Around the world, one plate at a time.jpg",
  ),
  ProductModel(
    id: 2,
    name: "Barramundi, Australia",
    image: "asset/image/Barramundi, Australia.jpg",
    price: 13,
    quantity: 1,
    total: 0,
    payment: 0,
    discount: 35,
    discountPrice: 0,
    rate: 3,
    description: "asset/image/Barramundi, Australia.jpg",
  ),
  ProductModel(
    id: 3,
    name: "Bibimbap, South Korea",
    image: "asset/image/Bibimbap, South Korea.jpg",
    price: 7,
    quantity: 1,
    total: 0,
    payment: 0,
    discount: 30,
    discountPrice: 0,
    rate: 4.4,
    description: "asset/image/Bibimbap, South Korea.jpg",
  ),
  ProductModel(
    id: 4,
    name: "Biryani, India",
    image: "asset/image/Biryani, India.jpg",
    price: 50,
    quantity: 1,
    total: 0,
    payment: 0,
    discount: 30,
    discountPrice: 0,
    rate: 3.4,
    description: "asset/image/Biryani, India.jpg",
  ),
  ProductModel(
    id: 5,
    name: "Boeuf bourguignon, France",
    image: "asset/image/Boeuf bourguignon, France.jpg",
    price: 15,
    quantity: 1,
    total: 0,
    payment: 0,
    discount: 40,
    discountPrice: 0,
    rate: 3.4,
    description: "asset/image/Boeuf bourguignon, France.jpg",
  ),
];
