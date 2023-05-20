import 'package:graph_ql_sample/graphql/graphql_string.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductService {
  Future<List?> getProduct() async {
    final HttpLink productlink = HttpLink('https://demo.saleor.io/graphql/');
    GraphQLClient graphQLClient = GraphQLClient(
      link: productlink,
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
    final products = queryResult.data?['products']['edges'];
    return products ?? [];
  }
}
