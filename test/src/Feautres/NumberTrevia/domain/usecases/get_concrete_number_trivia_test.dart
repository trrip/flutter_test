import 'package:dartz/dartz.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/entities/number_trivia.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/repositories/number_trivia_repo.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:mockito/mockito.dart';
import "package:flutter_test/flutter_test.dart";

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  final tnum = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: "test");

  test('should get trivia for number repo', () async {
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(Params(number: tnum));

    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tnum));
  });
}
