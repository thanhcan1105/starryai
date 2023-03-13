import 'package:get/get.dart';

class CreatePromptController extends GetxController {
  RxInt imageTotal = 2.obs;
  RxBool isLoading = false.obs;
  RxBool isAdvancedOption = false.obs;
  RxInt selectedStyleId = 1.obs;

  onClickAdvancedOption() {
    if (isAdvancedOption.isTrue) {
      isAdvancedOption.value = false;
    } else {
      isAdvancedOption.value = true;
    }
  }

  increment() {
    if (imageTotal < 8) {
      imageTotal = imageTotal + 2;
    }
  }

  decrement() {
    if (imageTotal > 2) {
      imageTotal = imageTotal - 2;
    }
  }

  styleSelected(id){

  }

  // List<StyleModel> styleList = [
  //   StyleModel('id': 1, 'title': 'None', 'image': 'assets/icons/none-icon.jpg','status': true)
  // ];
  List<StyleModel> styleList = [
    StyleModel(id: 1, title: 'None', image: 'assets/icons/none-icon.jpg', status: false),
    StyleModel(id: 2, title: 'Fantasy', image: 'assets/icons/fantasy-icon.jpg', status: false),
    StyleModel(id: 3, title: 'Portrait', image: 'assets/icons/portrait-icon.jpg', status: false),
    StyleModel(id: 4, title: '3D Art', image: 'assets/icons/3d-icon.jpg', status: false),
    StyleModel(id: 5, title: 'Woolitize', image: 'assets/icons/woolitize-icon.jpg', status: false),
    StyleModel(id: 6, title: 'Anime', image: 'assets/icons/anime-icon.jpg', status: false),
  ];
}

class StyleModel {
  int id;
  String title;
  String image;
  bool status;

  StyleModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.status,});
}
