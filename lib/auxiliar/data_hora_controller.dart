import 'dart:async';

import 'package:exemplo_stream/auxiliar/tratar_data_hora.dart';
import 'package:exemplo_stream/modelo/data_hora.dart';

class DataHoraController {
  final _tempoController = StreamController<DataHora>.broadcast();
  final _ativoController = StreamController<bool>.broadcast();

  Stream<DataHora> get tempoStream => _tempoController.stream;
  Stream<bool> get ativoStream => _ativoController.stream;

  final tratarDataHora = TratarDataHora();

  Timer? _timer;

  void ativar() {
    _ativoController.sink.add(true);
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      final dataHora = tratarDataHora.dataHora;
      _tempoController.sink.add(dataHora);
    });
  }

  void desativar() {
    _ativoController.sink.add(false);
    _timer?.cancel();
    _timer = null;
  }
}
