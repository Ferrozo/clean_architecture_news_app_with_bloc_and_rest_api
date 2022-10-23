// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

abstract class DataState<T> {
  const DataState({this.data, this.error});
  final T? data;
  final DioError? error;
}

class DataSucess<T> extends DataState<T> {
  const DataSucess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioError error) : super(error: error);
}
