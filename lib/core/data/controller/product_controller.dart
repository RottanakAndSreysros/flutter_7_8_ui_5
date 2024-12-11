import 'package:flutter_7_8_ui_5/core/data/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final RxList<ProductModel> listCart = <ProductModel>[].obs;
  final RxDouble total = 0.0.obs;
  final RxDouble payment = 0.0.obs;

  void addTocart(ProductModel model) {
    listCart.add(model);
    update();
  }

  void deleteFromCart({required int id}) {
    listCart.removeWhere((element) => element.id == id);
    update();
  }

  void increaseQuantity(int id) {
    final product = listCart.firstWhere((product) => product.id == id);
    product.quantity++;
    updateProductCart(product);
    //print(product.quantity);
    update();
  }

  void decreaseQuantity(int id) {
    final product = listCart.firstWhere((product) => product.id == id);
    if (product.quantity > 1) {
      product.quantity--;
      updateProductCart(product);
    }
    update();
  }

  void updateProductCart(ProductModel product) {
    product.total = product.price * product.quantity;
    product.payment = product.total - (product.total * product.discount / 100);
    update();
  }

  void getTotal() {
    total.value = 0.0;
    payment.value = 0.0;
    for (int i = 0; i < listCart.length; i++) {
      total.value += listCart[i].total;
      payment.value += listCart[i].payment;
    }
    update();
  }
}
