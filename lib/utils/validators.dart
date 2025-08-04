String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Preencha o nome';
  }
  return null;
}

String? validateFutureDate(DateTime? date) {
  if (date == null) {
    return 'Selecione uma data';
  }
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  if (date.isBefore(today)) {
    return 'A data deve ser futura';
  }
  return null;
}

bool isValidDate(DateTime? date) {
  return validateFutureDate(date) == null;
}
