import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: [_crearListas(), _crearLoading()],
        ));
  }

  Widget _crearListas() {
    return RefreshIndicator(
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (context, index) {
            final imageId = _listaNumeros[index];

            return FadeInImage(
                fit: BoxFit.cover,
                height: 300,
                placeholder: AssetImage('assets/jar-loading.gif'),
                image:
                    NetworkImage('https://picsum.photos/id/$imageId/500/300'));
          }),
      onRefresh: _obtenerPagina1,
    );
  }

  Future<Null> _obtenerPagina1() {
    final duration = Duration(seconds: 2);
    return Future.delayed(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
  }
  //   Timer(duration, () {
  //     _listaNumeros.clear();
  //     _ultimoItem++;
  //     _agregar10();
  //     return null;
  //   });
  // }

  void _agregar10() {
    for (int i = 1; i <= 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  void fetchData() async {
    final duration = Duration(seconds: 3);
    _isLoading = true;
    setState(() {
      //como cambio is loading si tengo un widget dentro de if _isLoading se muestra como un loader
    });

    Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;

    _agregar10();
    _scrollController.animateTo(_scrollController.position.pixels + 100.0,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(child: CircularProgressIndicator()),
            SizedBox(
              height: 15.0,
            )
          ]);
    } else {
      return SizedBox();
    }
  }
}
