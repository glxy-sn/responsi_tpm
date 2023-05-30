import 'base_network.dart';

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();
  //kalo tipe data pakek [] makek list dynamic
  //kalo tipe data pakek {} makek map dynamic
  Future<List<dynamic>> loadPertandingan() {
    return BaseNetwork.getList("matches");
  }

  Future<Map<String, dynamic>> loadDetail(String id){
    return BaseNetwork.get("matches/$id");
  }
}