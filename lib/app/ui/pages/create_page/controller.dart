import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/infrastructures/base_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_mobile/app/ui/pages/create_page/presenter_create.dart';
import 'package:test_mobile/data/payload/api/create_api_request.dart';
import 'package:test_mobile/domains/entities/create.dart';

class CreateController extends BaseController {
  CreatePresenter createPresenter;

  CreateController(this.createPresenter);

  TextEditingController controllerFirst = TextEditingController();
  TextEditingController controllerLast = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  bool isEnable = false;
  bool isSave = false;

  File? _image;

  File? get image => _image;

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
    createPresenter.getDetailsUserOnNext = (Create data) async {
      Navigator.pop(context);
      AwesomeDialog(
        context: context,
        animType: AnimType.leftSlide,
        headerAnimationLoop: false,
        dialogType: DialogType.success,
        showCloseIcon: true,
        title: 'Succes melakukan penambahan data',
        titleTextStyle:
            blackTextStyle.copyWith(fontSize: 16, color: kGreenColor),
        desc: 'Dengan keterangan waktu ${data.createdAt}',
        descTextStyle:
            blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
      ).show();
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
      });
    };

    createPresenter.getDetailsUserOnComplete = () {
      debugPrint("scan: completed ");
    };

    createPresenter.getDetailsUserOnError = (e) {
      print("ini nama errornya $e");
      Navigator.pop(context);
      if (e == 400) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Perhatian',
          titleTextStyle:
              blackTextStyle.copyWith(fontSize: 18, color: kRedColor),
          desc: "Anda Sudah pernah melakukan scan pada aktivitas ini",
          descTextStyle:
              blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
        ).show();
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Error',
          titleTextStyle:
              blackTextStyle.copyWith(fontSize: 16, color: kRedColor),
          desc: e.toString(),
          descTextStyle:
              blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
        ).show();
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      }
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pop(context);
      });
    };
  }

  @override
  void load() {}

  void getdata() {
    showLoaderDialog(context);
    createPresenter.onGetAllAktifitas(CreateApiRequest(
        controllerFirst.text, controllerLast.text, controllerEmail.text));
  }

  void isEdit() {
    isEnable = !isEnable;
    isSave = !isSave;
    refreshUI();
  }

  Future<PermissionStatus> requestPhotosPermission() async {
    return await Permission.photos.request();
  }

  Future<bool> handlePhotosPermission(BuildContext context) async {
    PermissionStatus photosPermissionStatus = await requestPhotosPermission();

    if (photosPermissionStatus != PermissionStatus.granted) {
      print(
          '😰 😰 😰 😰 😰 😰 Permission to photos not granted! 😰 😰 😰 😰 😰 😰 $photosPermissionStatus');
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Photos Permission'),
          content: const Text(
              'Photos permission should Be granted to use this feature, would you like to go to app settings to give photos permission?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                openAppSettings();
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text("okay"),
              ),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }

  Future getImage(ImageSource source) async {
    bool canProceed = await handlePhotosPermission(context);
    if (canProceed) {
      try {
        final image = await ImagePicker().pickImage(
          source: source,
        );
        if (image == null) return;
        _image = File(image.path);

        refreshUI();
      } on PlatformAssetBundle catch (e) {
        print('Failed to get image: $e');
      }
    }
  }

  void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              child: const CircularProgressIndicator()),
          Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text("Harap Menunggu...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
