import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starryai/app/controllers/my_creations_controller.dart';
import 'package:starryai/app/screens/my_creations/component/items_created.dart';

class MyCreationsScreen extends GetView<MyCreationsController> {
  const MyCreationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyCreationsController());
    return Scaffold(
      appBar: AppBar(
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
          SizedBox(
            height: Get.height * 0.7,
            // color: Colors.amber,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                Itemcreated(),
                Itemcreated(),
              ],
            ),
          )
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
