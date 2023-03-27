import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starryai/app/controllers/my_creations_controller.dart';
import 'package:starryai/app/screens/my_creations/component/items_created.dart';
import 'package:starryai/app/screens/my_creations/detail_image.dart';

class MyCreationsScreen extends GetView<MyCreationsController> {
  const MyCreationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyCreationsController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Creations',
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            width: 100,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            // height: 5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Select',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: Get.height * 0.1),
            // height: Get.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              'All',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            width: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: Colors.amber,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              'Projects',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('Recent'),
                          const Icon(Icons.arrow_drop_down),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            child: const Icon(Icons.zoom_in),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: const Icon(Icons.zoom_out),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //Size small

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Wrap(
                spacing: Get.width * 0.05,
                runSpacing: 20,
                children: [
                  SmallSize(),
                  SmallSize(),
                ],
              ),
            ),
          ),

          //Size full
          // Expanded(
          //   child: ListView(
          //     physics: const BouncingScrollPhysics(),
          //     children: const [
          //       Itemcreated(),
          //       Itemcreated(),
          //     ],
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.toNamed('create_prompt');
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.green,
          size: 30,
        ),
      ),
    );
  }
}

class SmallSize extends StatelessWidget {
  SmallSize({
    super.key,
  });

  MyCreationsController controller = MyCreationsController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const DetailImage(),
            arguments: {'image_id': controller.images.first.id});
      },
      child: Container(
        height: Get.width * 0.5,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(0.3, 0.3),
              )
            ]),
        child: Stack(
          children: [
            SizedBox(
              height: Get.width * 0.5,
              width: Get.width * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: controller.images.first.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.more_horiz,),
            ),
          ],
        ),
      ),
    );
  }
}
