import 'package:get/get.dart';
import 'package:minefield/presenter/controllers/mine_field_controller.dart';

class MineFieldBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MineFieldController>(MineFieldController(), permanent: true);
  }
}
