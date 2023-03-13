import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:starryai/app/controllers/explore_controller.dart';
import 'package:starryai/app/screens/explore/detail_feed.dart';

class ExploreScreen extends GetView<ExploreController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExploreController controller = Get.put(ExploreController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Explore',
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ...controller.images.map(
                (e) => GestureDetector(
                  onTap: () {
                    Get.to(
                      const DetailFeed(),
                      arguments: {'image': e},
                    );
                  },
                  child: ItemWidget(linkImg: e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.linkImg,
  });

  String linkImg;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.more_horiz),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            // color: Colors.amber,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: linkImg,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.7,
                      child: Text(
                        'Text' * 20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.comment_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Iconsax.like),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
