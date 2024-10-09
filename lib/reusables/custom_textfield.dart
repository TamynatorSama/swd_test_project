import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:swd_project/utils/app_colors.dart';

class CustomTextfield extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final bool isPassword;
  final String? hintText;
  final GlobalKey<FormFieldState>? inputKey;
  final TextStyle? customTextStyle;
  final TextInputType? inputType;
  final EdgeInsets? customSuffixPadding;
  final List<TextInputFormatter>? inputFormatter;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? suffixWidth;
  final bool isReadOnly;
  final bool autofocus;
  final InputDecoration inputDecoration;
  final Function()? onTap;
  final bool showFocus;
  final int? maxLine;
  final int? maxLength;
  final Color? fillColor;
  final Function(bool isFocused)? onFocusFunction;
  const CustomTextfield({
    super.key,
    this.maxLength,
    this.label,
    this.controller,
    this.fillColor,
    this.inputKey,
    this.showFocus = true,
    this.isReadOnly = false,
    this.autofocus = false,
    this.onTap,
    this.suffixWidth,
    this.maxLine,
    this.customTextStyle,
    this.onEditingComplete,
    this.onChanged,
    this.inputFormatter,
    this.textAlign = TextAlign.start,
    this.validator,
    this.suffixIcon,
    this.hintText,
    this.prefixIcon,
    this.customSuffixPadding,
    this.inputType,
    this.onFocusFunction,
    this.isPassword = false,
    this.inputDecoration = const InputDecoration(),
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  GlobalKey<FormFieldState>? _textFieldKey;
  late FocusNode focusNode;
  bool isFocused = false;
  bool hasError = false;

  @override
  void initState() {
    _textFieldKey = widget.inputKey ?? GlobalKey<FormFieldState>();
    focusNode = FocusNode()..addListener(updateShadowColor);

    // if (widget.controller != null) {
    widget.controller?.addListener(updateHasError);
    // }
    super.initState();
  }

  updateShadowColor() {
    isFocused = focusNode.hasFocus;
    setState(() {});
  }

  updateHasError() {
    if (widget.validator != null) {
      hasError = widget.validator!(widget.controller?.text) != null;
    } else {
      hasError = defaultValidator(widget.controller?.text) != null;
    }
    setState(() {});
  }

  bool isObscuredText = true;

  updateObscuredText() => setState(() {
        isObscuredText = !isObscuredText;
      });

  String? defaultValidator(String? value) {
    if ((value ?? "").isEmpty) {
      return "${widget.label} field is required";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    widget.controller?.removeListener(updateHasError);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gap(8)
        ],
        TextFormField(
          maxLength: widget.maxLength,
          autofocus: widget.autofocus,
          onEditingComplete: widget.onEditingComplete,
          key: _textFieldKey,
          focusNode: focusNode,
          obscureText: widget.isPassword ? isObscuredText : false,
          readOnly: widget.isReadOnly,
          textAlign: widget.textAlign,
          controller: widget.controller,
          onTap: widget.onTap,
          maxLines: widget.maxLine ?? 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator ?? defaultValidator,
          inputFormatters: widget.inputFormatter,
          keyboardType: widget.inputType,
          onChanged: widget.onChanged,
          cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
          decoration: widget.inputDecoration.copyWith(
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColor.textColor2),
              border: CustomTextFieldBorders.defaultBorder,
              filled: true,
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Container(
                      padding: const EdgeInsets.all(12),
                      child: widget.prefixIcon),
              suffixIcon: widget.isPassword
                  ? Container(
                      padding: const EdgeInsets.all(14),
                      child: InkWell(
                          onTap: updateObscuredText,
                          child: SvgPicture.asset(isObscuredText
                              ? "assets/icons/eye_closed.svg"
                              : "assets/icons/eye_open.svg")))
                  : widget.suffixIcon == null
                      ? null
                      : Container(
                          padding: const EdgeInsets.all(12),
                          child: widget.suffixIcon),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              fillColor: AppColor.accentColor,
            
              enabledBorder: CustomTextFieldBorders.defaultBorder,
              focusedBorder:
                   CustomTextFieldBorders.focusedBorder
                  ,
              errorBorder: CustomTextFieldBorders.errorBorder),
          style: widget.customTextStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyLarge,
        )
      ],
    );
  }
}

class CustomTextFieldBorders {
  static final OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide:
        BorderSide(width: 1, color: AppColor.borderColor),
  );

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide:
        BorderSide(width: 1, color: AppColor.borderColor),
  );

  static final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    
    borderSide:
        BorderSide(width: 1, color: AppColor.gradientPrimaryColor),
  );
}
