class Category {
  int id;
  String name;
  String description;
  Category? parentCategory;
  int clientId;

  Category({required this.id, required this.name, required this.description, this.parentCategory, required this.clientId});
}