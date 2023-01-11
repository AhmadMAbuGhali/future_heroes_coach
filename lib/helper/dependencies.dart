
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api_client.dart';


Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(()=> sharedPreferences);
  //api client
// Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//repo
// Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
// Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
// Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));

//controller
// Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
// Get.lazyPut(() => RecommendedProductController( recommendedProductRepo: Get.find()));
// Get.lazyPut(() => CartController( cartRepo: Get.find()));
}