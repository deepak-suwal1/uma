import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:uhuru/config/routes/app_router.dart';
import 'package:uhuru/core/network/dio_client.dart';

@module
abstract class RegisterModule {
  @singleton
  DioClient get dioClient => DioClient();

  @singleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  @singleton
  AppRouter get appRouter => AppRouter();

  GraphQLClient get client => setupGraphql();
}

GraphQLClient setupGraphql() {
  final HttpLink httpLink = HttpLink('http://192.168.101.3:3000/shop-api');

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer uhuru',
  );

  final Link link = authLink.concat(httpLink);

  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(store: HiveStore()),
    link: link,
  );
  return client;
}
