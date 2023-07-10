class AccessibilitySettings {
  bool voiceCommandEnabled;
  bool textToSpeechEnabled;
  bool colorBlindModeEnabled;
  double fontSize;

  AccessibilitySettings({
    this.voiceCommandEnabled = false,
    this.textToSpeechEnabled = false,
    this.colorBlindModeEnabled = false,
    this.fontSize = 20.0,
  });
}
