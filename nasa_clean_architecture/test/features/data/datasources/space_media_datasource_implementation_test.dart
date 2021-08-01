import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_architecture/core/errors/exceptions.dart';
import 'package:nasa_clean_architecture/core/http_client/http_client.dart';
import 'package:nasa_clean_architecture/core/utils/keys/nasa_api_keu.dart';
import 'package:nasa_clean_architecture/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_architecture/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:nasa_clean_architecture/features/data/models/space_media_model.dart';

import '../../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = SpaceMediaDatasourceImplementation(client);
  });

  final tDateTime = DateTime(2021, 02, 02);
  final urlExpected = 'https://api.nasa.gov/planetary/apod?api_key=${NasaApiKeys.apiKey}&date=2021-02-02';

  void successMock() {
    when(() => client.get(any())).thenAnswer((invocation) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
  }

  test("should call the get method with correct url", () async {
    successMock();

    await datasource.getSpaceMediaFromDate(tDateTime);

    verify(() => client.get(urlExpected)).called(1);
  });

  test('should return a SpaceMediaModel when is successful', () async {
    successMock();
    final tSpaceMediaModelExpected = SpaceMediaModel(
        description: "Pluto is more colorful than we can see. Color data and high-resolution images of our Solar System's most famous dwarf planet, taken by the robotic New Horizons spacecraft during its flyby in 2015 July, have been digitally combined to give an enhanced-color view of this ancient world sporting an unexpectedly young surface. The featured enhanced color image is not only esthetically pretty but scientifically useful, making surface regions of differing chemical composition visually distinct. For example, the light-colored heart-shaped Tombaugh Regio on the lower right is clearly shown here to be divisible into two regions that are geologically different, with the leftmost lobe Sputnik Planitia also appearing unusually smooth. After Pluto, New Horizons continued on, shooting  past asteroid Arrokoth in 2019 and has enough speed to escape our Solar System completely.    Pluto-Related Images with Brief Explanations: APOD Pluto Search",
        mediaType: "image",
        mediaUrl: "https://apod.nasa.gov/apod/image/2108/PlutoEnhancedHiRes_NewHorizons_960.jpg",
        title: "Pluto in Enhanced Color");

    final result = await datasource.getSpaceMediaFromDate(tDateTime);

    expect(result, tSpaceMediaModelExpected);
  });

  test('should throw a ServerException when the call is unsuccessful', () async {
    when(() => client.get(any())).thenAnswer((_) async => HttpResponse(data: "something went wrong", statusCode: 400));

    final result = datasource.getSpaceMediaFromDate(tDateTime);

    expect(() => result, throwsA(ServerException()));
  });
}
