import 'package:flutter/material.dart';

/*
Este archivo no se va a usar es temporal para aprender listView
 */
class HomePageTemp extends StatelessWidget {
  final List<String> opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  // List<Widget> _crearItems() {
  //   List<Widget> lista = [];

  //   for (String opt in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     lista..add(tempWidget)..add(Divider());
  //   }

  //   return lista;
  // }

  List<Widget> _crearItemsCorta() {
    var widgets = opciones.map((opt) => Column(
          children: [
            ListTile(
              title: Text(opt + '!'),
              subtitle: Text('Cualquier cosa'),
              leading: Icon(Icons.accessibility_sharp),
              trailing: Icon(
                Icons.stairs,
                color: Colors.pink.shade300,
              ),
            ),
            Divider()
          ],
        ));

    return widgets.toList();
  }
}
