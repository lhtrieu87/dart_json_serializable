import 'dart:convert';

import 'package:example_json_serializable/models.dart';
import "package:test/test.dart";

void main() {
  group('models', () {
    test("People", () {
      String json = '{"name": "Test", "species": ["https://swapi.co/api/species/1/"]}';
      expect(new People.fromJson(JSON.decode(json)), equals
        (new People("Test", ['https://swapi.co/api/species/1/'])));
    });
  });
}