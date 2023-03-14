import 'package:flutter/material.dart';
import 'package:test_mobile/app/ui/pages/boarding_page/view.dart';
import 'package:test_mobile/app/ui/pages/create_page/view.dart';
import 'package:test_mobile/app/ui/pages/pages.dart';
import 'package:test_mobile/app/ui/pages/read_page/view.dart';
import 'package:test_mobile/app/ui/pages/update_page/view.dart';

class Router {
  RouteObserver<PageRoute>? routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Pages.user:
      //   return UnanimatedPageRoute(
      //     builder: (context) => UserPage(
      //       arguments: settings.arguments,
      //     ),
      //   );
      case Pages.boarding:
        return _buildRoute(settings, const BoardingPage());
      case Pages.readpage:
        return _buildRoute(settings, const ReadPage());
      case Pages.createpage:
        return _buildRoute(settings, const CreatePage());
      case Pages.details:
        return _buildRoute(
          settings,
          UpdatePage(
            id: settings.arguments.toString(),
          ),
        );
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}

class UnanimatedPageRoute<T> extends MaterialPageRoute<T> {
  UnanimatedPageRoute({
    required Widget Function(BuildContext) builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
