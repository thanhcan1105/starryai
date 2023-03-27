import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starryai/app/controllers/create_prompt_controller.dart';
import 'package:starryai/app/screens/create_prompt/component/advanced_option.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'component/normal_option.dart';

class CreatePromptScreen extends GetView<CreatePromptController> {
  const CreatePromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.1,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: Row(
                            children: const [
                              Text(
                                'Art',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIconColor: Colors.black,
                        prefixIcon: const Icon(Icons.edit),
                        hintText: 'What do you want to see?',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.swap_horiz),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Text('Prompt Builder'),
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'assets/icons/art-icon.jpg',
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Style',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          ...controller.styleList.map(
                            (e) => Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.selectedStyleId.value = e.id;
                                },
                                child: StyleItem(
                                  title: e.title,
                                  image: e.image,
                                  isSelected:
                                      controller.selectedStyleId.value == e.id,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.isAdvancedOption.value
                        ? AdvacedOption(controller: controller)
                        : NormalOption(controller: controller),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 1.0,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: SizedBox(
              height: Get.height * 0.25,
              child: Column(
                children: [
                  // const Divider(
                  //   color: Colors.black,
                  // ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // controller.onClickAdvancedOption();
                          Fluttertoast.showToast(
                              msg: 'You don\'t do it',
                              backgroundColor: Colors.white,
                              textColor: Colors.black);
                        },
                        child: Container(
                          width: Get.width * 0.4,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text('+ Add Creation'),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // controller.onClickAdvancedOption();
                          Fluttertoast.showToast(
                              msg: 'You don\'t do it',
                              backgroundColor: Colors.white,
                              textColor: Colors.black);
                        },
                        child: Container(
                          width: Get.width * 0.4,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text('Advanced Option'),
                        ),
                      )
                    ],
                  ),
                  Container(
                    // width: Get.width * 0.8,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Create',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('This creation will use 1 credit.')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StyleItem extends StatelessWidget {
  StyleItem({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
  });

  String title;
  String image;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: isSelected ? 115 : 100,
          height: isSelected ? 115 : 100,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: Colors.red, width: 1.5)
                : Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0.5, 0.5),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(title),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          // horizontal: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: Get.width * 0.33,
                ),
                Container(
                  width: Get.width * 0.33,
                  // color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text(
                    'Select AI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: Get.width * 0.33,
                    // color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text('Done'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                print('1');
                Get.back();
              },
              child: Container(
                height: 130,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/art-icon-1.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Art',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Generate artwork with a wide range of artistic styles to choose',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                print('2');
                Get.back();
              },
              child: Container(
                height: 130,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/moutain-icon.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Picture',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Generate artwork with a wide range of artistic styles to choose',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
