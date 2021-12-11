import 'package:componentes/src/pages/listView_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/card_page.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return {
    '/': (context) => HomePage(),
    "alert": (context) {
      return AlertPage();
    },
    AvatarPage.pageName: (context) {
      return AvatarPage();
    },
    'card': (context) => CardPage(),
    'animatedContainer': (context) => AnimatedContainerPage(),
    'inputs': (context) => InputPage(),
    'sliders': (context) => SliderPage(),
    'list': (context) => ListaPage()
  };
}
