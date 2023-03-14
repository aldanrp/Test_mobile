import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:test_mobile/data/payload/contracts/api_request_interface.dart';
import 'package:test_mobile/domains/entities/user.dart';
import 'package:test_mobile/use_cases/read_usecase/read_usecase.dart';

class ReadPresenter extends Presenter {
  final GetAllUserUseCase _getAllAktifitasUseCase;

  late Function getAllAktifitasOnNext;
  late Function getAllAktifitasOnComplete;
  late Function getAllAktifitasOnError;

  ReadPresenter(
    this._getAllAktifitasUseCase,
  );

  void onGetAllAktifitas(PaginationRequestInterface req) {
    print("ini dari presenter : $req");
    _getAllAktifitasUseCase.execute(
        _GetParafedDocsObserver(this), req.encode());
  }

  // void onSearchAkfititas(PaginationRequestInterface req) {
  //   print(req.toString());
  //   _getSearchAktifitasUseCase.execute(
  //       _GetParafedDocsObserver(this), req.encode());
  // }

  @override
  void dispose() {
    _getAllAktifitasUseCase.dispose();
  }
}

class _GetParafedDocsObserver implements Observer<List<Users>> {
  final ReadPresenter _presenter;

  _GetParafedDocsObserver(this._presenter);

  @override
  void onNext(List<Users>? users) {
    _presenter.getAllAktifitasOnNext(users);
  }

  @override
  void onComplete() {
    _presenter.getAllAktifitasOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getAllAktifitasOnError(e);
  }
}
