import 'package:boozinfitnessapp/shared/extensions/theams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/color_constants.dart';
import '../constants/fonts/fonst_constants.dart';
import '../constants/string_constants.dart';

class CustomCard extends StatelessWidget {
   CustomCard(
      {required this.title,
      required this.goal,
      required this.iconPath,
      required this.heading,
      required this.value,
      Key? key})
      : super(key: key);
  final String iconPath;
  final String title;
  final String goal;
  final String heading;
  final double value;
  final TextStyle _titleStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    fontFamily: AppFont.nunito,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 122.h,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 16, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$heading: ',
                            style:  TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFont.montserrat,
                            ),
                          ),
                          TextSpan(
                            text: title,
                            style:  TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFont.nunito,
                            ),
                          ),
                        ],
                      ),
                    ),
                     SizedBox(height: 16.h),
                    Flexible(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          /// change the value of the progress bar
                          value: value / 100,
                          valueColor: AlwaysStoppedAnimation(
                            context.themeValue(
                                light: AppColor.black, dark: AppColor.white),
                          ),
                          backgroundColor: AppColor.white,
                          minHeight: 16,
                        ),
                      ),
                    ),
                     SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: _titleStyle,
                        ),
                        Text(
                          '${StringConstants.goal}: $goal',
                          style: _titleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
               SizedBox(width: 21.w),
              SizedBox(
                height: 52.h,
                width: 52.w,
                child: Image.asset(iconPath),
              )
            ],
          ),
        ),
      ),
    );
  }
}
