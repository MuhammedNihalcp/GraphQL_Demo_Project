import 'package:graph_ql_sample/graphql/graphql_string.dart';
import 'package:graph_ql_sample/model/country_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryService {
  Future<List<Continent>?> getCountries() async {
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
      ),
    );

    final countryresult = queryResult.data?['continent']?['countries'];
    return countryresult ?? [];
  }
}
