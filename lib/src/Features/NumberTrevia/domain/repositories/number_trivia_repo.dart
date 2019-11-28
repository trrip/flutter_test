import 'package:dartz/dartz.dart';
import 'package:flutter_api/src/Error/failures.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
