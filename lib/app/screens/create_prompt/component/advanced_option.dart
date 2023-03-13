import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/create_prompt_controller.dart';

class AdvacedOption extends StatelessWidget {
  const AdvacedOption({
    super.key,
    required this.controller,
  });

  final CreatePromptController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Item(
          prefixWidget: const Icon(Icons.abc),
          text: 'Remove from Image',
          suffixWidget: Column(),
        ),
        Item(
          prefixWidget: const Icon(Icons.abc),
          text: 'Start Image',
          suffixWidget: Column(),
        ),
        Item(
          prefixWidget: const Icon(
            Icons.camera_alt_outlined,
          ),
          text: 'Image',
          suffixWidget: Obx(
            () => Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // print('decrement');
                    controller.decrement();
                  },
                  child: Container(
                    width: 30,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    child: const Icon(Icons.remove),
                  ),
                ),
                Container(
                  width: 35,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Colors.black),
                      bottom: BorderSide(width: 1.0, color: Colors.black),
                    ),
                  ),
                  child: Text(controller.imageTotal.toString()),
                ),
                GestureDetector(
                  onTap: () {
                    // print('increment');
                    controller.increment();
                  },
                  child: Container(
                    width: 30,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ),
        Item(
          prefixWidget: const Icon(Icons.abc),
          text: 'Canvas Size',
          suffixWidget: Column(),
        ),
        Item(
          prefixWidget: const Icon(Icons.abc),
          text: 'Runtime',
          suffixWidget: Column(),
        ),
        Item(
          prefixWidget: const Icon(Icons.abc),
          text: 'Seed',
          suffixWidget: Column(),
        ),
        Item(
          prefixWidget: const Icon(Icons.abc),
          text: 'Save to',
          suffixWidget: Column(),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  Item({
    super.key,
    required this.text,
    required this.suffixWidget,
    required this.prefixWidget,
  });

  String text;
  Widget suffixWidget;
  Widget prefixWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0.3, 0.3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            prefixWidget,
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            suffixWidget,
          ],
        ),
      ),
    );
  }
}
