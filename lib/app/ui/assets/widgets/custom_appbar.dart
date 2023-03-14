import 'package:google_fonts/google_fonts.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/ui/assets/widgets/custombutton.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool isback;
  final Widget rightchild;
  final String titleAppbar;
  final Function() backFunction;
  final Color? color;
  final Color? colortitle;

  const CustomAppBar({
    Key? key,
    required this.height,
    required this.isback,
    required this.rightchild,
    required this.titleAppbar,
    required this.backFunction,
    this.color,
    this.colortitle,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      scrolledUnderElevation: 2.5,
      automaticallyImplyLeading: false,
      backgroundColor: color ?? kWhiteColor,
      toolbarHeight: height,
      shadowColor: const Color.fromARGB(151, 20, 20, 20),
      centerTitle: true,
      title: isback == false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  titleAppbar,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colortitle ?? kBlackColor,
                  ),
                ),
                rightchild,
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  textbutton: "Kembali",
                  colorbutton: kYellowColor,
                  colorText: kBlackAccentColor,
                  colorOverlay: kBlackAccentColor,
                  function: backFunction,
                  backstep: true,
                  nextIcons: false,
                  heigthButton: 40,
                  widthButton: 107,
                ),
                Text(
                  titleAppbar,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colortitle ?? kBlackColor,
                  ),
                ),
                rightchild
              ],
            ),
    );
  }
}
