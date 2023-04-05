import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_heroes_coach/data/api/apiconst.dart';
import 'package:future_heroes_coach/resources/assets_manager.dart';
import 'package:future_heroes_coach/resources/color_manager.dart';
import 'package:future_heroes_coach/resources/styles_manager.dart';
import 'package:future_heroes_coach/routes/route_helper.dart';
import 'package:future_heroes_coach/widgets/CustomTextTitle.dart';
import 'package:get/get.dart';

class CardCustomers extends StatelessWidget {
  String name;
  String memberLabel;
  String memberNumber;
  String customerImage= "3139c8bb-601a-44bd-8242-43d744ce0e76.jpg";
  Function()? ontap;
  CardCustomers(
      {super.key,
      required this.name,
      required this.memberLabel,
        required this.memberNumber,
      required this.customerImage,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.gray, width: 2),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                   Image.network(ApiConstant.imageURL + customerImage).image,
                ),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(name),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(memberLabel,
                        ),

                   SizedBox(width: 5.w,),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(memberNumber,
                          style:  TextStyle(
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward))
              ],
            )
          ],
        ),
      ),
    );
  }
}
