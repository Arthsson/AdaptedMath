import 'package:flutter/material.dart';

class TimePickerField extends StatelessWidget {
  final String labelText;
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const TimePickerField({
    Key? key,
    required this.labelText,
    required this.initialTime,
    required this.onTimeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: initialTime,
            );
            if (pickedTime != null) {
              onTimeChanged(pickedTime);
            }
          },
          child: Row(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 8),
              Text(initialTime.format(context)),
            ],
          ),
        ),
      ],
    );
  }
}