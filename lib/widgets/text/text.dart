import 'package:flutter_application_1/core/common.dart';

class MyTextWidget {
  Widget iconTextC(
    String text,
    String img, {
    TextStyle? style,
    double? imgSize,
  }) {
    return Row(
      spacing: k08,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: k02),
          child: Image.asset(
            img,
            width: k20,
            height: k20,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: style ?? textMediumw500.fntColor(cPrimery),
          ),
        )
      ],
    );
  }
}
