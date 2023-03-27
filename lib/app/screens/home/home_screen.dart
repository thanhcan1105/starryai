import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:starryai/app/screens/home/detail_discover.dart';
import 'package:starryai/app/screens/my_creations/detail_image.dart';

import '../../controllers/home_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../controllers/my_creations_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            // leading: null
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'starryai',
              style: TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.star),
                    Text('Pro'),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  border: Border.all(color: Colors.green, width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.money,
                      color: Colors.pink,
                    ),
                    Text(
                      'Earn',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: const Text(
                  'i',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    CreateWidget(),
                    ProjectWidget(),
                    RecentWidget(),
                    EventWidget(),
                    DiscoverWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DiscoverWidget extends StatelessWidget {
  const DiscoverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Menu(
      title: 'Discover',
      leftText: 'Get Featured',
      widgetChild: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: controller.images.map((String url) {
          return GestureDetector(
            onTap: () {
              Get.to(
                const DetailDiscover(),
                arguments: {'url': url},
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0.3, 0.3))
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: url,
                  width: Get.width * 0.44,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Event',
      widgetChild: Container(
        width: Get.width,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0.3, 0.3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: Get.width,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://pbs.twimg.com/media/FqwW0GoaYAAdo_6?format=jpg&name=small',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '21-Day Challenge',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '#FeelTheArt',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentWidget extends StatelessWidget {
  const RecentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyCreationsController creationController = Get.put(MyCreationsController());
    return Menu(
      title: 'Recent',
      widgetChild: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(const DetailImage(), arguments: {
                'image_id': creationController.images.first.id,
              });
            },
            child: Container(
              height: Get.width * 0.29,
              width: Get.width * 0.29,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: creationController.images.first.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Projects',
      leftText: 'See All',
      widgetChild: GestureDetector(
        onTap: () {
          Get.toNamed('my_creations');
        },
        child: Container(
          width: Get.width * 0.4,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0.3, 0.3),
              )
            ],
          ),
          child: const Icon(Iconsax.element_plus),
        ),
      ),
    );
  }
}

class CreateWidget extends StatelessWidget {
  const CreateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: 'Create',
      widgetChild: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('create_prompt');
            },
            child: Container(
              height: 60,
              width: Get.width * .45,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(0.3, 0.3),
                  ),
                ],
                image: const DecorationImage(image: AssetImage('assets/icons/art-icon-1.jpg'), fit: BoxFit.cover, opacity: 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Art',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.toNamed('create_prompt');
            },
            child: Container(
              height: 60,
              width: Get.width * .45,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(0.3, 0.3),
                  ),
                ],
                image: const DecorationImage(image: AssetImage('assets/icons/moutain-icon.jpg'), fit: BoxFit.cover, opacity: 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.camera,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Picture',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // widgetChild: GestureDetector(
      //   onTap: () {
      //     Get.toNamed('create_prompt');
      //   },
      //   child: Container(
      //     height: 50,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       border: Border.all(color: Colors.grey),
      //       borderRadius: BorderRadius.circular(20),
      //       boxShadow: const [
      //         BoxShadow(
      //           color: Colors.grey,
      //           blurRadius: 5,
      //           offset: Offset(0.3, 0.3),
      //         ),
      //       ],
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.all(15),
      //       child: Row(
      //         children: const [
      //           Icon(
      //             Icons.edit,
      //             size: 18,
      //           ),
      //           Text('Enter a prompt...'),
      //           Spacer(),
      //           Icon(Icons.camera_alt)
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class Menu extends StatelessWidget {
  Menu({
    super.key,
    // required this.suffixWidget,
    required this.title,
    this.leftText,
    this.widgetChild,
  });

  // Widget suffixWidget;
  String title;
  String? leftText;
  Widget? widgetChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            // suffixWidget,
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            const Spacer(),
            leftText != null ? Text(leftText!) : Container(),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        widgetChild ?? Container(),
      ],
    );
  }
}
