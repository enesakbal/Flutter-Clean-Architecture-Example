// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_clean_architecture/test/_utils/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dio/dio.dart' as _i4;
import 'package:flutter_clean_architecture/src/core/network/dio_client.dart'
    as _i7;
import 'package:flutter_clean_architecture/src/data/datasources/remote/movie/movie_remote_data_source.dart'
    as _i5;
import 'package:flutter_clean_architecture/src/data/models/movie_credit/movie_credit_model.dart'
    as _i3;
import 'package:flutter_clean_architecture/src/data/models/movie_listings/movie_listings_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMovieListingsModel_0 extends _i1.SmartFake
    implements _i2.MovieListingsModel {
  _FakeMovieListingsModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieCreditModel_1 extends _i1.SmartFake
    implements _i3.MovieCreditModel {
  _FakeMovieCreditModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2<T> extends _i1.SmartFake implements _i4.Response<T> {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i5.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.MovieListingsModel> getPopularMovies({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
          {#page: page},
        ),
        returnValue:
            _i6.Future<_i2.MovieListingsModel>.value(_FakeMovieListingsModel_0(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
            {#page: page},
          ),
        )),
      ) as _i6.Future<_i2.MovieListingsModel>);

  @override
  _i6.Future<_i2.MovieListingsModel> getTopRatedMovies({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
          {#page: page},
        ),
        returnValue:
            _i6.Future<_i2.MovieListingsModel>.value(_FakeMovieListingsModel_0(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
            {#page: page},
          ),
        )),
      ) as _i6.Future<_i2.MovieListingsModel>);

  @override
  _i6.Future<_i3.MovieCreditModel> getMovieCredits({required int? movieId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieCredits,
          [],
          {#movieId: movieId},
        ),
        returnValue:
            _i6.Future<_i3.MovieCreditModel>.value(_FakeMovieCreditModel_1(
          this,
          Invocation.method(
            #getMovieCredits,
            [],
            {#movieId: movieId},
          ),
        )),
      ) as _i6.Future<_i3.MovieCreditModel>);
}

/// A class which mocks [DioClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioClient extends _i1.Mock implements _i7.DioClient {
  MockDioClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response<dynamic>> get(
    String? url, {
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #get,
            [url],
            {
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);

  @override
  _i6.Future<_i4.Response<dynamic>> post(
    String? uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [uri],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #post,
            [uri],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);

  @override
  _i6.Future<_i4.Response<dynamic>> put(
    String? uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [uri],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #put,
            [uri],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);

  @override
  _i6.Future<_i4.Response<dynamic>> patch(
    String? uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [uri],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue:
            _i6.Future<_i4.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #patch,
            [uri],
            {
              #data: data,
              #queryParameters: queryParameters,
              #options: options,
              #cancelToken: cancelToken,
              #onSendProgress: onSendProgress,
              #onReceiveProgress: onReceiveProgress,
            },
          ),
        )),
      ) as _i6.Future<_i4.Response<dynamic>>);

  @override
  _i6.Future<dynamic> delete(
    String? uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [uri],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i6.Future<dynamic>.value(),
      ) as _i6.Future<dynamic>);
}
