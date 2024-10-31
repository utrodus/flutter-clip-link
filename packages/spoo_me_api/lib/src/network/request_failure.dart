import 'package:equatable/equatable.dart';
import 'package:spoo_me_api/spoo_me_api.dart';

abstract class RequestFailure extends Equatable {
  final String? message;
  const RequestFailure({this.message});

  @override
  List<Object?> get props => [message];
}

class HttpRequestFailure extends RequestFailure {
  @override
  String get message => ErrorMessage.httpRequestFailure;
}

class ParseJsonFailure extends RequestFailure {
  @override
  String get message => ErrorMessage.parseJsonFailure;
}

class InvalidUrlRequestFailure extends RequestFailure {
  @override
  String get message => ErrorMessage.urlInvalid;
}

class UrlNotFoundRequestFailure extends RequestFailure {
  @override
  String get message => ErrorMessage.urlNotFound;
}

class AliasRequestFailure extends RequestFailure {
  @override
  String get message => ErrorMessage.aliasError;
}

class PasswordInvalidRequestFailure extends RequestFailure {
  @override
  String get message => ErrorMessage.passwordInvalid;
}

class WrongPasswordFailure extends RequestFailure {
  @override
  String get message => ErrorMessage.wrongPassword;
}
