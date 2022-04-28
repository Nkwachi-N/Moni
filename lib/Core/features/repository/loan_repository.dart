import 'dart:convert';

import 'package:moni/Core/features/loan/model/cluster.dart';
import 'package:http/http.dart' as http;
import 'package:moni/Core/routes/api_routes.dart';

class LoanRepository {
  final http.Client _client;

  LoanRepository(this._client);

  Future<Cluster?> getClusterAgents() async {

    try{
      final response = await _client.get(Uri.parse(ApiRoutes.clusterAgentUrl));

      if (response.statusCode == 200) {

        return Cluster.fromJson(
          jsonDecode(
            response.body,
          )['data'],
        );
      } else {
        throw Exception('Failed to load album');
      }

    }catch(e){
      rethrow;
    }



  }
}
