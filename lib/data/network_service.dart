import 'http_requests/delete.dart';
import 'http_requests/get.dart';
import 'http_requests/post.dart';
import 'http_requests/patch.dart';

class NetworkService {
  final Get getRequest = Get();
  final Post postRequest = Post();
  final Patch updateRequest = Patch();
  final Delete deleteRequest = Delete();
}
