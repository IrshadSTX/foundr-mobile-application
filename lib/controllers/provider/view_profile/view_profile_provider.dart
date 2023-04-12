import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foundr_project/model/api/connections/connection_resp_req_model.dart';
import 'package:foundr_project/model/api/connections/connection_update.dart';

import 'package:foundr_project/services/connection/connection_services.dart';
import 'package:foundr_project/views/widgets/snackbar_widget.dart';

import '../../../model/api/connections/connectin_req.dart';
import '../../../model/api/connections/get_connection_model.dart';

class ViewProfileProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  List<ConnectionRequest>? allConnectionReq;
  String? connectionCheck;
  List<Connection>? alltheConnection;
  int? listLength;
  /* -------------provider to get all connection request -----------*/

  Future<void> getallConnectionReq() async {
    String? token = await storage.read(key: 'token');
    await ConnectionServices().getConnectionReqService(token!).then((value) {
      allConnectionReq = value;
      notifyListeners();
    });
  }

  /* ----------fuction to set the button-----------*/

  Future buttonFunction(String profileId) async {
    await getallConnectionReq();
    for (ConnectionRequest value in allConnectionReq!) {
      if (allConnectionReq == null) {
        connectionCheck = null;
        connectionCheck = 'empty';
        notifyListeners();
      } else {
        if (profileId == value.receiver && value.status == 'pending') {
          //true means requested
          connectionCheck = null;
          connectionCheck = 'requested';
          notifyListeners();
          break;
        } else if (profileId == value.sender && value.status == 'pending') {
          //false means accept or reject
          connectionCheck = null;
          connectionCheck = 'acceptOrReject';
          notifyListeners();
          break;
        } else if (profileId == value.sender ||
            profileId == value.receiver && value.status == 'accepted') {
          connectionCheck = null;
          connectionCheck = 'message';
          notifyListeners();
          break;
        } else if (profileId != value.sender || profileId != value.receiver) {
          //no means no requestes just as null
          connectionCheck = null;
          connectionCheck = 'empty';
          notifyListeners();
          // break;
        }
      }
    }
    log(connectionCheck.toString(), name: 'connected');
  }

  /* -------------provider to send connection-----------*/
  Future<void> sendConnection(String id, BuildContext context) async {
    String? token = await storage.read(key: 'token');
    final sender = ConnectionReqModel(receiver: id);

    ConnectionServices().sendConnectionService(sender, token!).then(
          (value) => {
            if (value == true)
              {
                SnackbarPopUps.popUpG("Request Send Suceesfully", context),
              }
            else if (value == false)
              {
                SnackbarPopUps.popUpB("Something went wrong", context),
              }
          },
        );
  }

  /* -------------provider to update request-----------*/
  Future<void> updateConnectionProvider(
      String res, String profileId, BuildContext context) async {
    String? token = await storage.read(key: 'token');
    bool? response;
    String? message;
    if (res == 'true') {
      message = 'Request accepted, Send a message now!';
      response = true;
    } else if (res == 'false') {
      message = 'Request rejected, They missed the opportunity!';
      response = false;
    }
    log(message.toString(), name: 'message');
    log(response.toString(), name: 'response');

    final update = ConnectionUpdateModel(
        reqFrom: profileId,
        type: 'response',
        response: response,
        message: message);
    ConnectionServices()
        .updateConnectionService(update, token!)
        .then((value) => {
              if (value == true)
                {SnackbarPopUps.popUpG("Connection made successfully", context)}
              else
                {SnackbarPopUps.popUpB("connection rejected", context)}
            });

    notifyListeners();
  }

  /* -------------provider to get all connections-----------*/
  Future<void> getalltheConnections() async {
    String? token = await storage.read(key: 'token');
    ConnectionServices().getAllConnectionService(token!).then((value) => {
          alltheConnection = value,
          listLength = alltheConnection!.length,
          notifyListeners(),
        });
  }
}
