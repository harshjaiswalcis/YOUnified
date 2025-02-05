class SettingMutations {
  static const setPermissions = '''
      mutation UpdateSettings( \$input: NotificationInput!) {
        updateSettings(input: \$input)
      }
    ''';
}
