// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:graph_ql_sample/screen/home.dart' as _i3;
import 'package:graph_ql_sample/screen/home_country.dart' as _i2;
import 'package:graph_ql_sample/screen/home_product.dart' as _i1;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ScreenProductHome.name: (routeData) {
      final args = routeData.argsAs<ScreenProductHomeArgs>(
          orElse: () => const ScreenProductHomeArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ScreenProductHome(key: args.key),
      );
    },
    ScreenContinent.name: (routeData) {
      final args = routeData.argsAs<ScreenContinentArgs>(
          orElse: () => const ScreenContinentArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ScreenContinent(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ScreenProductHome]
class ScreenProductHome extends _i4.PageRouteInfo<ScreenProductHomeArgs> {
  ScreenProductHome({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ScreenProductHome.name,
          args: ScreenProductHomeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ScreenProductHome';

  static const _i4.PageInfo<ScreenProductHomeArgs> page =
      _i4.PageInfo<ScreenProductHomeArgs>(name);
}

class ScreenProductHomeArgs {
  const ScreenProductHomeArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'ScreenProductHomeArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.ScreenContinent]
class ScreenContinent extends _i4.PageRouteInfo<ScreenContinentArgs> {
  ScreenContinent({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ScreenContinent.name,
          args: ScreenContinentArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ScreenContinent';

  static const _i4.PageInfo<ScreenContinentArgs> page =
      _i4.PageInfo<ScreenContinentArgs>(name);
}

class ScreenContinentArgs {
  const ScreenContinentArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'ScreenContinentArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
