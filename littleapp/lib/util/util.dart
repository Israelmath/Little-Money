String integerPart(double? valor) {
  String numeroCompleto = valor!.toStringAsFixed(2);
  return numeroCompleto.substring(0, numeroCompleto.length - 3);
}

String decimalPart(double? valor) {
  String numeroCompleto = valor!.toStringAsFixed(2);
  return numeroCompleto.substring(numeroCompleto.length - 2);
}

String tempoRestante(DateTime horaFinal) {
  DateTime agora = DateTime.now();
  int faltaMinutos = horaFinal.difference(agora).inMinutes;
  int faltaHoras = horaFinal.difference(agora).inHours;

  if (faltaMinutos < 0) return '0 minutos';
  if (faltaHoras != 0) faltaMinutos = faltaMinutos - 60 * faltaHoras;

  return "$faltaHoras horas e \n$faltaMinutos minutos";
}