import 'package:core_package/src/object_box/object_box.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class AuthDao {
  @Id(assignable: true)
  int? id = defaultId;
  final String? token;
  final String? refreshToken;

  AuthDao({this.token, this.refreshToken});
}
