import 'package:boozinfitnessapp/features/home/controller/home_controller.dart';
import 'package:boozinfitnessapp/shared/constants/string_constants.dart';
import 'package:boozinfitnessapp/shared/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared/constants/fonts/fonst_constants.dart';
import '../../../shared/extensions/image_path.dart';
import '../../../shared/widgets/shimmer_widget.dart';
import 'package:boozinfitnessapp/shared/widgets/error_widget.dart' as error;


class HomeScreen extends GetView<HelthController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),
        child: Obx(() {
          final healthPoint = controller.healthPoint;
          num steps;
          num calories;
          if (controller.error.isNotEmpty) {
            return error.Error(controller: controller);
          }
          if (healthPoint.isNotEmpty) {
            steps = healthPoint.first.value as num;
            calories = healthPoint.last.value as num;
          } else {
            steps = 0;
            calories = 0;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                StringConstants.hi,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontFamily: AppFont.nunito,
                  fontWeight: FontWeight.w700,
                ),
              ),
               SizedBox(height: 40.h),
              LoadingShimmer(
                loading: controller.isLoading.value,
                child: CustomCard(
                  iconPath: ImagePath(context).iconFootSteps,
                  heading: StringConstants.steps,
                  value: steps.toDouble(),
                  title: '$steps',
                  goal: '15,000',
                ),
              ),
              SizedBox(height: 14.h),
              LoadingShimmer(
                loading: controller.isLoading.value,
                child: CustomCard(
                  iconPath: ImagePath(context).iconKcal,
                  heading: StringConstants.caloriesBurned,
                  value: calories.toDouble(),
                  title: '$calories',
                  goal: '15,000',
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
