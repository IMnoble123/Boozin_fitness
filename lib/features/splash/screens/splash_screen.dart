import 'package:boozinfitnessapp/features/home/screens/home_screen.dart';
import 'package:boozinfitnessapp/shared/constants/string_constants.dart';
import 'package:boozinfitnessapp/shared/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../shared/animations/animations.dart';
import '../../../shared/constants/fonts/fonst_constants.dart';
import '../../../shared/extensions/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  bool align = false;

  @override
  void initState() {
    super.initState();
    initSetup().then((_) async {
      initAnimation();
    });
  }

  Future<void> initAnimation() async {
    setState(() => align = !align);
    await Future.delayed(const Duration(milliseconds: 100));
    setupComplete();
  }

  Future<void> initSetup() {
    return Future.delayed(const Duration(seconds: 2));
  }

  Future<void> setupComplete() async {
    setState(() => _visible = true);
    await Future.delayed(const Duration(seconds: 1));
    Get.toNamed(HomeScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(),
    );
  }




  

  Widget _createBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.tight(Size(210.w, 85.h)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  alignment:
                      align ? const Alignment(0.615, 0) : Alignment.center,
                  child: const CustomImage(
                    imagePath: ImagePathCommon.splashI,
                  ),
                ),
                if (align)
                  AnimateWithBlink(
                    visible: _visible,
                    child:
                        CustomImage(imagePath: ImagePath(context).splashBoozin),
                  ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          AnimateWithBlink(
            visible: _visible,
            child: Text(
              StringConstants.fitness,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: AppFont.nunito,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
