import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/services/app_provider.dart';
import 'package:future_heroes_coach/widgets/CustomButtonPrimary.dart';
import 'package:future_heroes_coach/widgets/custom_complaints.dart';
import 'package:future_heroes_coach/widgets/custom_request.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RequestsAndComplaints extends StatefulWidget {
  const RequestsAndComplaints({Key? key}) : super(key: key);

  @override
  State<RequestsAndComplaints> createState() => _RequestsAndComplaintsState();
}

class _RequestsAndComplaintsState extends State<RequestsAndComplaints>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  List<Color>? tabBackground;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabBackground = [Colors.blue, Colors.pink, Colors.cyan];
    tabController?.addListener(() {
      if (tabController!.indexIsChanging) {
        setState(() {
          tabBackground![tabController!.index] = ColorManager.primary;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            print('object');
            await provider.getComplaintReplay();
            await provider.getOrderReplay();
          },
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed(RouteHelper.initial);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: ColorManager.primary,
                              )),
                          Text(
                            'user'.tr,
                            style: getBoldStyle(color: ColorManager.primary),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          ButtonsTabBar(
                            buttonMargin:
                                const EdgeInsets.symmetric(horizontal: 10),
                            contentPadding: EdgeInsets.only(
                                top: 6.h,
                                bottom: 10.h,
                                left: 17.w,
                                right: 18.w),
                            height: 45.h,
                            backgroundColor: ColorManager.primary,
                            unselectedBackgroundColor: Colors.white,
                            unselectedLabelStyle:
                                getBoldStyle(color: Colors.black, fontSize: 12),
                            borderWidth: 1,
                            borderColor: ColorManager.primary,
                            labelStyle: getBoldStyle(
                                color: ColorManager.white, fontSize: 12),
                            tabs: [
                              Tab(
                                text: "complaints".tr,
                                height: 70.h,
                              ),
                              Tab(
                                text: 'requests'.tr,
                                height: 70.h,
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: <Widget>[
                                RefreshIndicator(
                                  onRefresh: () async {
                                    await provider.getComplaintReplay();
                                    await provider.getOrderReplay();
                                  },
                                  child: Center(
                                      child: Column(children: [
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.59,
                                        child: CustomComplaints()),
                                    CustomButtonPrimary(
                                        text: "sendComplaint".tr,
                                        onpressed: () {
                                          Get.toNamed(
                                              RouteHelper.sendComplaints);
                                        }),
                                  ])),
                                ),
                                RefreshIndicator(
                                  onRefresh: () async {
                                    await provider.getComplaintReplay();
                                    await provider.getOrderReplay();
                                  },
                                  child: Center(
                                      child: Column(children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        child: CustomRequest()),
                                    CustomButtonPrimary(
                                        text: 'sendRequest'.tr,
                                        onpressed: () {
                                          Get.toNamed(RouteHelper.sendRequests);
                                        }),
                                  ])),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      );
    });
  }
}
