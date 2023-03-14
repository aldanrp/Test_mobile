import 'package:flutter/cupertino.dart';
import 'package:test_mobile/app/core.dart';

class CustomButton extends StatefulWidget {
  final String textbutton;
  final Color colorbutton, colorText, colorOverlay;
  final Function() function;
  final bool backstep;
  final bool nextIcons;
  final double widthButton, heigthButton;

  const CustomButton(
      {Key? key,
      required this.textbutton,
      required this.colorbutton,
      required this.colorText,
      required this.colorOverlay,
      required this.function,
      required this.backstep,
      required this.nextIcons,
      required this.widthButton,
      required this.heigthButton})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heigthButton,
      width: widget.widthButton,
      decoration: BoxDecoration(
        color: widget.colorbutton,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(widget.colorOverlay),
        ),
        onPressed: widget.function,
        child: widget.backstep == false && widget.nextIcons == false
            ? Text(
                widget.textbutton,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.colorText,
                ),
              )
            : widget.backstep == true && widget.nextIcons == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        CupertinoIcons.back,
                        color: kWhiteColor,
                        size: 18,
                      ),
                      Text(
                        widget.textbutton,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          color: widget.colorText,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.textbutton,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: widget.colorText,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.arrow_right,
                        color: kWhiteColor,
                        size: 18,
                      ),
                    ],
                  ),
      ),
    );
  }
}
