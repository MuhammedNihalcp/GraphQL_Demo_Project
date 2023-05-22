class ProductModel {
  Edges edges;
  ProductModel({required this.edges});
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        edges: Edges.fromJson(json),
      );
}

class Edges {
  List<Node> node;

  Edges({required this.node});
  factory Edges.fromJson(Map<String, dynamic> json) => Edges(
          node: List<Node>.from(
        json['node'].map(
          (e) => Node.fromJson(json),
        ),
      ));
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

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        productType: ProductType.fromJson(json),
        thambanail: Thambanail.fromJson(json),
      );
}

class ProductType {
  final String name;

  ProductType({required this.name});
  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        name: json['name'],
      );
}

class Thambanail {
  final String url;

  Thambanail({required this.url});

  factory Thambanail.fromJson(Map<String, dynamic> json) => Thambanail(
        url: json['url'],
      );
}
