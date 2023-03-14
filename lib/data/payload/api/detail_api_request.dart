import 'package:test_mobile/data/payload/contracts/details_request_interface.dart';

class DetailsApiRequest implements detailsRequestInterface {
  String id;

  DetailsApiRequest(this.id);

  @override
  Map<String, dynamic> encode() {
    return {
      "id": id,
    };
  }
}
