import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/ui/assets/widgets/custombutton.dart';
import 'package:test_mobile/app/ui/assets/widgets/overviewbutton.dart';
import 'package:test_mobile/app/ui/pages/pages.dart';
import 'package:test_mobile/app/ui/pages/read_page/controller.dart';

class ReadPage extends View {
  const ReadPage({super.key});

  @override
  _ReadPageState createState() =>
      _ReadPageState(AppComponent.getInjector().get<ReadController>());
}

class _ReadPageState extends ViewState<ReadPage, ReadController> {
  final ReadController controller;
  _ReadPageState(this.controller) : super(controller);

  @override
  Widget get view => ControlledWidgetBuilder<ReadController>(
        builder: (context, controller) {
          return Scaffold(
            key: globalKey,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                'User data',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              elevation: 0.0,
              scrolledUnderElevation: 2.5,
              actions: [
                OverviewChangeViewButton(
                  currentOrientationView: controller.currentOrientationView,
                  onPressed: () {
                    controller.changeViewOrientation();
                  },
                ),
              ],
            ),
            floatingActionButton: CustomButton(
              textbutton: controller.databaru == 0 ? "Tambah" : "Hapus",
              colorbutton: kBlueColor,
              colorText: kWhiteColor,
              colorOverlay: kRedColor,
              function: () {
                Navigator.pushNamed(context, Pages.createpage);
              },
              backstep: false,
              nextIcons: false,
              widthButton: 100,
              heigthButton: 70,
            ),
            body: Padding(
              padding: horizontal(context).copyWith(
                left: 15,
                right: 15,
                top: 10,
                bottom: 20,
              ),
              child: controller.buildAktifitas(),
            ),
          );
        },
      );
}
