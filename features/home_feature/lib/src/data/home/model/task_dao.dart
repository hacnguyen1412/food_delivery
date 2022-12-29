import 'package:core_dependency/core_dependency.dart';

@Entity()
class TaskDao {
  @Id(assignable: true)
  int? id;
  String? name;
  String? avatar;
  String? createdAt;
}
