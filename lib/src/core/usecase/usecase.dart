import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params, Repository> {
  Repository get repository;
  Future<Either<Exception, Type>> call(Params param);
}
