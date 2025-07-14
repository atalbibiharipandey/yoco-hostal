import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/my_colors.dart';
import 'package:flutter_application_1/core/size_utils.dart';

enum InputValidator { gst, pan, email, webUrl }

enum BorderType { bottom, outer }

/// if you want to show SnackBar and also Scroll to Targeted Input Box
/// Please Use:-  SmartFormRegistry.showSnackBarFlag = true;
class InputSimple extends StatefulWidget {
  final String? lable;
  final bool? hideLabel;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? prefix;
  final TextEditingController? controller;
  final bool? disposeController;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Widget Function(TextEditingController tec)? suffixIconBuilder;
  final bool? readOnly;
  final bool? ignorePointer;
  final bool? border;
  final bool? notValidate;
  final VoidCallback? onTap;
  final double? height;
  final int? maxLines;
  final TextInputType? keyboardType;
  final int? maxLength;
  final InputValidator? validator;
  final bool? isTextArea;
  final bool? noSpaceLabel;
  final bool? isCollapsed;
  final AutovalidateMode? autovalidateMode;
  final BorderType? borderType;
  final TextStyle? style;
  final void Function(String)? onChanged;

  final Color? colorBorder;
  const InputSimple({
    Key? key,
    this.lable,
    required this.hintText,
    this.labelStyle,
    this.noSpaceLabel,
    this.prefixIcon,
    this.controller,
    this.disposeController,
    this.notValidate,
    this.hintStyle,
    this.suffixIcon,
    this.readOnly,
    this.onTap,
    this.border,
    this.height,
    this.isCollapsed,
    this.maxLines,
    this.keyboardType,
    this.isTextArea,
    this.maxLength,
    this.validator,
    this.autovalidateMode,
    this.borderType,
    this.prefix,
    this.onChanged,
    this.style,
    this.suffixIconBuilder,
    this.ignorePointer,
    this.colorBorder,
    this.hideLabel,
  }) : super(key: key);

  @override
  State<InputSimple> createState() => _InputSimpleState();
}

class _InputSimpleState extends State<InputSimple> {
  Color focusColor = HexColor("#0E0031");
  Color unFocusColor = cgrey;

  ValueNotifier<String?> message = ValueNotifier(null);
  double? rightPaddingOfSuggestionBuilder;
  ValueNotifier<bool> showMultiSelectManualBtn = ValueNotifier(false);
  bool showSimmer = false;

  InputBorder inputBorder({Color? color}) {
    return widget.border ?? false
        ? widget.borderType == BorderType.bottom
            ? const UnderlineInputBorder()
            : OutlineInputBorder(
                borderRadius: borderRadius10,
                borderSide: BorderSide(color: color ?? cgrey, width: 0.8),
              )
        : InputBorder.none;
  }

  String? tmpSelectDropdownData;
  bool? focus;

  @override
  void initState() {
    super.initState();
    if (widget.colorBorder != null) {
      focusColor = widget.colorBorder!;
    }
  }

  @override
  void dispose() {
    if (widget.disposeController == true && widget.controller != null) {
      widget.controller?.dispose();
    }
    message.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant InputSimple oldWidget) {
    super.didUpdateWidget(oldWidget);
    // showSimmer = true;
    // Future.delayed(const Duration(milliseconds: 300), () {
    //   showSimmer = false;
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.ignorePointer ?? false,
      child: SizedBox(
        height: widget.height,
        width: maxExpandScreen > size.width ? size.width : size.width / 2.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.lable == null || widget.hideLabel == true
                ? const SizedBox.shrink()
                : Text.rich(
                    TextSpan(
                      text: widget.lable,
                      style: widget.labelStyle ??
                          textSemiBoldw600.fntColor(focusColor),
                      children: [
                        TextSpan(
                          text: widget.notValidate == true ? "" : "*",
                          style: widget.hintStyle?.fntColor(Colors.red) ??
                              textSemiBoldw600.fntColor(Colors.red),
                        ),
                      ],
                    ),
                  ),
            widget.lable == null ||
                    widget.noSpaceLabel == true ||
                    widget.hideLabel == true
                ? const SizedBox.shrink()
                : SizedBox(height: k08),
            textField(),
          ],
        ),
      ),
    );
  }

  Widget textField({
    TextEditingController? textEditingController,
    FocusNode? focusNode,
    void Function()? onFieldSubmitted,
    VoidCallback? onTapOutside,
    Widget? suffix,
  }) {
    return textField1(
      focusNode: focusNode,
      textEditingController:
          textEditingController ?? widget.controller ?? TextEditingController(),
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: onTapOutside,
      suffix: suffix,
    );
  }

  TextFormField textField1({
    TextEditingController? textEditingController,
    FocusNode? focusNode,
    void Function()? onFieldSubmitted,
    VoidCallback? onTapOutside,
    Widget? suffix,
  }) {
    return TextFormField(
      onTap: widget.onTap,
      focusNode: focusNode,
      onTapOutside: (event) {
        if (onTapOutside != null) {
          onTapOutside();
        }
      },
      // scrollPadding: EdgeInsets.zero,

      readOnly: widget.readOnly ?? false,
      controller: textEditingController ?? widget.controller,
      maxLines: widget.maxLines,
      minLines: widget.isTextArea == true ? 2 : 1,
      keyboardType: widget.keyboardType,
      style: widget.style ?? textNormal.fntColor(focusColor),
      validator: (s) {
        return textFieldValidating(s);
      },
      autovalidateMode: widget.autovalidateMode,
      cursorColor: cblack,
      textAlignVertical: TextAlignVertical.center,
      maxLength: widget.maxLength,

      // focusNode: _focusNode,
      onChanged: (s) {
        if (widget.onChanged != null) {
          widget.onChanged!(s);
        }
        tmpSelectDropdownData = s;
      },
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted();
        }
      },

      //textAlign: TextAlign.center,
      decoration: InputDecoration(
        //isDense: true,
        isCollapsed: widget.isCollapsed,
        //contentPadding: EdgeInsets.symmetric(horizontal: k16),
        border: inputBorder(),
        // isDense: true,
        focusedBorder: inputBorder(color: focusColor),
        enabledBorder: inputBorder(),
        errorBorder: inputBorder(color: Colors.red),
        prefixIcon: widget.prefix ??
            (widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: cBlueGrey100)
                : null),
        suffixIcon: suffix ??
            (widget.suffixIconBuilder != null && widget.controller != null
                ? widget.suffixIconBuilder!(widget.controller!)
                : widget.suffixIcon),
        hintText: widget.hintText,
        hintStyle: (widget.hintStyle ?? textNormal.fntColor(cgrey)),
      ),
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
    );
  }

  String? textFieldValidating(String? v) {
    if (widget.notValidate == true) {
      return null;
    } else {
      if (widget.validator != null) {
        return validatorText(widget.validator!, v);
      } else {
        if (v!.isEmpty) {
          return "Please enter ${widget.lable ?? 'Input Box'}.";
        }
        return null;
      }
    }
  }

  String? validatorText(InputValidator val, String? value) {
    switch (val) {
      case InputValidator.gst:
        if (value == null || value.isEmpty) {
          return 'Please enter GST number';
        }
        if (value.toUpperCase() != widget.controller?.text) {
          return "Please Enter Value in UpperCase Like ABCDEFG.";
        }
        final RegExp gstRegExp = RegExp(
          r'^\d{2}[A-Z]{5}\d{4}[A-Z]{1}\d[Z]{1}[A-Z\d]{1}$',
        );
        // GSTIN of Google India : 37AACCG0527D1Z3
        if (!gstRegExp.hasMatch(widget.controller?.text ?? value)) {
          return 'Invalid GST number.';
        }
        return null;
      case InputValidator.pan:
        if (value == null || value.isEmpty) {
          return 'Please enter PAN number';
        }
        if (value.toUpperCase() != widget.controller?.text) {
          return "Please Enter Value in UpperCase Like ABCDEFG.";
        }
        final RegExp panRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
        // example: AAAAA3333X
        if (!panRegExp.hasMatch(widget.controller?.text ?? value)) {
          return 'Invalid PAN number';
        }
        return null;
      case InputValidator.email:
        if (value == null || value.isEmpty) {
          return 'Please enter email address';
        }
        final RegExp emailRegExp = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$',
        );
        if (!emailRegExp.hasMatch(value)) {
          return 'Invalid email address';
        }
        return null;
      case InputValidator.webUrl:
        if (value == null || value.isEmpty) {
          return 'Please enter URL';
        }
        final RegExp urlRegExp = RegExp(r'^[^\s/$.?#].[^\s]*$');
        if (!urlRegExp.hasMatch(value)) {
          return 'Invalid URL';
        }
        return null;
      default:
        return null;
    }
  }
}
