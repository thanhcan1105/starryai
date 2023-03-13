import 'package:get/get.dart';

class MyCreationsController extends GetxController {
  final List<ListItem> images = [
    ListItem(
      id: 1,
      image:
          'https://pbs.twimg.com/media/FqSn_DzacAA5ABJ?format=jpg&name=small',
    ),
    ListItem(
      id: 2,
      image:
          'https://pbs.twimg.com/media/Fqp2o0XagAAsLTy?format=jpg&name=small',
    ),
    ListItem(
      id: 3,
      image:
          'https://pbs.twimg.com/media/Fqgvz4taYAMIOTb?format=jpg&name=small',
    ),
    ListItem(
      id: 4,
      image:
          'https://pbs.twimg.com/media/FqpwYKtaAAMrVTf?format=png&name=small',
    ),
  ];
}

class ListItem {
  final int id;
  final String image;

  ListItem({required this.id, required this.image});
}
