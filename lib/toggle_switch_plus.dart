import 'package:flutter/material.dart';

class ToggleSwitchPlus extends StatefulWidget {
  const ToggleSwitchPlus({
    Key? key,
    required this.values,
    this.labels,
    this.initialValue,
    required this.onChanged,
    this.isAllCornerRounded = false,
    this.buttonGap = 0,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.selectedBorderColor,
    this.unselectedBackgroundColor,
    this.unselectedForegroundColor,
    this.unselectedBorderColor,
    this.cornerRadius,
    this.buttonPadding,
    this.fontSize, this.fontWeight,
  })  : assert(labels == null || values.length == labels.length),
        super(key: key);
  final List<String> values;
  final List<String>? labels;
  final String? initialValue;
  final Function(String value) onChanged;
  final bool isAllCornerRounded;
  final double buttonGap;
  final EdgeInsets? buttonPadding;
  final double? cornerRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? selectedBackgroundColor;
  final Color? selectedForegroundColor;
  final Color? selectedBorderColor;
  final Color? unselectedBackgroundColor;
  final Color? unselectedForegroundColor;
  final Color? unselectedBorderColor;

  @override
  _ToggleSwitchPlusState createState() => _ToggleSwitchPlusState();
}

class _ToggleSwitchPlusState extends State<ToggleSwitchPlus> {
  String? selectedValue;

  @override
  void initState() {
    selectedValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.values.length, (index) {
        bool isSelected = (selectedValue == widget.values[index]);
        return Padding(
          padding: EdgeInsets.only(
            left: index == 0 ? 0 : widget.buttonGap / 2,
            right: index == widget.values.length - 1 ? 0 : widget.buttonGap / 2,
          ),
          child: RoundedButton(
            padding: widget.buttonPadding,
            cornerRadius: widget.cornerRadius ?? 30,
            borderColor: isSelected
                ? widget.selectedBorderColor ?? (widget.unselectedBorderColor)
                : widget.unselectedBorderColor,
            buttonText: Text(
              widget.labels?[index] ?? widget.values[index],
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: isSelected
                    ? widget.selectedForegroundColor ?? Theme.of(context).colorScheme.onPrimary
                    : widget.unselectedForegroundColor ?? Colors.white,
              ),
            ),
            isLeftBorder: widget.isAllCornerRounded
                ? true
                : index == 0
                ? true
                : false,
            isRightBorder: widget.isAllCornerRounded
                ? true
                : index == widget.values.length - 1
                ? true
                : false,
            color: isSelected
                ? widget.selectedBackgroundColor ?? Theme.of(context).primaryColor
                : widget.unselectedBackgroundColor,
            onTap: () {
              setState(() => selectedValue = widget.values[index]);
              widget.onChanged(widget.values[index]);
            },
          ),
        );
      }),
    );
  }
}


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonText,
    required this.isLeftBorder,
    required this.isRightBorder,
    this.onTap, this.color,
    this.cornerRadius = 30, this.borderColor, this.padding,
  }) : super(key: key);
  final Widget buttonText;
  final bool isLeftBorder;
  final bool isRightBorder;
  final Color? color;
  final Function()? onTap;
  final double cornerRadius;
  final Color? borderColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.grey,
        border: borderColor == null ? null : Border.all(color: borderColor!),
        borderRadius: BorderRadius.horizontal(
          left: isLeftBorder ? Radius.circular(cornerRadius) : const Radius.circular(0),
          right: isRightBorder ?  Radius.circular(cornerRadius) : const Radius.circular(0),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.horizontal(
            left: isLeftBorder ? Radius.circular(cornerRadius) : const Radius.circular(0),
            right: isRightBorder ? Radius.circular(cornerRadius) : const Radius.circular(0)),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: buttonText,
        ),
      ),
    );
  }
}
