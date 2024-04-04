part of '../domain.dart';

abstract class BaseUseCase {
  const BaseUseCase();
}

abstract class UseCase<Response, Param> extends BaseUseCase {
  const UseCase() : super();

  Future<Response> execute(Param params);
}

abstract class NoParamsUseCase<Response> extends BaseUseCase {
  const NoParamsUseCase() : super();

  Future<Response> execute();
}

abstract class NoParamsNonFutureUseCase<Response> extends BaseUseCase {
  const NoParamsNonFutureUseCase() : super();

  Response execute();
}

abstract class NonFutureUseCase<Response, Param> extends BaseUseCase {
  const NonFutureUseCase() : super();

  Response execute(Param param);
}

