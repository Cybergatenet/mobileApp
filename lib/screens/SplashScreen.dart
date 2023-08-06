import 'package:flutter/material.dart';
import 'package:taxibooking/utils/Extensions/StringExtensions.dart';
import '../main.dart';
import '../../screens/WalkThroughtScreen.dart';
import '../../utils/Colors.dart';
import '../../utils/Constants.dart';
import '../../utils/Extensions/app_common.dart';
import '../network/RestApis.dart';
import '../utils/images.dart';
import 'EditProfileScreen.dart';
import 'LoginScreen.dart';
import 'RiderDashBoardScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 2));
    if (sharedPref.getBool(IS_FIRST_TIME) ?? true) {
      launchScreen(context, WalkThroughScreen(),
          pageRouteAnimation: PageRouteAnimation.Slide);
    } else {
      if (!appStore.isLoggedIn) {
        launchScreen(context, LoginScreen(),
            pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
      } else {
        if (sharedPref.getString(CONTACT_NUMBER).validate().isEmptyOrNull) {
          launchScreen(context, EditProfileScreen(isGoogle: true),
              isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
        } else if (sharedPref.getString(UID).validate().isEmptyOrNull) {
          updateProfileUid().then((value) {
            launchScreen(context, RiderDashBoardScreen(),
                pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
          });
        } else {
          launchScreen(context, RiderDashBoardScreen(),
              pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
        }
      }
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ic_logo_white,
                fit: BoxFit.contain, height: 150, width: 150),
            SizedBox(height: 16),
            Text(language.appName,
                style: boldTextStyle(color: Colors.white, size: 22)),
          ],
        ),
      ),
    );
  }
}
