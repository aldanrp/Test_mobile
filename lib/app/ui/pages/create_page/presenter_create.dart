import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/data/payload/api/create_api_request.dart';
import 'package:test_mobile/domains/entities/create.dart';

import 'package:test_mobile/use_cases/create_usecase/create_usecase.dart';

class CreatePresenter extends Presenter {
  final GetCreateUseCase _getDetailsUseCase;

  late Function getDetailsUserOnNext;
  late Function getDetailsUserOnComplete;
  late Function getDetailsUserOnError;

  CreatePresenter(this._getDetailsUseCase);

  void onGetAllAktifitas(CreateApiRequest req) {
    _getDetailsUseCase.execute(_GetParafedDocsObserver(this), req);
  }

  @override
  void dispose() {
    _getDetailsUseCase.dispose();
  }
}

class _GetParafedDocsObserver implements Observer<Create> {
  final CreatePresenter _presenter;

  _GetParafedDocsObserver(this._presenter);

  @override
  void onNext(Create? users) {
    _presenter.getDetailsUserOnNext(users);
  }

  @override
  void onComplete() {
    _presenter.getDetailsUserOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getDetailsUserOnError(e);
    // DioError d = e;
    // if (d.response!.statusCode == 500) {
    //   _presenter.getDetailsUserOnError("Internal Server error");
    // }
    // if (d.response!.statusCode == 401) {
    //   _presenter.getDetailsUserOnError("Akun tidak ditemukan");
    // }
    // if (d.response!.statusCode == 400) {
    //   _presenter.getDetailsUserOnError(400);
    // } else {

    // }
  }
}
