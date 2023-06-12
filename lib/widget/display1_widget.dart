import 'package:exemplo_stream/auxiliar/data_hora_controller.dart';
import 'package:exemplo_stream/modelo/data_hora.dart';
import 'package:flutter/material.dart';

///Exemplo de atualização usando StreamBuilder
class Display1Widget extends StatefulWidget {
  final DataHoraController controller;
  const Display1Widget({
    super.key,
    required this.controller,
  });

  @override
  State<Display1Widget> createState() => _Display1WidgetState();
}

class _Display1WidgetState extends State<Display1Widget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataHora>(
        stream: widget.controller.tempoStream,
        builder: (context, snapshot) {
          final dataHora = snapshot.data;
          final data = dataHora?.data ?? '------';
          final hora = dataHora?.hora ?? '------';

          return Container(
            color: Colors.blueAccent,
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Data: $data',
                  style: const TextStyle(fontSize: 30.0),
                ),
                Text(
                  'Hora: $hora',
                  style: const TextStyle(fontSize: 60.0),
                ),
              ],
            ),
          );
        });
  }
}
