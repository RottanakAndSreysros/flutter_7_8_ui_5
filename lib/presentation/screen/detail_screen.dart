import 'package:flutter/material.dart';
import 'package:flutter_7_8_ui_5/core/data/controller/product_controller.dart';
import 'package:flutter_7_8_ui_5/core/data/model/product_model.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.productId});
  final int productId;
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(listProduct[productId - 1].image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 100,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Positioned(
                              top: -30,
                              right: -60,
                              child: Container(
                                alignment: Alignment.center,
                                height: 35,
                                width: 150,
                                color: Colors.red,
                                transform: Matrix4.rotationZ(0.7),
                                child: Text(
                                  "Off ${listProduct[productId - 1].discount} %",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              listProduct[productId - 1].name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${listProduct[productId - 1].price} \$",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      listProduct[productId - 1].rate.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              listProduct[productId - 1].description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[1000],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {
            final index = productId - 1;

            if (productController.listCart.any(
              (element) => element.id == listProduct[index].id,
            )) {
              Get.snackbar(
                "Successfully",
                "Add to cart successfully!",
                duration: const Duration(seconds: 1),
              );
              return;
            } else {
              productController.addTocart(
                ProductModel(
                  id: listProduct[index].id,
                  name: listProduct[index].name,
                  image: listProduct[index].image,
                  price: listProduct[index].price,
                  quantity: listProduct[index].quantity,
                  total:
                      (listProduct[index].price * listProduct[index].quantity),
                  payment: ((listProduct[index].price *
                          listProduct[index].quantity) -
                      ((listProduct[index].price *
                              listProduct[index].quantity) *
                          listProduct[index].discount /
                          100)),
                  discount: listProduct[index].discount,
                  discountPrice: ((listProduct[index].price *
                          listProduct[index].quantity) *
                      (listProduct[index].discount / 100)),
                  rate: listProduct[index].rate,
                  description: listProduct[index].description,
                ),
              );
            }
            productController.getTotal();
            Get.snackbar(
              "Successfully",
              "Add to cart successfully!",
              duration: const Duration(seconds: 1),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Add to card",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// echo "# flutter_7_8_ui_5" >> README.md
// git init
// git add README.md
// git commit -m "second commit"
// git branch -M main
// git remote add origin https://github.com/RottanakAndSreysros/flutter_7_8_ui_5.git
// git push -u origin main


// git remote add origin https://github.com/RottanakAndSreysros/flutter_7_8_ui_5.git
// git branch -M main
// git push -u origin main

// echo "# flutter_7_8_ui_5" >> README.md
// git init
// git add README.md
// git commit -m "second commit"
// git branch -M main
// git remote add origin https://github.com/RottanakAndSreysros/flutter_7_8_ui_5.git
// git push -u origin main