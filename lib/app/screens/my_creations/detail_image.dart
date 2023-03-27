import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:starryai/app/controllers/my_creations_controller.dart';

class DetailImage extends GetView<MyCreationsController> {
  const DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = Get.arguments;
    final int id = arguments['image_id'];
    return Scaffold(
      body: SafeArea(
        child: Container(
          // height: 200,
          color: Colors.black,
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Get.back();
                      },
                      child: const Icon(
                        Icons.download,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.back();
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // CarouselSlider.builder(itemCount: itemCount, itemBuilder: itemBuilder, options: options)
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: CarouselSlider(
                    items: controller.images.map((e) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            // width: Get.width,
                            // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            // decoration:
                            //     const BoxDecoration(color: Colors.amber),
                            child: CachedNetworkImage(
                              imageUrl: e.image,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      // height: 800,
                      viewportFraction:
                          1, // hiển thị slide với độ rộng toàn bộ
                      aspectRatio: 1 / 1, // tỷ lệ khung hình 16:9
                      // autoPlay: true, // tự động chuyển slide
                      enlargeCenterPage: true, // phóng to slide ở giữa
                      // enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: true, // lặp vô hạn các slide
                    ),
                  ),
                  // child: CachedNetworkImage(
                  //   imageUrl: controller.images
                  //       .where((element) => element.id == id)
                  //       .first
                  //       .image,
                  // ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(10),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           border: Border.all(),
                      //         ),
                      //         child: ClipOval(
                      //           child: CachedNetworkImage(
                      //             imageUrl: controller.images.first.image,
                      //             width: Get.width * 0.08,
                      //             height: Get.width * 0.08,
                      //             fit: BoxFit.cover,
                      //             placeholder: (context, url) =>
                      //                 const CircularProgressIndicator(),
                      //             errorWidget: (context, url, error) =>
                      //                 const Icon(Icons.error),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       const Text('Name Auther'),
                      //       const Spacer(),
                      //       Container(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 10, vertical: 5),
                      //         decoration: BoxDecoration(
                      //           border: Border.all(),
                      //           borderRadius: BorderRadius.circular(20),
                      //         ),
                      //         child: const Text('Follow'),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Name Prompt"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  Icon(Iconsax.arrow_swap_horizontal),
                                  Text('Variations'),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Column(
                                children: const [
                                  Icon(Iconsax.repeat),
                                  Text('Evolve'),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: const [
                                Icon(Iconsax.copy),
                                Text('Up Scale'),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: const [
                                Icon(Iconsax.eye),
                                Text('Public'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              const Icon(Iconsax.pen_add),
                              Text(
                                'Prompt'.toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.settings),
                              Text(
                                'Setting'.toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
      ),
    );
  }
}
