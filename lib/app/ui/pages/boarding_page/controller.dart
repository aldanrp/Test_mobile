import 'package:intro_slider/intro_slider.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/infrastructures/base_controller.dart';
import 'package:test_mobile/app/ui/pages/pages.dart';

class BoardingController extends BaseController {
  bool visibility = false;
  List<ContentConfig> listContentConfig = [];

  @override
  void disposing() {
    // TODO: implement disposing
  }

  @override
  void getArgs() {
    // TODO: implement getArgs
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  @override
  void load() {
    listContentConfig.add(
      ContentConfig(
        widgetTitle: Center(
          child: Text(
            "MAID",
            style: whiteTextStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        description: "Aku akan memastikan kamu nyaman dengan rumah mu",
        styleDescription: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        pathImage: "lib/app/ui/assets/images/maid.png",
        backgroundColor: kRedColor,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        widgetTitle: Center(
          child: Text(
            "NANNY",
            style: whiteTextStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        description: "Aku akan menjaga putra - putri mu seperti anakku sendiri",
        styleDescription: whiteTextStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        pathImage: "lib/app/ui/assets/images/nanny.png",
        backgroundColor: kGreenColor,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        widgetTitle: Center(
          child: Text(
            "BUTLER",
            style: blackTextStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        widgetDescription: Center(
          child: Text(
            "Siap, Membantu anda",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        pathImage: "lib/app/ui/assets/images/36222.jpg",
        backgroundColor: kWhiteColor,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamedAndRemoveUntil(
        context, Pages.readpage, (route) => false);
  }

  Widget skipRenderbtn() {
    return Text(
      "Skip",
      style: whiteTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget nextRenderBtn() {
    return Text(
      "Next",
      style: whiteTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget doneRenderBtn() {
    return Text(
      "Done",
      style: blackAccentTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
