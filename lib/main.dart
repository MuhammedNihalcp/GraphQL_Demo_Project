import 'package:flutter/material.dart';
import 'package:graph_ql_sample/router/app_router.dart';
import 'package:graph_ql_sample/screen/home_country.dart';
import 'package:graph_ql_sample/screen/home_product.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpLink link = HttpLink('https://countries.trevorblades.com/');
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
    return GraphQLProvider(
      client: client,
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ScreenContinent(),
      ),
    );
  }
}
