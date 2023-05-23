import 'dart:developer';

import 'package:graph_ql_sample/graphql/graphql_string.dart';
import 'package:graph_ql_sample/model/country_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryService {
  Future<List<Countries>?> getCountries() async {
    try {
      final HttpLink countryLink =
          HttpLink('https://countries.trevorblades.com/');
      GraphQLClient graphQLClient = GraphQLClient(
        link: countryLink,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      );

      QueryResult queryResult = await graphQLClient.query(
        QueryOptions(
            fetchPolicy: FetchPolicy.networkOnly,
            document: gql(readRepositoriesProduct),
            variables: const {"code": "AS"}),
      );
      if (queryResult.hasException) {
        log(queryResult.exception.toString());
      }

      final countryresult = queryResult.data?['continent']?['countries'];
      return countryresult ?? [];
    } on GraphQLError catch (e) {
      log(e.message);
    }
    return null;
  }
}
