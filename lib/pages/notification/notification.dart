import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../services/app_provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return RefreshIndicator(
        onRefresh: ()async{
          await provider.getIsActive();
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  children: [
                    Text(
                      "notification".tr,
                      style: getBoldStyle(color: ColorManager.black),
                    ),
                    SizedBox(width: 10.w,),
                    CircleAvatar(
                      backgroundColor: ColorManager.primary,
                      radius: 17,
                      child: Text(
                        "${provider.notificationModel.length}",
                        style: getRegularStyle(color: ColorManager.white),
                      ),
                    ),
                    // Spacer(),
                    // TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "markAsRead".tr,
                    //       style: getBoldStyle(
                    //           color: ColorManager.primary, fontSize: 12),
                    //     ))
                  ],
                ),
                Expanded(
                    child: provider.notificationModel.isEmpty?Center(
                        child: Text(
                          "noNotification".tr,
                          style: getBoldStyle(
                              color: ColorManager.primary, fontSize: 20.sp),
                        )): ListView.builder(
                        itemCount: provider.notificationModel.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                ExpandablePanel(
                                  header: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 3,
                                        backgroundColor: ColorManager.primary,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        width: 25.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          color: ColorManager.jewelryBG,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: SvgPicture.asset(
                                            IconAssets.notifications,
                                            width: 10.w,
                                            height: 10.h,
                                            color: ColorManager.primary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        provider.notificationModel[index].message!,
                                        style: getBoldStyle(
                                            color: ColorManager.black,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  collapsed: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                                        child: Text(
                                          provider.notificationModel[index].respone??"",
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  expanded:  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
                                        child: Text(
                                          provider.notificationModel[index].respone??"",
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),),
                                Divider(
                                  thickness: 2,
                                  endIndent: 3,
                                  height: 2,
                                )
                              ],
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      );});

  }
}
