import 'package:http_source/models/manga.dart' show StatusEnum;

extension StatusEnumExtension on StatusEnum {
  String get displayTitle {
    switch (this) {
      case StatusEnum.unknown:
        return 'Desconocido';
      case StatusEnum.ongoing:
        return 'Publicándose';
      case StatusEnum.completed:
        return 'Finalizado';
      case StatusEnum.cancelled:
        return 'Cancelado';
      default:
        return 'Desconocido';
    }
  }
}