import 'package:arqutitetura_smart/domain/entities/entities.dart';
import 'package:meta/meta.dart';

class UsuarioModel extends Usuario {
  final int id;

  final String nome;

  UsuarioModel({
    @required this.id,
    @required this.nome,
  });
}
