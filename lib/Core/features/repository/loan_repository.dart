import 'dart:convert';

import 'package:moni/Core/features/loan/model/cluster.dart';
import 'package:http/http.dart' as http;
import 'package:moni/Core/routes/api_routes.dart';

class LoanRepository {
  final http.Client client;

  LoanRepository(this.client);

  Future<Cluster> getClusterAgents() async {
    final response = await client.get(Uri.parse(ApiRoutes.clusterAgentUrl));

    if (response.statusCode == 200) {

      return Cluster.fromJson(
        jsonDecode(
          response.body,
        ),
      );
    } else {
      throw Exception('Failed to load album');
    }
  }
}
