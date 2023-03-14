import 'package:test_mobile/app/core.dart';

class OverviewChangeViewButton extends StatelessWidget {
  final Function() onPressed;
  final int currentOrientationView;
  const OverviewChangeViewButton(
      {super.key,
      required this.onPressed,
      required this.currentOrientationView});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: currentOrientationView == 2
          ? Icon(
              Icons.view_agenda_outlined,
              color: kBlackColor,
            )
          : Icon(
              Icons.grid_view,
              color: kBlackColor,
            ),
    );
  }
}
