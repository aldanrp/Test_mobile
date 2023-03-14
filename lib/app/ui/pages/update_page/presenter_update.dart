import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/data/payload/api/update_api_request.dart';
import 'package:test_mobile/domains/entities/update.dart';
import 'package:test_mobile/domains/entities/user.dart';
import 'package:test_mobile/use_cases/create_usecase/delete_usecase.dart';
import 'package:test_mobile/use_cases/create_usecase/details_usecase.dart';
import 'package:test_mobile/use_cases/create_usecase/update_usecase.dart';

class UpdatePresenter extends Presenter {
  final GetDetailsUseCase _getDetailsUseCase;
  final GetUpdateUseCase _getUpdateUseCase;
  final DeleteUseCase _deleteUseCase;

  late Function getDetailsUserOnNext;
  late Function getDetailsUserOnComplete;
  late Function getDetailsUserOnError;
  late Function getUpdateUserOnNext;
  late Function getUpdateUserOnComplete;
  late Function getUpdateUserOnError;
  late Function DeleteUserOnNext;
  late Function DeleteUserOnComplete;
  late Function DeleteUserOnError;

  UpdatePresenter(
      this._getDetailsUseCase, this._getUpdateUseCase, this._deleteUseCase);

  void onGetAllAktifitas(int? req) {
    _getDetailsUseCase.execute(_GetParafedDocsObserver(this), req);
  }

  void onUpdateUser(UpdateApiRequest req) {
    _getUpdateUseCase.execute(_GetParafedDocsObserverUpdate(this), req);
  }

  void onDeleteUser(int? req) {
    _deleteUseCase.execute(_GetParafedDocsObserverDelete(this), req);
  }

  @override
  void dispose() {
    _getDetailsUseCase.dispose();
  }
}

class _GetParafedDocsObserver implements Observer<Users> {
  final UpdatePresenter _presenter;

  _GetParafedDocsObserver(this._presenter);

  @override
  void onNext(Users? users) {
    _presenter.getDetailsUserOnNext(users);
  }

  @override
  void onComplete() {
    _presenter.getDetailsUserOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getDetailsUserOnError(e);
  }
}

class _GetParafedDocsObserverUpdate implements Observer<Update> {
  final UpdatePresenter _presenter;

  _GetParafedDocsObserverUpdate(this._presenter);

  @override
  void onNext(Update? users) {
    print("ini dari presenter $users");
    _presenter.getUpdateUserOnNext(users);
  }

  @override
  void onComplete() {
    _presenter.getUpdateUserOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getUpdateUserOnError(e);
  }
}

class _GetParafedDocsObserverDelete implements Observer<String> {
  final UpdatePresenter _presenter;

  _GetParafedDocsObserverDelete(this._presenter);

  @override
  void onNext(String? users) {
    print("ini dari presenter $users");
    _presenter.DeleteUserOnNext(users);
  }

  @override
  void onComplete() {
    _presenter.DeleteUserOnComplete();
  }

  @override
  void onError(e) {
    _presenter.DeleteUserOnError(
      "StatusCode 204 (No Content), terjadi kesalahan pada data API",
    );
  }
}
