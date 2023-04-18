import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomError extends Equatable {
  final String errMsg;

  CustomError({
    this.errMsg = '',
  });

  @override
  String toString() => 'CustomError(errMsg: $errMsg)';

  @override
  List<Object> get props => [errMsg];
}
