import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:starryai/app/controllers/intro_controller.dart';

class IntroScreen extends GetView<IntroController> {
  IntroScreen({super.key});

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    IntroController controller = Get.put(IntroController());
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: IntroductionScreen(
        pages: [
          ...controller.listPagesViewModel.map(
            (e) => PageViewModel(
              title: e['title'],
              body: e['body'],
              image: _buildImage(e['image_url']),
              decoration: pageDecoration,
            ),
          ),
        ],
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: true,
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        // showBackButton: true,
        next: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        onDone: () {
          // When done button is press
          Get.offAllNamed('bottom_menu');
          box.write('isFirstStart', false);
        },
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        skipStyle: TextButton.styleFrom(primary: Colors.red),
        doneStyle: TextButton.styleFrom(primary: Colors.green),
        nextStyle: TextButton.styleFrom(primary: Colors.blue),
      ),
    );
  }
}
