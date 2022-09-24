
import 'package:get/get.dart';

import '../languages/ban.dart';
import '../languages/eng.dart';

class AppLanguages extends Translations {

  @override
  Map<String, Map<String , String>> get keys => {
    'en_US': eng,
    'bn_BD': ban,
  };
}