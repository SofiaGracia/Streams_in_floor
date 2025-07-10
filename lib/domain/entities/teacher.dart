import 'package:floor/floor.dart';

@Entity(tableName: 'teacher')
class Teacher {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String dni;

  Teacher({
    this.id,
    required this.name,
    required this.dni,
  });
}
