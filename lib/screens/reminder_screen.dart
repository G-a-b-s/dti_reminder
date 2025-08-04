import 'package:flutter/material.dart';
import '../models/reminder.dart';
import '../widgets/reminder_form.dart';
import '../widgets/reminder_list.dart';
import '../utils/dialogs.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final List<Reminder> _reminders = [];

  void _addReminder(Reminder reminder) {
    setState(() {
      _reminders.add(reminder);
    });
  }

  void _deleteReminder(Reminder reminder) async {
    final confirmed = await showConfirmationDialog(
      context: context,
      title: 'Deletar lembrete',
      message: 'Tem certeza que deseja deletar o lembrete "${reminder.name}"?',
      confirmText: 'Deletar',
      cancelText: 'Cancelar',
      confirmColor: Colors.red,
      icon: Icons.delete_outline,
    );

    if (confirmed == true) {
      setState(() {
        _reminders.remove(reminder);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lembretes'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReminderForm(onCreate: _addReminder),
            if (_reminders.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: ReminderList(
                  reminders: _reminders,
                  onDelete: _deleteReminder,
                ),
              ),
            ] else ...[
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Nenhum lembrete criado ainda.\nCrie seu primeiro lembrete acima!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
