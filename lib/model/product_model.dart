class ProductModel {
    ProductModel({
        this.id,
        this.name,
        this.market,
        this.cost,
        this.howmuch,
        this.details,
        this.timeDelivery,
        this.category,
        this.imageUrl,
    });

    int? id;
    String? name;
    String? market;
    double? cost;
    int? howmuch;
    String? details;
    String? timeDelivery;
    String? category;
    String? imageUrl;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        market: json["market"],
        cost: json["cost"].toDouble(),
        howmuch: json["howmuch"],
        details: json["details"],
        timeDelivery: json["time_delivery"],
        category: json["category"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "market": market,
        "cost": cost,
        "howmuch": howmuch,
        "details": details,
        "time_delivery": timeDelivery,
        "category": category,
        "image_url": imageUrl,
    };
}
