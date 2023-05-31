// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graph_ql_sample/graphql/graphql_string.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

@RoutePage()
class ScreenProductHome extends StatelessWidget {
  ScreenProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(readRepositoriesProduct),
          pollInterval: const Duration(seconds: 5),
        ),
        builder: (
          QueryResult result, {
          VoidCallback? refetch,
          FetchMore? fetchMore,
        }) {
          if (result.hasException) {
            return Center(child: Text(result.exception.toString()));
          }
          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = result.data?['products']['edges'];
          // log(products.toString());

          if (products == null) {
            return const Center(child: Text('Data not found!'));
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              var productsItems = products[index]['node'];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(productsItems['thumbnail']['url']),
                ),
                title: Text(productsItems['name'] ?? ''),
                subtitle: Text(productsItems['description'] ?? ''),
                trailing: Text(productsItems['productType'][index]['name']),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: products.length,
          );
        },
      ),
    );
  }
}
