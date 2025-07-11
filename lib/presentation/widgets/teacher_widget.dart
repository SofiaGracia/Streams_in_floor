import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TeacherWidget extends ConsumerWidget {
  final String name;
  final String dni;

  const TeacherWidget({super.key, required this.name, required this.dni});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(name),
      subtitle: Text(dni),
    );
  }
}
