class StoreModel {
  String? uid;
  String? name;
  String? description;
  String? address;
  String? logo;
  bool? isActive;
  String? createdAt;

  StoreModel(
      {this.uid,
        this.name,
        this.description,
        this.address,
        this.logo,
        this.isActive,
        this.createdAt});

  StoreModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    logo = json['logo'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    return data;
  }
}
