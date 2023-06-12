import 'package:exemplo_stream/auxiliar/data_hora_controller.dart';
import 'package:flutter/material.dart';

///Exemplo de atualização usando ValueListenableBuilder
class Display2Widget extends StatefulWidget {
  final DataHoraController controller;
  const Display2Widget({
    super.key,
    required this.controller,
  });

  @override
  State<Display2Widget> createState() => _Display2WidgetState();
}

class _Display2WidgetState extends State<Display2Widget> {
  final _dataNotifier = ValueNotifier<String>("------");
  final _horaNotifier = ValueNotifier<String>("------");

  @override
  void initState() {
    widget.controller.tempoStream.listen((dataHora) {
      _dataNotifier.value = dataHora.data;
      _horaNotifier.value = dataHora.hora;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder(
            valueListenable: _dataNotifier,
            builder: (context, data, child) {
              return Text(
                'Data: $data',
                style: const TextStyle(fontSize: 30.0),
              );
            },
          ),
          ValueListenableBuilder(
              valueListenable: _horaNotifier,
              builder: (context, hora, child) {
                return Text(
                  'Hora: $hora',
                  style: const TextStyle(fontSize: 60.0),
                );
              }),
        ],
      ),
    );
  }
}
