import 'dart:convert';

import 'package:flutter_api/src/Features/NumberTrevia/data/models/number_trivia_model.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Text Test');

  test(
    'should be a subclass of Number Trivia entity',
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
  group('fromJson ', () {
    test('should return valid model when the json is a Integer', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);
      print(result);
      expect(result, tNumberTriviaModel);
    });

    test('should return valid model when the json is a double', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);
      print(result);
      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return json map for peoper data', () async {
      final result = tNumberTriviaModel.toJson();
      final expectedMap = {
        "text": "Text Test",
        "number": 1,
      };
      expect(result, expectedMap);
    });
  });
}
