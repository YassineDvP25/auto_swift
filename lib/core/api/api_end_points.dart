class ApiEndPoints {
  static String baseUrl = 'http://192.168.1.22:9090/auto_car/';
  static String signIn = 'auth/login.php';
  static String signUp = 'auth/signup.php';
  static String addCar = 'admin/products/add.php';
  static String deleteCar = 'admin/products/delete.php';
  static String getCar = 'admin/products/view.php';
}

class ApiKeys {
  static String status = 'status';
  static String message = 'message';
  static String userName = "username";
  static String email = 'useremail';
  static String phone = 'userphone';
  static String password = 'userpassword';
  static String profilePicture = 'userprofilepicture';

  static String token = 'token';
  static String id = 'user_id';

  static String carModel = 'carmodel';
  static String carEngin = 'carengin';
  static String carSpeed = 'carspeed';
  static String carSeats = 'carseats';
  static String carBrand = 'carbrand';
  static String carPrice = 'carprice';
  static String carImage = 'carimage';
}
