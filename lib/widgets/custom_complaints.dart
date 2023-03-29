import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../resources/styles_manager.dart';
import '../services/app_provider.dart';

class CustomComplaints extends StatelessWidget {
  const CustomComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, provider, x) {
      return ListView.builder(
          itemCount: provider.complaintReplay.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ExpandablePanel(
                  header: Row(
                    children: [
                      const CircleAvatar(
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
                            IconAssets.report,
                            width: 10.w,
                            height: 10.h,
                            // color: ColorManager.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "replayOnComp".tr +
                            " " +
                            provider.complaintReplay[index].title!,
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 12),
                      ),
                    ],
                  ),
                  collapsed: Container(
                    margin: const EdgeInsets.only(right: 55),
                    child: Text(
                      provider.complaintReplay[index].respone!,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getRegularStyle(color: ColorManager.gray),
                    ),
                  ),
                  expanded: Container(
                    margin: const EdgeInsets.only(right: 55),
                    child: Text(
                      provider.complaintReplay[index].respone!,
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
                  height: 2.h,
                )
              ],
            );
          });
    });
  }
}
