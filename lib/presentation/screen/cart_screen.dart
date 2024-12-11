import 'package:flutter/material.dart';
import 'package:flutter_7_8_ui_5/core/data/controller/product_controller.dart';
import 'package:flutter_7_8_ui_5/presentation/screen/home_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 50,
        title: const Text("Back"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Obx(
            () {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total       : ${productController.total.value.toStringAsFixed(2)} \$",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Payment : ${productController.payment.value.toStringAsFixed(2)} \$",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 22),
                              child: Container(
                                height: 60,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Payment",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Obx(
                () {
                  return productController.listCart.isEmpty
                      ? const Center(
                          child: Text(
                            "Empty",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: productController.listCart.length,
                          itemBuilder: (context, index) {
                            final product = productController.listCart[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Slidable(
                                key:
                                    ValueKey(productController.listCart.length),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  dismissible: DismissiblePane(
                                    onDismissed: () {
                                      Get.to(const HomeScreen());
                                      Future.delayed(
                                              const Duration(microseconds: 1))
                                          .then(
                                        (value) => Get.to(
                                          CartScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                  children: [
                                    // SlidableAction(
                                    //   onPressed: (context) {},
                                    //   backgroundColor: const Color(0xFFFE4A49),
                                    //   foregroundColor: Colors.white,
                                    //   icon: Icons.delete,
                                    //   label: 'Delete',
                                    // ),
                                    SlidableAction(
                                      onPressed: (context) {
                                        productController.deleteFromCart(
                                            id: product.id);
                                      },
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ],
                                ),
                                child: Container(
                                  height: 170,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10, left: 10),
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                product.image,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product.name,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Price   : ${product.price} \$",
                                                  ),
                                                  Text(
                                                      "Off ${product.discount} %"),
                                                ],
                                              ),
                                              Text(
                                                  "Quantity: ${product.quantity}"),
                                              Text(
                                                  "Total   : ${product.total} \$"),
                                              Text(
                                                  "Payment : ${product.payment} \$"),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 10),
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.blue,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          productController
                                                              .increaseQuantity(
                                                                  product.id);
                                                          productController
                                                              .getTotal();
                                                          print(
                                                              "====${product.id}");
                                                        },
                                                        icon: const Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 10),
                                                    child: Container(
                                                      height: 40,
                                                      width: 40,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.blue,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          productController
                                                              .decreaseQuantity(
                                                                  product.id);
                                                          productController
                                                              .getTotal();
                                                          print(
                                                              "====${product.id}");
                                                        },
                                                        icon: const Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
