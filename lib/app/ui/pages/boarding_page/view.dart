import 'package:intro_slider/intro_slider.dart';
import 'package:test_mobile/app/core.dart';

class BoardingPage extends View {
  const BoardingPage({super.key});

  @override
  _BoardingPageState createState() =>
      _BoardingPageState(AppComponent.getInjector().get<BoardingController>());
}

class _BoardingPageState extends ViewState<BoardingPage, BoardingController> {
  final BoardingController _controller;

  _BoardingPageState(this._controller) : super(_controller);

  @override
  Widget get view => ControlledWidgetBuilder<BoardingController>(
        builder: (context, controller) {
          return Scaffold(
            key: globalKey,
            body: IntroSlider(
              key: UniqueKey(),
              listContentConfig: controller.listContentConfig,
              onDonePress: () {
                controller.onDonePress();
              },
              onSkipPress: () {
                controller.onDonePress();
              },
              isAutoScroll: true,
              isLoopAutoScroll: true,
              curveScroll: Curves.bounceIn,
              renderNextBtn: controller.nextRenderBtn(),
              renderSkipBtn: controller.skipRenderbtn(),
              renderDoneBtn: controller.doneRenderBtn(),
            ),
          );
        },
      );
}
