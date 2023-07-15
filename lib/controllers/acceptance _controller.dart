import 'package:get/get.dart';
import 'package:warehouse_project/controllers/notification_controller.dart';
import 'package:warehouse_project/model/acceptance_model.dart';
import 'package:warehouse_project/model/notification_product.dart';
import 'package:warehouse_project/services/log_service.dart';
import 'package:warehouse_project/services/network_service.dart';

class AcceptanceController extends GetxController{


 // late final bool accept;
 // int? accept;
 //
 //  upDataValue({required bool acc, required int id}){
 //    accept = acc;
 //  }

  void acceptanceUpload(bool value,int id) async{
    try{

      var acceptance = AcceptanceModel(
        transaction_id:id,
        acceptanceOrRejection: value,

      );
      LogService.i("${acceptance.transaction_id}  ${acceptance.acceptanceOrRejection}");

      NetworkService.POST(NetworkService.API_ACCEPTANCE, NetworkService.paramAcceptance(acceptance)).then((value) => {
        // getData(),
      LogService.d(value.toString()),
      });
    }catch(e){
      LogService.e(e.toString());
    }
    }


}

