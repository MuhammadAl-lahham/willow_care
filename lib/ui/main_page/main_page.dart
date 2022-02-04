import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:willow_care_test/helper/app_colors.dart';
import 'package:willow_care_test/helper/const_styles.dart';
import 'package:willow_care_test/helper/font_styles.dart';
import 'package:willow_care_test/helper/size_config.dart';

import 'schedule_inside_widget.dart';

class MainPage extends StatefulWidget {
  static const route = "/";

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<String> titles = ["Home", "Schedule", "Messages", "More"];

  List<String> svg = ["Home", "Calendar", "iconly_light_chat", "More"];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(buildAppBarTitle(), style: verLargeStyleCustomColor5),
        actions: const [SettingsWidget()],
      ),
      body: Column(children: [buildInsideWidget()]),
      bottomNavigationBar: Container(
        height: SizeConfig().h(74),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: radiusTop16,
          boxShadow: [
            BoxShadow(
              color: Color(0x298d8d8d),
              offset: Offset(0, 12),
              blurRadius: 24,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig().h(13), horizontal: SizeConfig().w(35)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                titles.length,
                (index) => InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: BottomTabWidget(
                        title: titles[index],
                        svg: svg[index],
                        isSelected: index == currentIndex,
                      ),
                    )),
          ),
        ),
      ),
    );
  }

  String buildAppBarTitle() {
    switch (currentIndex) {
      case 0:
        return "Home";
      case 1:
        return "Schedule";
      case 2:
        return "Messages";
      case 3:
        return "More";
      default:
        return "Home";
    }
  }

  Widget buildInsideWidget() {
    switch (currentIndex) {
      case 0:
        return Container();
      case 1:
        return ScheduleInsideIWidget();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return Container();
    }
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        //TODO [move to Settings page]
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig().w(26)),
        child: SvgPicture.asset('assets/svg/iconly_light_setting.svg',
            width: SizeConfig().w(24), fit: BoxFit.contain),
      ),
    );
  }
}

class BottomTabWidget extends StatelessWidget {
  final String svg, title;
  final bool isSelected;

  const BottomTabWidget(
      {Key? key,
      required this.svg,
      required this.title,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          'assets/svg/$svg.svg',
          width: SizeConfig().w(20.0),
          fit: BoxFit.contain,
          color: isSelected ? primaryColor1 : customColor4,
        ),
        Padding(
            padding: EdgeInsets.only(top: SizeConfig().h(4)),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: SizeConfig().h(10),
                  color: isSelected ? primaryColor1 : customColor4),
            )),
      ],
    );
  }
}
