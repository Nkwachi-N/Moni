import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:moni/Core/features/loan/model/cluster.dart';
import 'package:moni/Core/features/repository/loan_repository.dart';
import 'package:moni/Core/utils/network_state.dart';
import 'package:http/http.dart' as http;

class LoanProvider extends ChangeNotifier{
  late LoanRepository _loanRepository;
  NetworkState networkSate = NetworkState.idle;
  Cluster? cluster;



  LoanProvider(http.Client client){
    _loanRepository = LoanRepository(client);
  }


  Future<void> getCluster() async {
    networkSate = NetworkState.loading;

    try{
      cluster = await _loanRepository.getClusterAgents();
      networkSate = NetworkState.idle;
    }catch(e) {
      if(e is SocketException) {
        networkSate = NetworkState.noInternet;
      }else{
        networkSate = NetworkState.failed;
      }
    }
    notifyListeners();
  }



}