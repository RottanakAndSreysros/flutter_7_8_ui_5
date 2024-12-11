import 'package:flutter/material.dart';
import 'package:flutter_7_8_ui_5/presentation/screen/cart_screen.dart';
import 'package:flutter_7_8_ui_5/core/data/controller/product_controller.dart';
import 'package:flutter_7_8_ui_5/core/data/model/product_model.dart';
import 'package:flutter_7_8_ui_5/presentation/screen/detail_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<ProductController>(
        init: productController,
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -25, end: -10),
                      showBadge: productController.listCart.isNotEmpty,
                      ignorePointer: false,
                      onTap: () {
                        Get.to(CartScreen());
                      },
                      badgeContent: Obx(
                        () {
                          return Text(
                            "${productController.listCart.length}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      badgeStyle: badges.BadgeStyle(
                        //shape: badges.BadgeShape.circle,
                        //badgeColor: Colors.blue,
                        padding: const EdgeInsets.all(5),
                        borderRadius: BorderRadius.circular(4),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderGradient: const badges.BadgeGradient.linear(
                          colors: [
                            Colors.red,
                            Colors.blue,
                          ],
                        ),
                        badgeGradient: const badges.BadgeGradient.linear(
                          colors: [
                            Colors.blue,
                            Colors.yellow,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        elevation: 0,
                      ),
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        size: 35,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Explorer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 330,
                  width: double.infinity,
                  //color: Colors.amber,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listProduct.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                        child: GestureDetector(
                          onTap: () {
                            print("Hello");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailScreen(
                                    productId: listProduct[index].id,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 330,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            listProduct[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              height: 100,
                                              child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                                  Positioned(
                                                    top: -30,
                                                    right: -60,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 35,
                                                      width: 150,
                                                      color: Colors.red,
                                                      transform:
                                                          Matrix4.rotationZ(
                                                              0.7),
                                                      child: Text(
                                                        "Off ${listProduct[index].discount} %",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listProduct[index].name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              listProduct[index].description,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "${listProduct[index].price} \$",
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 48),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (productController.listCart.any(
                                              (element) =>
                                                  element.id ==
                                                  listProduct[index].id,
                                            )) {
                                              Get.snackbar(
                                                "Successfully",
                                                "Add to cart successfully!",
                                                duration:
                                                    const Duration(seconds: 1),
                                              );
                                              return;
                                            } else {
                                              productController.addTocart(
                                                ProductModel(
                                                  id: listProduct[index].id,
                                                  name: listProduct[index].name,
                                                  image:
                                                      listProduct[index].image,
                                                  price:
                                                      listProduct[index].price,
                                                  quantity: listProduct[index]
                                                      .quantity,
                                                  total: (listProduct[index]
                                                          .price *
                                                      listProduct[index]
                                                          .quantity),
                                                  payment: ((listProduct[index]
                                                              .price *
                                                          listProduct[index]
                                                              .quantity) -
                                                      ((listProduct[index]
                                                                  .price *
                                                              listProduct[index]
                                                                  .quantity) *
                                                          listProduct[index]
                                                              .discount /
                                                          100)),
                                                  discount: listProduct[index]
                                                      .discount,
                                                  discountPrice:
                                                      ((listProduct[index]
                                                                  .price *
                                                              listProduct[index]
                                                                  .quantity) *
                                                          (listProduct[index]
                                                                  .discount /
                                                              100)),
                                                  rate: listProduct[index].rate,
                                                  description:
                                                      listProduct[index]
                                                          .description,
                                                ),
                                              );
                                            }
                                            productController.getTotal();
                                            Get.snackbar(
                                              "Successfully",
                                              "Add to cart successfully!",
                                              duration:
                                                  const Duration(seconds: 1),
                                            );
                                            print(listProduct[index].id);
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Text(
                                              "Add",
                                              style: TextStyle(
                                                fontSize: 16,
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  "Best sale",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
