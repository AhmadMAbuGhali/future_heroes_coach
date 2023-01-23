import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "notification ".tr,
                  style: getBoldStyle(color: ColorManager.black),
                ),
                CircleAvatar(
                  backgroundColor: ColorManager.primary,
                  radius: 17,
                  child: Text(
                    "4",
                    style: getRegularStyle(color: ColorManager.white),
                  ),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "markAsRead".tr,
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: 12),
                    ))
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 7,
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
                                      "notificationTitle".tr,
                                      style: getBoldStyle(
                                          color: ColorManager.black,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                collapsed: Text(
                                  "notificationBody".tr,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                expanded: Column(
                                  children: [
                                    Text("notificationBody".tr),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          IconAssets.time,
                                          color: ColorManager.primary,
                                        ),
                                        Text(
                                          "02 ساعات".tr,
                                          style: getRegularStyle(
                                              color: ColorManager.primary),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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
    );
  }
}
