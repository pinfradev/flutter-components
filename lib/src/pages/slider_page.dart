import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      label: 'Tamaño de la imagen',
      // divisions: 20,
      activeColor: Colors.indigoAccent,
      value: _valorSlider,
      max: 400,
      min: 10,
      onChanged: _bloquearCheck
          ? null
          : (valor) {
              print(valor);
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Image _crearImagen() {
    return Image(
        fit: BoxFit.contain,
        width: _valorSlider,
        image: NetworkImage(
            'https://key0.cc/images/preview/90089_ab971a2d32bbd71cd859f70584ff74ea.png'));
  }

  Widget _checkbox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (value) {
    //       setState(() {
    //         _bloquearCheck = value;
    //       });
    //     });
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearCheck,
        onChanged: (value) {
          setState(() {
            _bloquearCheck = value;
          });
        });
  }
}
