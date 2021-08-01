import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_architecture/features/data/models/space_media_model.dart';

import '../../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
      description: "Pluto is more colorful than we can see. Color data and high-resolution images of our Solar System's most famous dwarf planet, taken by the robotic New Horizons spacecraft during its flyby in 2015 July, have been digitally combined to give an enhanced-color view of this ancient world sporting an unexpectedly young surface. The featured enhanced color image is not only esthetically pretty but scientifically useful, making surface regions of differing chemical composition visually distinct. For example, the light-colored heart-shaped Tombaugh Regio on the lower right is clearly shown here to be divisible into two regions that are geologically different, with the leftmost lobe Sputnik Planitia also appearing unusually smooth. After Pluto, New Horizons continued on, shooting  past asteroid Arrokoth in 2019 and has enough speed to escape our Solar System completely.    Pluto-Related Images with Brief Explanations: APOD Pluto Search",
      mediaType: "image",
      mediaUrl: "https://apod.nasa.gov/apod/image/2108/PlutoEnhancedHiRes_NewHorizons_960.jpg",
      title: "Pluto in Enhanced Color");

  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaModel>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);

    final result = SpaceMediaModel.fromJson(jsonMap);

    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    final expectMap = {
      "explanation": "Pluto is more colorful than we can see. Color data and high-resolution images of our Solar System's most famous dwarf planet, taken by the robotic New Horizons spacecraft during its flyby in 2015 July, have been digitally combined to give an enhanced-color view of this ancient world sporting an unexpectedly young surface. The featured enhanced color image is not only esthetically pretty but scientifically useful, making surface regions of differing chemical composition visually distinct. For example, the light-colored heart-shaped Tombaugh Regio on the lower right is clearly shown here to be divisible into two regions that are geologically different, with the leftmost lobe Sputnik Planitia also appearing unusually smooth. After Pluto, New Horizons continued on, shooting  past asteroid Arrokoth in 2019 and has enough speed to escape our Solar System completely.    Pluto-Related Images with Brief Explanations: APOD Pluto Search",
      "media_type": "image",
      "title": "Pluto in Enhanced Color",
      "url": "https://apod.nasa.gov/apod/image/2108/PlutoEnhancedHiRes_NewHorizons_960.jpg"
    };

    final result = tSpaceMediaModel.toJson();

    expect(result, expectMap);
  });
}
