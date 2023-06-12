import 'package:exemplo_stream/modelo/data_hora.dart';
import 'package:intl/intl.dart';

class TratarDataHora {
  late final _dateFormat = DateFormat('dd/MM/yyyy');
  late final _timeFormat = DateFormat('HH:mm:ss');

  DataHora get dataHora {
    final agora = DateTime.now();

    return DataHora(
      data: _dateFormat.format(agora),
      hora: _timeFormat.format(agora),
    );
  }
}
