import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  void selectedBottomBar(value) {
    isLoading.value = true;
    selectedIndex.value = value;
    isLoading.value = false;
  }

  final List<String> images = [
    'https://static.wikia.nocookie.net/vocaloid/images/5/55/IAROCKSDISE%C3%91O.jpg/revision/latest?cb=20140621174752&path-prefix=es',
    'https://pbs.twimg.com/media/FqSn_DzacAA5ABJ?format=jpg&name=small',
    'https://pbs.twimg.com/media/Fqp2o0XagAAsLTy?format=jpg&name=small',
    'https://pbs.twimg.com/media/Fqgvz4taYAMIOTb?format=jpg&name=small',
    'https://pbs.twimg.com/media/FqpwYKtaAAMrVTf?format=png&name=small',
    'https://pbs.twimg.com/media/FqiK4cXaUAEMYEQ?format=jpg&name=small',
  ];
}

