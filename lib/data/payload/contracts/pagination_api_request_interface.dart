import 'package:test_mobile/data/payload/contracts/api_request_interface.dart';

class PaginationApiRequest implements PaginationRequestInterface {
  int? page;
  int? pagesize;

  PaginationApiRequest({
    this.page,
    this.pagesize,
  });

  @override
  Map<String, dynamic> encode() {
    return {
      'pagination[pageSize]': pagesize,
      'pagination[page]': page,
    };
  }
}
