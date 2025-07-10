import 'package:floor/floor.dart';
import '../models/user.dart';

@Entity(tableName: 'teacherextends')
class TeacherExtends extends User {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @override
  final String name; // from User
  final String dni;

  TeacherExtends({
    this.id,
    required this.name,
    required this.dni,
  }) : super(name: name);

  @override
  String get userId => dni;
}
