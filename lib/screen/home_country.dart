import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../graphql/graphql_string.dart';

@RoutePage()
class ScreenContinent extends StatelessWidget {
  ScreenContinent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(readRepositoriesCountry),
          variables: const {
            "code": "AS",
          },
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

          final continent = result.data?['continent']?['countries'];
          // log(continent.toString());

          if (continent == null) {
            return const Center(child: Text('Data not found!'));
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              var country = continent[index];
              return ListTile(
                title: Text(country['name'] ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(country['code'] ?? ''),
                    Text(country['capital'] ?? ''),
                    Text(country['languages'][0]['name'] ?? ''),
                    // Text(country['states'][index]['name'])
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: continent.length,
          );
        },
      ),
    );
  }
}
