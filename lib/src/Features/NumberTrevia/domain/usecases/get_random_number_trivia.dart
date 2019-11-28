import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_api/src/Error/failures.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/entities/number_trivia.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/repositories/number_trivia_repo.dart';
import 'package:flutter_api/src/usercases/usecase.dart';

class GetRandomTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repo;

  GetRandomTrivia(this.repo);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    // TODO: implement call

    return await repo.getRandomNumberTrivia();
  }
}
