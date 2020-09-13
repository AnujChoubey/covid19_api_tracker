import 'package:flutter/foundation.dart';
import 'api_keys.dart';

enum Endpoint {
  cases,
  todayCases,
  active,
  deaths,
  recovered,
  totalTests,
}

class API {
  API({@required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.nCovSandboxKey);
  static final String host = 'apigw.nubentos.com';
  static final int port = 443;
  static final String basePath = '443/t/nubentos.com/ncovapi/2.0.0';

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': 'client_credentials'},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        port: port,        
        //**important- this is the format(syntax)*/
        path: '$basePath/${_paths[endpoint]}',
      );

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.todayCases: 'todayCases',
    Endpoint.active: 'active',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
    Endpoint.totalTests: 'totalTests',
  };
}
