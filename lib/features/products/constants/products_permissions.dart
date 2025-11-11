class ProductsPermissions {
  // Products permissions
  static const String view = 'products.view';
  static const String create = 'products.create';
  static const String edit = 'products.edit';
  static const String delete = 'products.delete';

  // Product categories permissions
  static const String categoryView = 'product-categories.view';
  static const String categoryCreate = 'product-categories.create';
  static const String categoryEdit = 'product-categories.edit';
  static const String categoryDelete = 'product-categories.delete';

  // All products permissions
  static const List<String> all = [
    view,
    create,
    edit,
    delete,
    categoryView,
    categoryCreate,
    categoryEdit,
    categoryDelete,
  ];
}

