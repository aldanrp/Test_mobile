import 'package:test_mobile/app/core.dart';

class SplashPage extends View {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() =>
      _SplashPageState(AppComponent.getInjector().get<SplashController>());
}

class _SplashPageState extends ViewState<SplashPage, SplashController> {
  final SplashController _controller;

  _SplashPageState(this._controller) : super(_controller);

  @override
  Widget get view => ControlledWidgetBuilder<SplashController>(
        builder: (context, controller) {
          return Scaffold(
            backgroundColor: kWhiteColor,
            key: globalKey,
            body: SingleChildScrollView(
              child: SizedBox(
                height: height(context),
                width: width(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "lib/app/ui/assets/images/Bird.svg",
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      boxheight(20),
                      Center(
                        child: CircularProgressIndicator(
                          color: kBlackAccentColor,
                          backgroundColor: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
}
