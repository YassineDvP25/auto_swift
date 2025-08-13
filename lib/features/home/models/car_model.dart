class CarModel {
  int? carId;
  String? carModel;
  String? carEngin;
  String? carSpeed;
  String? carSeats;
  String? carBrand;
  String? carImage;
  String? carPrice;
  int? carBr;

  CarModel(
      {this.carId,
      this.carModel,
      this.carEngin,
      this.carSpeed,
      this.carSeats,
      this.carBrand,
      this.carImage,
      this.carPrice,
      this.carBr});

  CarModel.fromJson(Map<String, dynamic> json) {
    carId = json['car_id'];
    carModel = json['car_model'];
    carEngin = json['car_engin'];
    carSpeed = json['car_speed'];
    carSeats = json['car_seats'];
    carBrand = json['car_brand'];
    carImage = json['car_image'];
    carPrice = json['car_price'];
    carBr = json['car_br'];
  }
  }