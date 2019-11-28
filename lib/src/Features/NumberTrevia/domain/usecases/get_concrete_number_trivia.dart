import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api/src/Error/failures.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/entities/number_trivia.dart';
import 'package:flutter_api/src/Features/NumberTrevia/domain/repositories/number_trivia_repo.dart';
import 'package:flutter_api/src/usercases/usecase.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repo;

  GetConcreteNumberTrivia(this.repo);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repo.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({@required this.number}) : super([number]);
}
