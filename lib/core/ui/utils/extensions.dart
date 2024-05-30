extension RouteParamsExtension on String {
  String addQueryParams([Map<String, dynamic>? queryParameters]) => Uri(
        path: this,
        queryParameters: queryParameters?.map(
          (key, value) => MapEntry(key, value?.toString()),
        ),
      ).toString();
}




