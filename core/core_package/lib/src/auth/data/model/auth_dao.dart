import 'package:core_package/objectbox.g.dart';
import 'package:core_package/src/object_box/object_box.dart';

@Entity()
class AuthDao {
  @Id()
  int? id = defaultId;
  final String? token;
  final String? refreshToken;

  AuthDao({this.token, this.refreshToken});
}
