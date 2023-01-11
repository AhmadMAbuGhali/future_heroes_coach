
import 'package:get/get.dart';

class RouteHelper {

  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage= "/cart-page";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';

  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page ) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  // static List<GetPage> routes = [
  //   GetPage(
  //       name: splashScreen,
  //       page: () {
  //         return SplashScreen();
  //       }),
  //
  //   GetPage(
  //       name: initial,
  //       page: () {
  //         return HomePage();
  //       }),
  //   GetPage(
  //       name: popularFood,
  //       page: () {
  //         var pageId= Get.parameters['pageId'];
  //         var page= Get.parameters['page'];
  //         return PopularFoodDetailPage( pageId: int.parse(pageId!),page:page!);
  //       },
  //       transition: Transition.fadeIn),
  //   GetPage(
  //       name: recommendedFood,
  //       page: () {
  //         var pageId= Get.parameters['pageId'];
  //         var page= Get.parameters['page'];
  //
  //         return RecommendedFoodDetail( pageId: int.parse(pageId!),page:page!);
  //       },
  //       transition: Transition.fadeIn),
  //
  //   GetPage(name: cartPage, page: (){
  //     return CartPage();
  //   },
  //     transition: Transition.fadeIn
  //   )
  // ];
}
