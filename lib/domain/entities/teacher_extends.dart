import 'package:floor/floor.dart';
import '../models/user.dart';

@Entity(tableName: 'teacherextends')
class TeacherExtends extends User {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String dni;

  TeacherExtends({
    this.id,
    required super.name,
    required this.dni,
  });

  @override
  String get userId => dni;
}
