import '../domain/entities/entities.dart';
import 'models/models.dart';

extension ConversaoLogin on LoginModel {
  Login get converta => Login(usuario: this.usuario.converta, token: token);
}

extension ConversaoUsuario on UsuarioModel {
  Usuario get converta => Usuario(nome: this.nome, id: this.id);
}
