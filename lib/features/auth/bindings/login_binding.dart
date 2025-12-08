import 'package:get/get.dart';
import 'package:job_seeker/features/auth/controller/auth_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(()=>AuthController());
  }
}