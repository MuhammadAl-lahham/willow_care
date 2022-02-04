import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:willow_care_test/helper/app_colors.dart';
import 'package:willow_care_test/helper/const_styles.dart';
import 'package:willow_care_test/helper/font_styles.dart';
import 'package:willow_care_test/helper/size_config.dart';
import 'package:willow_care_test/ui/payment/payment_page.dart';

class ScheduleInsideIWidget extends StatelessWidget {
  ScheduleInsideIWidget({Key? key}) : super(key: key);
  final ValueNotifier<bool> isUpcoming = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.all(SizeConfig().h(24)),
        child: Stack(
          children: [
            Container(
              height: SizeConfig().h(50),
              padding: EdgeInsets.symmetric(horizontal: SizeConfig().w(40)),
              decoration: const BoxDecoration(
                  color: customColor7, borderRadius: radiusTop4),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          isUpcoming.value = true;
                        },
                        child:
                            Text('Upcoming', style: mediumStyleCustomColor3)),
                    GestureDetector(
                        onTap: () {
                          isUpcoming.value = false;
                        },
                        child:
                            Text('Accepted', style: mediumStyleCustomColor3)),
                  ]),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: isUpcoming,
                builder: (_, __, ___) {
                  return AnimatedAlign(
                      alignment: isUpcoming.value
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: 500),
                      child: Container(
                          height: SizeConfig().h(42),
                          width: SizeConfig().w(157),
                          margin: EdgeInsets.all(SizeConfig().h(4)),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: radiusTop7,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xcedce0ef),
                                  offset: Offset(0, 2),
                                  blurRadius: 10),
                            ],
                          ),
                          child: Center(
                            child: Text(
                                isUpcoming.value ? "Upcoming" : "Accepted",
                                style: medium1StyleCustomColor2,
                                textAlign: TextAlign.center),
                          )));
                })
          ],
        ),
      ),
      buildWidget()
    ]);
  }

  Widget buildWidget(){
    return ValueListenableBuilder(valueListenable: isUpcoming, builder: (_,value,__){
      return isUpcoming.value
          ? SizedBox(
        height: SizeConfig().h(530),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/png/015.png',
                    height: SizeConfig().h(116),
                  ),
                  Text('No Available Bookings',
                      style: large3StyleCustomColor1)
                ])),
      )
          : Column(
        children: [
          Container(
              height: SizeConfig().h(30),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding:
              EdgeInsets.symmetric(horizontal: SizeConfig().w(24)),
              child: Text('This Week', style: verSmallStyleCustomColor1)),
          Container(
            height: SizeConfig().h(505),
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig().h(16),
                horizontal: SizeConfig().h(24)),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (_, index) => const CustomWidget(),
                separatorBuilder: (_, __) =>
                    SizedBox(height: SizeConfig().h(16)),
                itemCount: 6),
          ),
        ],
      );
    });
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: SizeConfig().h(16)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: const [
            BoxShadow(
                color: Color(0x19b5b5b5), offset: Offset(0, 3), blurRadius: 20),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig().w(24)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Eva Reid ', style: large1StyleCustomColor1),
                        SizedBox(
                          height: SizeConfig().h(4),
                        ),
                        Text('Online Consultation',
                            style: medium4StyleCustomColor1)
                      ]),
                  CircleAvatar(radius: SizeConfig().h(24))
                ]),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig().h(24)),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/noun_date_1757903.svg',
                        width: SizeConfig().w(13)),
                    Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig().w(26), left: SizeConfig().w(10)),
                      child: Text('November 17, 12:30 PM',
                          style: verSmall3StyleCustomColor1),
                    ),
                    CircleAvatar(
                        radius: SizeConfig().h(3.5),
                        backgroundColor: Colors.green),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: SizeConfig().w(10)),
                      child:
                          Text('confirmed', style: verSmall3StyleCustomColor1),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig().h(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PaymentPage.route);
                        },
                        child: Container(
                          height: SizeConfig().h(40),
                          width: SizeConfig().h(156),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: primaryColor1, borderRadius: radiusTop4),
                          child:
                              Text('Start examination', style: smallStyleWhite),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Container(
                          height: SizeConfig().h(40),
                          width: SizeConfig().w(98),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: customColor2,
                            borderRadius: BorderRadius.circular(4.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x04000000),
                                offset: Offset(0, 3),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Text('Reshedule', style: smallStyleWhite),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}


