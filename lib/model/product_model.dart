class ProductModel {
  List<Edges> edges;
  ProductModel({required this.edges});
}

class Edges {
  Node node;

  Edges({required this.node});
}

class Node {
  final String id;
  final String name;
  final String description;
  final ProductType productType;
  final Thambanail thambanail;

  Node({
    required this.id,
    required this.name,
    required this.description,
    required this.productType,
    required this.thambanail,
  });
}

class ProductType {
  final String name;

  ProductType({required this.name});
}

class Thambanail {
  final String url;

  Thambanail({required this.url});
}
