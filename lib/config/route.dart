import 'package:flutter/cupertino.dart';
import 'package:myapp/pages/page.dart';

class Route {
  static const home = '/home';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const management = '/management';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    home: (context) => Home(),
    management: (context) => ManagementPage(),
  };
}
