import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/my_colors.dart';
import 'package:flutter_application_1/core/size_utils.dart';
import 'package:flutter_application_1/widgets/input/simple.dart';

class InputPassword extends StatefulWidget {
  final String? label;
  final TextStyle? style;
  final TextEditingController? controller;
  final BorderType? borderType;
  final bool? showPrefixIcon;
  final Widget Function(bool status)? customIcon;
  final bool? isCollapsed;
  final bool? noBorder;
  final bool? disposeController;
  final Function(String)? onChanged;
  final bool? hideValidationText;

  const InputPassword({
    Key? key,
    this.label,
    this.controller,
    this.style,
    this.borderType,
    this.showPrefixIcon,
    this.customIcon,
    this.isCollapsed,
    this.noBorder,
    this.disposeController,
    this.onChanged,
    this.hideValidationText,
  }) : super(key: key);

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool status = true;
  List<Map<String, dynamic>> list = [
    {'color': null, 'check': false},
    {'color': null, 'check': false},
    {'color': null, 'check': false},
    {'color': null, 'check': false},
    {'color': null, 'check': false},
    {'color': null, 'check': false},
  ];
  // FocusNode _focusNode = FocusNode();
  InputBorder inputBorder({Color? color}) {
    if (widget.noBorder == true) {
      return InputBorder.none;
    }
    return widget.borderType == BorderType.bottom
        ? const UnderlineInputBorder()
        : OutlineInputBorder(
            borderRadius: borderRadius10,
            borderSide: BorderSide(
              color: color ?? cgrey,
              width: 0.8,
            ),
          );
  }

  fillList(int i, bool s) {
    if (s) {
      list[i]['color'] = cGreen;
      list[i]['check'] = true;
    } else {
      list[i]['color'] = null;
      list[i]['check'] = false;
    }
  }

  checkValidationHighlights(String v) {
    if (v.length.toInt() < 8) {
      fillList(0, false);
    } else {
      fillList(0, true);
    }
    if (v.length.toInt() > 24) {
      fillList(1, false);
    } else {
      fillList(1, true);
    }
    // if (!v.contains(RegExp(r'[0-9]'))) {
    //   fillList(2, false);
    // } else {
    //   fillList(2, true);
    // }
    if (!v.contains(RegExp(r'[A-Z]'))) {
      fillList(3, false);
    } else {
      fillList(3, true);
    }
    if (!v.contains(RegExp(r'[!@#$%&*]'))) {
      fillList(4, false);
    } else {
      fillList(4, true);
    }
    if (!v.contains(RegExp(r'[a-z]'))) {
      fillList(5, false);
    } else {
      fillList(5, true);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.disposeController == true && widget.controller != null) {
      widget.controller?.dispose();
    }
    super.dispose();
  }

  String? passwordValidator(String? v) {
    checkValidationHighlights(v ?? '');
    if (widget.hideValidationText == true) {
      return null;
    }
    if (v!.length.toInt() == 0) {
      return "Please enter password.";
    }

    if (v.length.toInt() < 8) {
      return "${widget.label} Length must be minimum 8 or greater.";
    } else if (v.length.toInt() > 24) {
      return "${widget.label} Length is greater then 24";
    }
    // else if (!v.contains(RegExp(r'[0-9]'))) {
    //   return "Number is necessary in the password";
    // }
    else if (!v.contains(RegExp(r'[A-Z]'))) {
      return "One Capital Alphabet is necessary in the password";
    } else if (!v.contains(RegExp(r'[!@#$%&*]'))) {
      return "One Special Character is necessary in the password";
    } else if (!v.contains(RegExp(r'[a-z]'))) {
      return "One small Alphabet is necessary in the password";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(bottom: k08),
            child: Text.rich(
              TextSpan(
                text: widget.label!,
                children: [
                  TextSpan(text: "*", style: textSemiBoldw600.fntColor(cred)),
                ],
                style: textSemiBoldw600.fntColor(HexColor("#0E0031")),
              ),
            ),
          ),
        TextFormField(
          controller: widget.controller,
          validator: (s) {
            return passwordValidator(s);
          },
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: cblack,
          obscureText: status,
          onChanged: (s) {
            checkValidationHighlights(s);
            if (widget.onChanged != null) {
              widget.onChanged!(s);
            }
          },
          style: TextStyle(
            color: cgrey900,
            fontWeight: FontWeight.normal,
            height: fh16,
            letterSpacing: ls02,
            fontSize: fs16,
          ),
          decoration: InputDecoration(
            isCollapsed: widget.isCollapsed,
            // isDense: widget.isCollapsed ?? true,
            border: inputBorder(),
            focusedBorder: inputBorder(color: HexColor("#112D5B")),
            enabledBorder: inputBorder(),
            errorBorder: inputBorder(color: cred),
            focusedErrorBorder: inputBorder(color: Colors.pink),
            prefixIcon: widget.showPrefixIcon == true
                ? Icon(Icons.lock_outline, color: cBlueGrey100)
                : null,
            suffixIcon: IconButton(
              padding: widget.isCollapsed == true ? EdgeInsets.zero : null,
              onPressed: () {
                if (status) {
                  status = false;
                } else {
                  status = true;
                }
                setState(() {});
              },
              icon: widget.customIcon != null
                  ? widget.customIcon!(status)
                  : Icon(
                      status
                          ? Icons.remove_red_eye
                          : Icons.visibility_off_sharp,
                      color: cBlueGrey100,
                    ),
            ),
            hintText: "\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022",
            hintStyle: textGrey.fntBold(FontWeight.w600),
          ),
          //focusNode: _focusNode,
          // onFieldSubmitted: (value) {
          //   // print("onFieldSubmitted");
          //   FocusScope.of(context).requestFocus(_focusNode);
          //   FocusScope.of(context).nextFocus();
          // },
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(
                r'[\u{1F600}-\u{1F64F}' // Emoticons
                r'\u{1F300}-\u{1F5FF}' // Symbols & Pictographs
                r'\u{1F680}-\u{1F6FF}' // Transport & Map
                r'\u{1F700}-\u{1F77F}' // Alchemical Symbols
                r'\u{1F780}-\u{1F7FF}' // Geometric Shapes
                r'\u{1F800}-\u{1F8FF}' // Supplemental Arrows
                r'\u{1F900}-\u{1F9FF}' // Supplemental Symbols
                r'\u{1FA00}-\u{1FA6F}' // Chess Symbols
                r'\u{1FA70}-\u{1FAFF}' // Symbols & Pictographs 2
                r'\u{2600}-\u{26FF}' // Misc symbols
                r'\u{2700}-\u{27BF}' // Dingbats
                r']',
                unicode: true,
              ),
            ),
          ],
        ),
        // Text(
        //   "Password should be containing one upper and lower case letters, number, special characters and minimum 6 length of password, such as Purple01@",
        //   style: textBoldw700.fntSize(9).fntColor(cgrey),
        // )
        // widget.hideValidationText == true
        //     ? noWidget
        //     : Column(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           hsBox14,
        //           bulletPoint(
        //             Texts.mustBeAtLeast8Characters(),
        //             check: list[0]['check'],
        //             color: list[0]['color'],
        //           ),
        //           bulletPoint(
        //             Texts.mustIncludeOneUpperCharacters(),
        //             check: list[3]['check'],
        //             color: list[3]['color'],
        //           ),
        //           bulletPoint(
        //             Texts.mustIncludeOneLowerCharacters(),
        //             check: list[5]['check'],
        //             color: list[5]['color'],
        //           ),
        //           // bulletPoint("Must include one number",
        //           //     check: list[2]['check'], color: list[2]['color']),
        //           bulletPoint(
        //             "Must include one special character",
        //             check: list[4]['check'],
        //             color: list[4]['color'],
        //           ),
        //         ],
        //       ),
      ],
    );
  }
}

Row bulletPoint(String text, {Color? color, bool? check}) {
  return Row(
    children: [
      wsBox08,
      Icon(
        check == true ? Icons.check : Icons.circle,
        size: check == true ? k15 : k05,
        color: check == true ? color : null,
      ),
      wsBox08,
      Expanded(
        child: Text(
          text,
          style: textNormal.fntSize(11).fntColor(color ?? cblack),
        ),
      ),
    ],
  );
}
