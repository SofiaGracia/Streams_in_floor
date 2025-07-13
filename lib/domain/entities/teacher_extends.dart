import 'package:floor/floor.dart';
import '../models/user.dart';

@Entity(tableName: 'teacherextends')
class TeacherExtends extends User {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  @override
  final String name;

  final String dni;

  TeacherExtends({
    this.id,
    required this.name,
    required this.dni,
  });

  @override
  String get userId => dni;
}
