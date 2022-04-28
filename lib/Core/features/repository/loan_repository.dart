import 'package:moni/Core/features/loan/model/cluster.dart';
import 'package:http/http.dart' as http;

class LoanRepository{

  final http.Client client;

  LoanRepository(this.client);


  Future<List<Cluster>> getClusterAgents() async{

  }
}