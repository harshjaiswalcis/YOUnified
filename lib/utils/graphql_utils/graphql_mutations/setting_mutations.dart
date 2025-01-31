class SettingMutations {
  static const setPermissions = '''
      mutation UpdateSettings(\$updateSettingsId: ObjectID!, \$unionId: ObjectID!, \$input: NotificationInput!) {
          updateSettings(id: \$updateSettingsId, unionID: \$unionId, input:\$input)
        }
    ''';
}
