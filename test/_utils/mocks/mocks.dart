import 'package:flutter_clean_architecture/src/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/src/data/datasources/export_datasources.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DioClient,
  MovieRemoteDataSource,
  ActorRemoteDataSource,
])
void main() {}
