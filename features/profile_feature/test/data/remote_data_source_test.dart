import 'dart:convert';
import 'package:core_package/core_package.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:profile_feature/src/data/shipping_address/repository_impl/shipping_address_rest_client.dart';

class DioAdapterMock extends Mock implements HttpClientAdapter {}

const dioHttpHeadersForResponseBody = {
  "Content-Type": ["application/json"]
};

@GenerateMocks([Dio])
void main() {
  final Dio dio = Dio();
  late ShippingAddressRestClient restClient;
  late DioAdapterMock dioAdapterMock;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    restClient = ShippingAddressRestClient(dio);
  });
  final successJson = [
    {
      "id": "53",
      "createdAt": "22-04-2022",
      "name": "CNTT K21 Lien Thong",
      "avatar": "avatar CNTT K21"
    },
    {
      "id": "54",
      "createdAt": "15-09-2022",
      "name": "ST20A1B",
      "avatar": "https://donga.edu.vn"
    },
  ];

  final successResponse = ResponseBody.fromString(
    jsonEncode(successJson),
    200,
  );
  group("API Testing: ", () {
    test("Fetch list shipping address", () async {
      final httpResponse = ResponseBody.fromString(
        jsonEncode(successJson),
        200,
        headers: dioHttpHeadersForResponseBody,
      );
      final requestOption = RequestOptions(
          path: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1//tasks');
      when(
        dioAdapterMock.fetch(requestOption, any, any),
      ).thenAnswer((_) async {
        return httpResponse;
      });
      final result = await restClient.fetchShippingAddress();
      print(result);
      // expect(result, isA<List<ShippingAddressDto>>());
    });
  });
}
