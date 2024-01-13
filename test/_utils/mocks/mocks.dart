import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/data/datasources/export_datasources.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/actor/actor_repository.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/movie/movie_repository.dart';
import 'package:flutter_clean_architecture/src/domain/usecases/export_usecases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DioClient,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  ActorRemoteDataSource,
  MovieRepository,
  ActorRepository,
  MovieUsecases,
  ActorUsecases,
])
void main() {}
