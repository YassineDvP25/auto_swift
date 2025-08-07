abstract class ApiConsumer {
  Future<dynamic> post(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> get(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> update(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
  Future<dynamic> delete(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  });
}
