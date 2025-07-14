import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/common.dart';
import 'package:flutter_application_1/widgets/calander/range_calender.dart';

class BookMealPageScreen extends StatelessWidget {
  const BookMealPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book Meal",
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
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Column(children: [])),
          Padding(
            padding: EdgeInsets.only(top: 100.fem),
            child: SingleChildScrollView(
              padding: margin20all,
              child: Column(children: [
                Container(
                  width: size.width,
                  height: 360.fem,
                  padding: margin8all,
                  decoration: BoxDecoration(
                      color: cwhite,
                      borderRadius: borderRadius20,
                      boxShadow: [boxShadow]),
                  child: Column(children: [
                    hsBox08,
                    MyRangeCalender(
                      rangeSelectionMode: true,
                    ),
                  ]),
                ),
                hsBox20,
                Container(
                  width: size.width,
                  padding: margin10all,
                  decoration: BoxDecoration(
                      color: cwhite,
                      borderRadius: borderRadius30,
                      boxShadow: [boxShadow]),
                  child: Column(children: [
                    hsBox10,
                    Row(
                      children: [
                        Text("Date", style: textBlack.fntColor(cgrey700)),
                        wsBox08,
                        Image.asset(
                          image.iconCalender,
                          width: k20,
                          height: k20,
                        )
                      ],
                    ),
                    hsBox15,
                    SizedBox(
                      width: size.width,
                      child: myContainer("10th Feb, 2024 to 18th Feb, 2024",
                          select: true),
                    ),
                    hsBox15,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          myContainer("Breakfast", select: true),
                          myContainer(
                            "Lunch",
                          ),
                          myContainer(
                            "Dinner",
                          ),
                        ]),
                    hsBox15,
                    SizedBox(
                      width: size.width,
                      child: myContainer(
                        "Full Day",
                      ),
                    ),
                    hsBox05,
                  ]),
                ),
              ]),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: cwhite,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(k20)),
            boxShadow: [boxShadow]),
        padding: margin20all,
        child: buttons.elevate("Book Now"),
      ),
    );
  }

  Widget myContainer(String text, {bool? select}) {
    return Container(
      padding: margin208,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: borderRadius50,
          color: select == true
              ? HexColor("#F5BE30").withAlpha(100)
              : cPrimery.withAlpha(60)),
      child: Text(text, style: textMediumw500),
    );
  }
}
