import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    final GoogleSignIn googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    print(googleSignIn.scopes);
    super.onInit();
  }

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
