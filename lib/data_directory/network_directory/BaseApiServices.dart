//Abstract class: is a restricted class that cannot be used to create objects
// (to access it, it must be inherited from another class).
// Abstract method: can only be used in an abstract class,
// and it does not have a body.

abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
