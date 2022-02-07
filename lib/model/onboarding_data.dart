class OnboardingData {
  String? image;
  String? heading;
  String? description;

  OnboardingData({this.image, this.heading, this.description});

  OnboardingData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    heading = json['heading'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['heading'] = heading;
    data['description'] = description;
    return data;
  }
}
