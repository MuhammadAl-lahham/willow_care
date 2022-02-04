import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:willow_care_test/helper/app_colors.dart';
import 'package:willow_care_test/helper/font_styles.dart';
import 'package:willow_care_test/helper/size_config.dart';

class PaymentPage extends StatelessWidget {
  static const route = "/payment_page";

  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: customColor1,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text("Payment", style: verLargeStyleCustomColor5),
        ),
        body: Padding(
          padding: EdgeInsets.all(SizeConfig().h(24)),
          child: SingleChildScrollView(
            child: Column(children: const [
               PaymentWidget1(),
               CardPaymentMethod()
            ]),
          ),
        ),
      bottomNavigationBar: Container(alignment: Alignment.center,
        color: primaryColor1,height: SizeConfig().h(86),
        child: Text(
          'Pay Now',
          style: mediumStyleWhite
        ),
      ),
    );
  }
}

class PaymentWidget1 extends StatelessWidget {
  const PaymentWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('For Payment :', style: medium2StyleCustomColor1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig().w(9)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('20.60 LEU', style: medium2StyleCustomColor1),
                Text('including taxis (3% )', style: smallStyleCustomColor4)
              ],
            ),
          )
        ])
      ],
    );
  }
}

class CardPaymentMethod extends StatelessWidget {
  const CardPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig().h(58),
      margin: EdgeInsets.symmetric(vertical: SizeConfig().h(30)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: customColor2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x29949494),
                    offset: Offset(0, 6),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: SizedBox.expand(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/mask_group_1885.svg',
                      height: SizeConfig().h(16),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig().w(16)),
                      child: Text('Credit Card',
                          style: small2StyleWhite),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x29949494),
                      offset: Offset(0, 6),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: SizedBox.expand(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/mask_group_1887.svg',
                            height: SizeConfig().h(16)),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig().w(16)),
                            child: Text('PayPal',
                                style: mediumStyleCustomColor1)),
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}

