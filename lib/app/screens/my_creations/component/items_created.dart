import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starryai/app/screens/my_creations/detail_image.dart';

import '../../../controllers/my_creations_controller.dart';

class Itemcreated extends StatelessWidget {
  const Itemcreated({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    MyCreationsController controller = Get.put(MyCreationsController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0.5, 0.5),
                ),
              ],
            ),
            child: Wrap(
              spacing: 2,
              runSpacing: 2,
              children: [
                ...controller.images.map(
                  (e) => GestureDetector(
                    onTap: (){
                      Get.to(const DetailImage(), arguments: {'image_id': e.id});
                    },
                    child: Container(
                      height: 200,
                      width: Get.width * 0.43,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0.3, 0.3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: getBorderRadius(
                          e.id,
                          controller.images.length,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: e.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'data',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              GestureDetector(
                child: const Icon(Icons.refresh),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Run time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('data'),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Model',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('data'),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Style',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('data'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

BorderRadius? getBorderRadius(int id, length) {
  switch (id) {
    case 1:
      if (length == 2) {
        return const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        );
      } else {
        return const BorderRadius.only(topLeft: Radius.circular(20));
      }
    case 2:
      if (length == 2) {
        return const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else {
        return const BorderRadius.only(topRight: Radius.circular(20));
      }

    case 3:
      if (id == length - 1) {
        return const BorderRadius.only(bottomLeft: Radius.circular(20));
      }
      break;
    case 4:
      if (id == length) {
        return const BorderRadius.only(bottomRight: Radius.circular(20));
      }
      break;
    default:
      break;
  }
  return const BorderRadius.only(bottomRight: Radius.circular(0));
}
