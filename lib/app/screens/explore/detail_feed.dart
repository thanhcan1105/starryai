import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:starryai/app/controllers/explore_controller.dart';

class DetailFeed extends GetView<ExploreController> {
  const DetailFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = Get.arguments;
    final String url = arguments['image'];
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
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: url,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.all(Radius.circular(20)),
                                  shape: BoxShape.circle,
                                  border: Border.all()
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey,
                                  //     blurRadius: 5,
                                  //     offset: Offset(0.3, 0.3)
                                  //   ),
                                  // ],
                                  ),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: url,
                                  width: Get.width * 0.08,
                                  height: Get.width * 0.08,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('Name Auther'),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text('Follow'),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("So Curly"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  Icon(Iconsax.heart),
                                  Text('Like'),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Column(
                                children: const [
                                  Icon(Iconsax.share),
                                  Text('Share'),
                                ],
                              ),
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
                            children: const [
                              Icon(Iconsax.pen_add),
                              Text(
                                'Setting Hidden',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(Icons.keyboard_arrow_down),
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
