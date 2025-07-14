import 'package:flutter_application_1/core/common.dart';
import 'package:flutter_application_1/controllers/controllers.dart' as c;
import 'package:flutter_application_1/presentation/screens.dart' as s;
import 'package:flutter_application_1/widgets/doted/doted_border.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final cnt = c.HomeController();
  bool exp = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        // margin: EdgeInsets.only(left: k20),
        padding: EdgeInsets.only(left: k30),
        width: size.width * 0.8,
        height: k55,
        child: Stack(
          children: [
            Image.asset(
              "assets/image/Subtract.png",
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => s.BookMealPageScreen()));
                },
                child: Container(
                  width: 100.fem,
                  height: k50,
                  decoration: BoxDecoration(
                      // color: cred,
                      borderRadius: BorderRadiusDirectional.horizontal(
                          start: Radius.circular(8))),
                  child: Center(
                    child: Image.asset(
                      image.iconHome,
                      width: k20,
                      height: k20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => s.BookMealPageScreen()));
                },
                child: Container(
                  width: 100.fem,
                  height: k50,
                  decoration: BoxDecoration(
                      // color: cred,
                      borderRadius: BorderRadiusDirectional.horizontal(
                          start: Radius.circular(8))),
                  child: Row(
                    children: [
                      Image.asset(
                        image.iconUsers,
                        width: k20,
                        height: k20,
                      ),
                    ],
                  ),
                ),
              )
            ]),
            Positioned(
                left: size.width / 3.7,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => s.BookMealPageScreen()));
                  },
                  child: Container(
                    width: k45,
                    height: k45,
                    decoration:
                        BoxDecoration(color: cPrimery, shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        image.iconQrCode,
                        width: k20,
                        height: k20,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
      body: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150.fem,
                automaticallyImplyLeading: false,
                leading: buttons.back(context),
                title: Row(
                  children: [
                    Image.asset(
                      image.iconStarBatch,
                      width: k50,
                      height: k50,
                    ),
                    Text(
                      "Events status",
                      style: textBoldw700.fntColor(cwhite),
                    )
                  ],
                ),
                actions: [buttons.notification(context)],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                          clipBehavior: Clip.hardEdge,
                          width: size.width,
                          margin: EdgeInsets.only(bottom: k30),
                          decoration: BoxDecoration(
                            color: cPrimery,
                            borderRadius: borderRadius25,
                          ),
                          child: Placeholder()),
                      Positioned(
                        left: k20,
                        bottom: k08,
                        child: Container(
                          width: size.width * 0.89,
                          decoration: BoxDecoration(
                              color: cwhite,
                              borderRadius: borderRadius50,
                              boxShadow: [
                                BoxShadow(
                                    color: cgrey300,
                                    offset: Offset(0, 2),
                                    spreadRadius: 1,
                                    blurRadius: 2)
                              ]),
                          child: AnimatedBuilder(
                            animation: cnt.selectButton,
                            builder: (context, child) => Row(
                              children: cnt.buttons
                                  .map(
                                    (v) => Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          cnt.selectButton.value = v;
                                          setState(() {});
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: cnt.selectButton.value == v
                                                ? cPrimery
                                                : null,
                                            borderRadius: borderRadius50,
                                          ),
                                          margin: margin5all,
                                          padding: margin8all,
                                          child: Text(
                                            v,
                                            style: textMediumw500.fntColor(
                                              cnt.selectButton.value == v
                                                  ? cwhite
                                                  : cPrimery,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: k15, vertical: k15),
              child: Column(children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: cPrimery.withAlpha(80),
                      borderRadius: borderRadius20),
                  child: Row(children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(borderRadius: borderRadius20),
                      width: 120.fem,
                      height: 120.fem,
                      child: Image.asset(
                        image.imgeHome,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: k10, right: k05),
                      child: Column(spacing: 0, children: [
                        Text(
                          "New Year Party",
                          style: textBoldw700.fntSize(18).fntColor(cPrimery),
                        ),
                        text.iconTextC("31st Dec, 2023", image.iconCalender),
                        text.iconTextC("08:00 PM Onwards", image.iconTime),
                        text.iconTextC(
                            "YOCO Hostel Common Area", image.iconPin),
                      ]),
                    ))
                  ]),
                ),
                hsBox20,
                StatefulBuilder(builder: (context, st) {
                  return ExpansionTile(
                    onExpansionChanged: (s) {
                      print(s);
                      exp = s;
                      st.call(() {});
                    },
                    initiallyExpanded: true,
                    title: Column(
                      children: [
                        Row(children: [
                          Column(
                            children: [
                              Text(
                                "Booking No.",
                                style: textMediumw500
                                    .fntSize(12)
                                    .fntColor(cPrimery),
                              ),
                              Text(
                                "200",
                                style:
                                    textBoldw700.fntSize(16).fntColor(cPrimery),
                              ),
                            ],
                          ),
                          wsBox15,
                          DottedLine(
                            color: cwhite,
                            length: 50.fem,
                            direction: DottedLineDirection.vertical,
                          ),
                          wsBox15,
                          Text(
                            "Payment Details",
                            style: textBoldw700.fntSize(18).fntColor(cPrimery),
                          ),
                          Spacer(),
                          Icon(
                            exp == true
                                ? Icons.keyboard_arrow_up_sharp
                                : Icons.keyboard_arrow_down_sharp,
                            size: k30,
                            color: cPrimery,
                          )
                        ]),
                        DottedLine(
                          color: cwhite,
                          length: size.width,
                        ),
                      ],
                    ),
                    childrenPadding: EdgeInsets.all(k10),
                    backgroundColor: cPrimery.withAlpha(80),
                    collapsedBackgroundColor: cPrimery.withAlpha(80),
                    iconColor: cPrimery,
                    showTrailingIcon: false,
                    collapsedShape:
                        RoundedRectangleBorder(borderRadius: borderRadius20),
                    shape: RoundedRectangleBorder(borderRadius: borderRadius20),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: k10),
                        child: Row(children: [
                          Column(
                            children: [
                              Text(
                                "Paid to",
                                style: textMediumw500
                                    .fntSize(10)
                                    .fntColor(cPrimery),
                              ),
                              hsBox03,
                              Container(
                                width: k30,
                                height: k30,
                                decoration: BoxDecoration(
                                    color: cPrimery, shape: BoxShape.circle),
                                child: Center(
                                  child: Image.asset(image.iconUser,
                                      width: k20, height: k20),
                                ),
                              ),
                            ],
                          ),
                          wsBox15,
                          Text(
                            "Yocostays Boys Hostel",
                            style: textBoldw700.fntColor(cPrimery),
                          ),
                          Spacer(),
                          Text(
                            "₹320",
                            style: textNormal.fntColor(cPrimery),
                          ),
                        ]),
                      ),
                      hsBox08,
                      Divider(
                        color: cPrimery,
                        thickness: 0.5,
                      ),
                      hsBox08,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: k10),
                        child: Column(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "transaction id",
                                style: textMediumw500
                                    .fntSize(12)
                                    .fntColor(cPrimery),
                              ),
                              hsBox03,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "T24060XXXXXXXXXXXX8768",
                                    style: textMediumw500
                                        .fntSize(14)
                                        .fntColor(cPrimery),
                                  ),
                                  Image.asset(image.iconTransaction,
                                      width: k18, height: k18)
                                ],
                              ),
                            ],
                          ),
                          hsBox15,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "debited from",
                                style: textMediumw500
                                    .fntSize(12)
                                    .fntColor(cPrimery),
                              ),
                              hsBox05,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: k30,
                                    height: k30,
                                    margin: EdgeInsets.only(left: k08),
                                    decoration: BoxDecoration(
                                        color: cwhite, shape: BoxShape.circle),
                                    child: Center(
                                      child: Image.asset(image.iconSbi,
                                          width: k20, height: k20),
                                    ),
                                  ),
                                  wsBox15,
                                  Expanded(
                                      child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "XXXXXX8768",
                                          style: textMediumw500
                                              .fntSize(14)
                                              .fntColor(cPrimery),
                                        ),
                                        Text(
                                          "₹320",
                                          style: textNormal.fntColor(cPrimery),
                                        ),
                                      ],
                                    ),
                                    hsBox05,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "UTR:415385742872",
                                          style: textMediumw500
                                              .fntSize(14)
                                              .fntColor(cPrimery),
                                        ),
                                        Image.asset(image.iconTransaction,
                                            width: k18, height: k18)
                                      ],
                                    ),
                                  ]))
                                ],
                              ),
                            ],
                          ),
                          hsBox08,
                          Divider(
                            color: cPrimery,
                            thickness: 0.5,
                          ),
                          hsBox08,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Image.asset(image.iconDownload,
                                      width: k18, height: k18),
                                  hsBox05,
                                  Text(
                                    "Download Receipt",
                                    style: textBoldw700
                                        .fntColor(cPrimery)
                                        .fntSize(12),
                                  )
                                ]),
                                Column(children: [
                                  Image.asset(image.iconShare,
                                      width: k18, height: k18),
                                  hsBox05,
                                  Text(
                                    "Share Receipt",
                                    style: textBoldw700
                                        .fntColor(cPrimery)
                                        .fntSize(12),
                                  )
                                ]),
                                Column(children: [
                                  Image.asset(image.iconHelp,
                                      width: k18, height: k18),
                                  hsBox05,
                                  Text(
                                    "Payment Support",
                                    style: textBoldw700
                                        .fntColor(cPrimery)
                                        .fntSize(12),
                                  )
                                ])
                              ]),
                          hsBox08,
                          Divider(
                            color: cPrimery,
                            thickness: 0.5,
                          ),
                          hsBox08,
                          Container(
                            width: 200.fem,
                            height: 200.fem,
                            decoration: BoxDecoration(
                                color: cwhite, borderRadius: borderRadius20),
                            child: Center(
                                child: Image.asset(
                              image.iconQrCode,
                              width: 180.fem,
                              height: 180.fem,
                            )),
                          ),
                          hsBox08,
                        ]),
                      ),
                    ],
                  );
                }),
              ]))),
    );
  }
}
