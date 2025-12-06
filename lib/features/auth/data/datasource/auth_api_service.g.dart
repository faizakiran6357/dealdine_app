// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'auth_api_service.dart';

// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

// class _AuthApiService implements AuthApiService {
//   _AuthApiService(
//     this._dio, {
//     this.baseUrl,
//   }) {
//     baseUrl ??= 'http://192.168.100.32:5000/api/auth';
//   }

//   final Dio _dio;

//   String? baseUrl;

//   @override
//   Future<User> signup(body) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(body);
//     final _result =
//         await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/signup',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = User.fromJson(_result.data!);
//     return value;
//   }

//   @override
//   Future<User> login(body) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(body);
//     final _result =
//         await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/login',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     final value = User.fromJson(_result.data!);
//     return value;
//   }

//   @override
//   Future<Map<String, dynamic>> sendOtp(body) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(body);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<Map<String, dynamic>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/send-otp',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     var value = _result.data!.map((k, dynamic v) =>
//         MapEntry(k, dynamic.fromJson(v as Map<String, dynamic>)));
//     return value;
//   }

//   @override
//   Future<Map<String, dynamic>> verifyOtp(body) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(body);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<Map<String, dynamic>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/verify-otp',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     var value = _result.data!.map((k, dynamic v) =>
//         MapEntry(k, dynamic.fromJson(v as Map<String, dynamic>)));
//     return value;
//   }

//   @override
//   Future<Map<String, dynamic>> resetPassword(body) async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(body);
//     final _result = await _dio.fetch<Map<String, dynamic>>(
//         _setStreamType<Map<String, dynamic>>(Options(
//       method: 'POST',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/reset-password',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
//     var value = _result.data!.map((k, dynamic v) =>
//         MapEntry(k, dynamic.fromJson(v as Map<String, dynamic>)));
//     return value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }
// }
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AuthApiService implements AuthApiService {
  _AuthApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://192.168.100.37:5000/api/auth';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User> signup(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    ).compose(
      _dio.options,
      '/signup',
      queryParameters: queryParameters,
      data: _data,
    ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User> login(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    ).compose(
      _dio.options,
      '/login',
      queryParameters: queryParameters,
      data: _data,
    ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Map<String, dynamic>> sendOtp(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    ).compose(
      _dio.options,
      '/send-otp',
      queryParameters: queryParameters,
      data: _data,
    ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl));
    return _result.data!;
  }

  @override
  Future<Map<String, dynamic>> verifyOtp(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    ).compose(
      _dio.options,
      '/verify-otp',
      queryParameters: queryParameters,
      data: _data,
    ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl));
    return _result.data!;
  }

  @override
  Future<Map<String, dynamic>> resetPassword(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result =
        await _dio.fetch<Map<String, dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    ).compose(
      _dio.options,
      '/reset-password',
      queryParameters: queryParameters,
      data: _data,
    ).copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl));
    return _result.data!;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
