import 'package:flutter_application_1/core/common.dart';

class MyButtons {
  Widget elevate(String text,
      {VoidCallback? onTap, double? height, double? radius, TextStyle? style}) {
    return SizedBox(
      width: double.maxFinite,
      height: height ?? k55,
      child: ElevatedButton(
          onPressed: () {
            if (onTap != null) {
              onTap();
            }
          },
          child: Text(
            text,
            style: style ?? textMediumw500,
          )),
    );
  }

  Widget back(BuildContext context) => InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: margin8all,
          child: Container(
              width: k32,
              height: k32,
              decoration: BoxDecoration(
                borderRadius: borderRadius05,
                color: cwhite.withAlpha(50),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: cwhite,
              )),
        ),
      );
  Widget notification(BuildContext context) => InkWell(
        onTap: () {
          // Navigator.pop(context);
        },
        child: Padding(
          padding: margin8all,
          child: Container(
              width: k40,
              height: k40,
              decoration: BoxDecoration(
                borderRadius: borderRadius05,
                color: cwhite.withAlpha(50),
              ),
              child: Center(
                child: Image.asset(
                  image.iconBell,
                  width: k25,
                  height: k25,
                ),
              )),
        ),
      );
}
