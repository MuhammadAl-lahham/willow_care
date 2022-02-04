import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:willow_care_test/helper/app_colors.dart';
import 'package:willow_care_test/helper/const_styles.dart';
import 'package:willow_care_test/helper/font_styles.dart';
import 'package:willow_care_test/helper/size_config.dart';

import 'custom_clip_path.dart';

class WelcomePage extends StatelessWidget {
  static const route = "/welcome_page";

  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));

    int slideIndex = 0;

    return Scaffold(
        body: Column(children: [
      ClipPath(
        clipper: const CustomWelcomeClipper(),
        child: Container(
          color: primaryColor1,
          height: SizeConfig().h(410),
          margin: EdgeInsets.only(bottom: SizeConfig().h(51)),
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            fit: StackFit.expand,
            children: [
              Container(
                height: SizeConfig().h(261),
                width: SizeConfig().w(267),
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/png/mask_group_3.png'))),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig().w(24)),
        child: Column(
          children: [
            Text('Communicate with patients\n anytime & anywhere!',
                textAlign: TextAlign.center, style: largeStyleCustomColor5),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig().h(23)),
              child: Text(
                'Get in touch with your patients immediately,\n regardless of time and place',
                style: medium2StylePrimaryColor2,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig().h(68), bottom: SizeConfig().h(54)),

              //TODO enable slide effects for some widgets
              child: Wrap(
                  direction: Axis.horizontal,
                  spacing: SizeConfig().w(4),
                  children: List.generate(
                      4,
                      (index) => AnimatedContainer(
                            decoration: BoxDecoration(
                              color: slideIndex == index
                                  ? primaryColor1
                                  : customColor6,
                              borderRadius: radiusTop15,
                            ),
                            duration: const Duration(seconds: 1),
                            height: SizeConfig().h(6),
                            width: slideIndex == index
                                ? SizeConfig().h(24)
                                : SizeConfig().h(6),
                          ))),
            ),
            InkWell(
              onTap: () {
                // move to route page (MainPage)
                Navigator.pop(context);
              },
              child: Container(
                height: SizeConfig().h(60),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: primaryColor1,
                  borderRadius: radiusTop8,
                ),
                child: Text('Start Now', style: mediumStyleWhite),
              ),
            )
          ],
        ),
      )
    ]));
  }
}
