import 'package:flutter/material.dart';
import '../models/reminder.dart';

class ReminderList extends StatelessWidget {
  final List<Reminder> reminders;
  final void Function(Reminder reminder) onDelete;

  const ReminderList({
    super.key,
    required this.reminders,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (reminders.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text(
            'Nenhum lembrete criado',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    // Group Reminders by Date
    final Map<String, List<Reminder>> groupedReminders = {};
    for (final reminder in reminders) {
      final dateKey =
          '${reminder.date.day}/${reminder.date.month}/${reminder.date.year}';
      if (!groupedReminders.containsKey(dateKey)) {
        groupedReminders[dateKey] = [];
      }
      groupedReminders[dateKey]!.add(reminder);
    }

    // Order Dates
    final sortedDates = groupedReminders.keys.toList()
      ..sort((a, b) {
        final dateA = groupedReminders[a]!.first.date;
        final dateB = groupedReminders[b]!.first.date;
        return dateA.compareTo(dateB);
      });

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lista de lembretes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: sortedDates.length,
            itemBuilder: (context, index) {
              final dateKey = sortedDates[index];
              final dayReminders = groupedReminders[dateKey]!;

              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Header
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          dateKey,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple.shade700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Reminders List
                      ...dayReminders.map(
                        (reminder) => Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Reminder Icon
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade100,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  Icons.event_note,
                                  color: Colors.deepPurple.shade700,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Reminder Name
                              Expanded(
                                child: Text(
                                  reminder.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              // Reminder Delete Button
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.red.shade600,
                                    size: 20,
                                  ),
                                  onPressed: () => onDelete(reminder),
                                  constraints: const BoxConstraints(
                                    minWidth: 36,
                                    minHeight: 36,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
