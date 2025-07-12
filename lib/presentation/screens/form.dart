import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/domain/entities/teacher.dart';
import 'package:streams_in_floor/presentation/providers/teacher/teacher_repository.dart';

import '../widgets/save_form_button.dart';

class FormScreen extends ConsumerStatefulWidget {
  //We may need a onCreate

  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController dniController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    dniController = TextEditingController();
    nameController = TextEditingController();
  }

  Future<void> _saveNewTeacher() async {
    final newTeacher = Teacher(
      name: nameController.text.trim(),
      dni: dniController.text.trim(),
    );

    final repo = ref.read(teacherRepositoryProvider);
    await repo.addTeacher(newTeacher);

    if (mounted) Navigator.pop(context);
  }

  String? _notEmptyValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return TextFormField(
      controller: controller,
      validator: _notEmptyValidator,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new teacher'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                    controller: dniController,
                    label: 'ID or DNI',
                    icon: Icons.perm_identity_outlined),
                const SizedBox(height: 12),
                _buildTextField(
                    controller: nameController,
                    label: 'Name',
                    icon: Icons.person_outline),
                const SizedBox(height: 12),
                //Save teacher button
                SaveTeacherButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _saveNewTeacher();
                    }
                  },
                  text: 'Save',
                )
              ],
            )),
      ),
    );
  }
}
