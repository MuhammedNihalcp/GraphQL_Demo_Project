import 'dart:developer';

import 'package:graph_ql_sample/graphql/graphql_string.dart';
import 'package:graph_ql_sample/model/product_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductService {
  Future<List<Edges>?> getProduct() async {
    try {
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
    }on GraphQLError catch (e) {
      log(e.message);
    }

    return null;
  }
}
