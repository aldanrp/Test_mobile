abstract class ApiRequestInterface {
  Map<String, dynamic> encode();
}

abstract class PaginationRequestInterface implements ApiRequestInterface {}
