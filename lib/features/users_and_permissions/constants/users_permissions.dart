class UsersPermissions {
  // Users permissions
  static const String view = 'users.view';
  static const String create = 'users.create';
  static const String edit = 'users.edit';
  static const String delete = 'users.delete';

  // Roles permissions
  static const String rolesView = 'roles.view';
  static const String rolesCreate = 'roles.create';
  static const String rolesEdit = 'roles.edit';
  static const String rolesDelete = 'roles.delete';

  // All users permissions
  static const List<String> all = [
    view,
    create,
    edit,
    delete,
    rolesView,
    rolesCreate,
    rolesEdit,
    rolesDelete,
  ];
}

