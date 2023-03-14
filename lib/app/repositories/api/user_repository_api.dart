import 'package:dio/dio.dart';
import 'package:test_mobile/app/infrastructures/endpoints.dart';
import 'package:test_mobile/data/infrastructures/api_service_interface.dart';
import 'package:test_mobile/data/payload/api/create_api_request.dart';
import 'package:test_mobile/data/payload/api/update_api_request.dart';
import 'package:test_mobile/data/persistences/mappers/user_create_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_detail_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_mappers.dart';
import 'package:test_mobile/data/persistences/mappers/user_update_mapper.dart';
import 'package:test_mobile/data/persistences/repositories/repository_user_data.dart';
import 'package:test_mobile/domains/entities/create.dart';
import 'package:test_mobile/domains/entities/update.dart';
import 'package:test_mobile/domains/entities/user.dart';

class UserApiRepository extends UserRepository {
  final ApiServiceInterface _service;
  final Endpoints _endpoints;
  final UserMapper _mapper;
  final UserDetailsMapper _detailsMapper;
  final UserUpdateMapper _updateMapper;
  final UserCreateMapper _createMapper;

  UserApiRepository(this._service, this._endpoints, this._mapper,
      this._detailsMapper, this._updateMapper, this._createMapper);

  @override
  Future<List<Users>> getAllUsers(Map<String, dynamic> params) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(
        _endpoints.user(),
        RequestType.get,
        params: params,
      );
      print("ini datanya $resp");
    } catch (error) {
      rethrow;
    }
    return _mapper.convertApiGetUsers(resp);
  }

  @override
  Future<Users> getDetailsUser(int params) async {
    dynamic resp;

    try {
      resp = await _service.invokeHttp(
        "${_endpoints.user()}/$params",
        RequestType.get,
      );
    } catch (error) {
      rethrow;
    }
    return _detailsMapper.convertApiDetails(resp);
  }

  @override
  Future<Update> getUpdateUser(UpdateApiRequest params) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(
        "${_endpoints.user()}/${params.id}",
        RequestType.put,
        body: params,
      );
    } catch (error) {
      rethrow;
    }
    return _updateMapper.convertApiDetails(resp);
  }

  @override
  Future<Create> getCreateUser(CreateApiRequest params) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(
        _endpoints.user(),
        RequestType.post,
        body: params,
      );
      print("ini responya direpo : $resp");
    } catch (error) {
      rethrow;
    }
    return _createMapper.convertApiDetails(resp);
  }

  @override
  Future<String> deleteUser(int params) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(
        "${_endpoints.user()}/$params",
        RequestType.delete,
      );
    } catch (error) {
      resp = "Data berhasil dihapus";
      return resp;
    }
    resp = "Data berhasil dihapus";
    return resp;
  }
}
