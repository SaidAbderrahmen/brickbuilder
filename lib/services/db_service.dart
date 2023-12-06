import 'package:get/get.dart';

class DbService extends GetxService {
  static late DbService dbService;

  Future<DbService> init() async {
    dbService = Get.put(DbService());
    print("Db service initialized".toString());
    return this;
  }
}
