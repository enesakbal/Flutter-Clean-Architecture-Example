import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/src/core/constants/url_constants.dart';
import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/data/datasources/export_datasources.dart';
import 'package:flutter_clean_architecture/src/data/models/movie_credit/movie_credit_model.dart';
import 'package:flutter_clean_architecture/src/data/models/movie_listings/movie_listings_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/json_reader.dart';
import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late DioClient mockDioClient;
  late final MovieRemoteDataSourceImpl actorRemoteDataSource;

  late final MovieListingsModel tMovieListingsModel;
  late final MovieCreditModel tMovieCreditModel;

  late final dynamic movieListingsJson;
  late final dynamic movieCreditJson;

  setUpAll(() {
    mockDioClient = MockDioClient();
    actorRemoteDataSource = MovieRemoteDataSourceImpl(mockDioClient);

    movieListingsJson = jsonReader('movie_listings_dummy_data.json');
    movieCreditJson = jsonReader('movie_credit_dummy_data.json');

    tMovieListingsModel = MovieListingsModel.fromJson(movieListingsJson as Map<String, dynamic>);
    tMovieCreditModel = MovieCreditModel.fromJson(movieCreditJson as Map<String, dynamic>);
  });

  //* This is the test for the getPopularMovies() method
  group('getPopularMovies', () {
    const int page = 1;

    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: movieListingsJson,
        requestOptions: RequestOptions(
          path: UrlConstants.popularMovies,
          queryParameters: {'page': page},
        ),
      );
    });

    test('should return a [MovieListingsModel()] when the call is successful', () async {
      // Arrange
      when(mockDioClient.get(UrlConstants.popularMovies, queryParameters: {'page': page})).thenAnswer(
        (_) async => response,
      );

      // Act
      final result = await actorRemoteDataSource.getPopularMovies(page: page);

      // Assert
      expect(result, isA<MovieListingsModel>());
      expect(result, equals(tMovieListingsModel));
    });

    test('should throw an [Exception()] when the call is unsuccessful', () async {
      // Arrange
      when(mockDioClient.get(UrlConstants.popularMovies, queryParameters: {'page': page})).thenThrow(Exception());

      // Act
      final call = actorRemoteDataSource.getPopularMovies;

      // Assert
      expect(call(page: page), throwsException);
    });
  });

  //* This is the test for the getTopRatedMovies() method
  group('getTopRatedMovies', () {
    const page = 1;
    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: movieListingsJson,
        requestOptions: RequestOptions(path: UrlConstants.topRatedMovies, queryParameters: {'page': page}),
      );
    });

    test('should return a [MovieListingsModel()] when the call is successful', () async {
      // Arrange
      when(mockDioClient.get(UrlConstants.topRatedMovies, queryParameters: {'page': page})).thenAnswer(
        (_) async => response,
      );

      // Act
      final result = await actorRemoteDataSource.getTopRatedMovies(page: page);

      // Assert
      expect(result, isA<MovieListingsModel>());
      expect(result, equals(tMovieListingsModel));
    });

    test('should throw an [Exception()] when the call is unsuccessful', () async {
      // Arrange
      when(mockDioClient.get(UrlConstants.topRatedMovies, queryParameters: {'page': page})).thenThrow(Exception());

      // Act
      final call = actorRemoteDataSource.getTopRatedMovies;

      // Assert
      expect(call(page: page), throwsException);
    });
  });

  group('getMovieCredits', () {
    const movieId = 1;
    final exception = Exception();
    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: movieCreditJson,
        requestOptions: RequestOptions(path: UrlConstants.movieCredits.replaceAll('{movie_id}', movieId.toString())),
      );
    });

    test('should return [MovieCreditModel()] when the call is successful', () async {
      // Arrange
      when(
        mockDioClient.get(
          UrlConstants.movieCredits.replaceAll(
            '{movie_id}',
            movieId.toString(),
          ),
        ),
      ).thenAnswer((_) async => response);

      // Act
      final result = await actorRemoteDataSource.getMovieCredits(movieId: movieId);

      // Assert
      expect(result, isA<MovieCreditModel>());
      expect(result, equals(tMovieCreditModel));
    });

    test('should throw an [Exception()] when the call is unsuccessful', () async {
      // Arrange
      when(
        mockDioClient.get(
          UrlConstants.movieCredits.replaceAll(
            '{movie_id}',
            movieId.toString(),
          ),
        ),
      ).thenThrow(exception);

      // Act
      final call = actorRemoteDataSource.getMovieCredits;

      // Assert
      expect(call(movieId: movieId), throwsException);
    });
  });
}
