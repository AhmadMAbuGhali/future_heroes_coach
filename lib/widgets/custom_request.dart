import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';

class CustomRequest extends StatelessWidget {
  const CustomRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                        radius: 3.r,
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
                            IconAssets.jewelry,
                            width: 10.w,
                            height: 10.h,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: Text(
                          "requestTitle".tr,
                          overflow: TextOverflow.ellipsis,                        softWrap: true,
                          maxLines: 1,
                          style: getBoldStyle(
                              color: ColorManager.black, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  collapsed: Container(
                    margin: EdgeInsets.only(right: 55),
                    child: Text(
                      "requestBody".tr,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(color: ColorManager.gray),
                    ),
                  ),
                  expanded: Container(
                    margin: EdgeInsets.only(right: 55),
                    child: Text(
                      "requestBody".tr,
                      softWrap: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Divider(
                  thickness: 2,
                  endIndent: 3,
                  height: 2,
                )
              ],
            ),
          );
        });
  }
}
