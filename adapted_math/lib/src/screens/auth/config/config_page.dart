import 'package:adapted_math/src/screens/auth/config/utils/time_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/utils/app_confing.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  bool dailyNotifications = false;
  bool dailyMissions = false;
  bool vibration = false;
  TimeOfDay notificationTime = const TimeOfDay(hour: 12, minute: 0);
  TimeOfDay missionTime = const TimeOfDay(hour: 12, minute: 0);

  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: TextStyle(fontSize: appSettings.fontSize),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_medium),
            onPressed: () {
              appSettings.toggleTheme();
            },
          ),
        ],
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tamanho da Fonte:',
                style: TextStyle(fontSize: appSettings.fontSize),
              ),
              Slider(
                value: appSettings.fontSize,
                min: 30.0,
                max: 40.0,
                onChanged: (value) {
                  appSettings.setFontSize(value);
                },
              ),
              const SizedBox(height: 24.0),
              Text(
                'Notificações:',
                style: TextStyle(fontSize: appSettings.fontSize),
              ),
              Row(
                children: [
                  ToggleButtons(
                    onPressed: (index) {
                      setState(() {
                        dailyNotifications = !dailyNotifications;
                      });
                    },
                    isSelected: [dailyNotifications],
                    children: const [Icon(Icons.notifications)],
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notificações diárias',
                        style: TextStyle(fontSize: appSettings.fontSize - 15),
                      ),
                      dailyNotifications
                          ? TimePickerField(
                              labelText: 'Horário da Notificação',
                              initialTime: notificationTime,
                              onTimeChanged: (time) {
                                setState(() {
                                  notificationTime = time;
                                });
                              },
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  ToggleButtons(
                    onPressed: (index) {
                      setState(() {
                        dailyMissions = !dailyMissions;
                      });
                    },
                    isSelected: [dailyMissions],
                    children: const [Icon(Icons.assignment)],
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Missões diárias',
                        style: TextStyle(fontSize: appSettings.fontSize - 15),
                      ),
                      dailyMissions
                          ? TimePickerField(
                              labelText: 'Horário da Missão',
                              initialTime: missionTime,
                              onTimeChanged: (time) {
                                setState(() {
                                  missionTime = time;
                                });
                              },
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
              Text(
                'Vibração:',
                style: TextStyle(fontSize: appSettings.fontSize),
              ),
              Row(
                children: [
                  ToggleButtons(
                    onPressed: (index) {
                      setState(() {
                        vibration = !vibration;
                      });
                    },
                    isSelected: [vibration],
                    children: const [Icon(Icons.vibration)],
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Feedback para Respostas Incorretas',
                        style: TextStyle(fontSize: appSettings.fontSize - 15),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

