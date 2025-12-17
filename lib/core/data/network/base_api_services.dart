abstract class BaseApiServices {
  Future<dynamic> getApi(String url, {dynamic data, int limit});
  Future<dynamic> postApi(String url, dynamic data, {int limit});
  Future<dynamic> multiPartPostApi(String url, Map<String, dynamic> data);
  Future<dynamic> patchApi(String url, dynamic data);
  Future<dynamic> deleteApi(String url, dynamic data);
}
