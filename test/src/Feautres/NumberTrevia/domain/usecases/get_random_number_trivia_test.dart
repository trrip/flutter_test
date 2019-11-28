import 'package:dartz/dartz.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/entities/number_trivia.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/repositories/number_trivia_repo.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_api/src/usercases/usecase.dart';
import 'package:mockito/mockito.dart';
import "package:flutter_test/flutter_test.dart";

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomTrivia(mockNumberTriviaRepository);
  });
  final tNumberTrivia = NumberTrivia(number: 1, text: "test");

  test('should get trivia form repo', () async {
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(NoParams());

    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
