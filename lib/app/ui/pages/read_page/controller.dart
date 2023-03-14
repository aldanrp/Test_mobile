import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/infrastructures/base_controller.dart';
import 'package:test_mobile/app/ui/assets/widgets/custom_card_user.dart';
import 'package:test_mobile/app/ui/pages/pages.dart';
import 'package:test_mobile/app/ui/pages/read_page/presenter.dart';
import 'package:test_mobile/data/payload/contracts/pagination_api_request_interface.dart';
import 'package:test_mobile/domains/entities/user.dart';

class ReadController extends BaseController {
  ReadPresenter presenter;

  ReadController(this.presenter);

  int currentOrientationView = 1;
  final List<Users> _users = List<Users>.empty(growable: true);

  int page = 1;
  int empty = 0;
  bool isSelected = false;
  int databaru = 0;

  List<Users> get dataUser => _users;

  ScrollController scrollController = ScrollController();

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
    presenter.getAllAktifitasOnNext = (List<Users> aktifitas) async {
      debugPrint("get : success aktifitas");
      if (page == 1) {
        _users.clear();
        if (_users.isEmpty) {
          empty = 1;
        }
      }

      _users.addAll(aktifitas);
    };

    presenter.getAllAktifitasOnComplete = () {
      debugPrint("get : completed aktifitas");
      isLoading = false;
      refreshUI();
    };

    presenter.getAllAktifitasOnError = (e) {
      debugPrint("get : error aktifitas $e");
      isLoading = false;
      refreshUI();
    };
  }

  @override
  void load() {
    getAllAktifitas();
  }

  void getAllAktifitas() {
    empty = 0;
    presenter.onGetAllAktifitas(PaginationApiRequest(page: 1, pagesize: 100));
  }

  void changeViewOrientation() {
    if (currentOrientationView == 1) {
      currentOrientationView = 2;
      refreshUI();
    } else {
      currentOrientationView = 1;
      refreshUI();
    }
  }

  Widget buildAktifitas() {
    if (empty != 0) {
      if (_users.isNotEmpty) {
        return Builder(builder: (BuildContext context) {
          return SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: currentOrientationView,
              axisDirection: AxisDirection.down,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              children: [
                for (final data in _users)
                  CustomCardUser(
                    users: data,
                    onTap: () {
                      selected(data);
                      Navigator.pushNamed(
                        context,
                        Pages.details,
                        arguments: data.id,
                      );
                    },
                    isSeleted: databaru == data.id ? true : false,
                    currentOrientationView: currentOrientationView,
                  ),
              ],
            ),
          );
        });
      } else {
        return Stack(
          children: <Widget>[
            Center(
                child: Text(
              "Maaf Data tidak ditemukan",
              style: blackTextStyle.copyWith(fontSize: 24),
            )),
          ],
        );
      }
    } else {
      return setShimmerLoading();
    }
  }

  void selected(Users data) {
    if (databaru == 0 || databaru != data.id) {
      databaru = data.id;
    } else {
      databaru = 0;
    }
    isSelected = !isSelected;
    refreshUI();
  }

  Widget buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget setShimmerLoading() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 120.0,
                child: Shimmer.fromColors(
                  baseColor: const Color(0xFFDCDCDC),
                  highlightColor: const Color(0xFFD3D3D3),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 20,
                          color: Color(0xFFE9E9E9),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
