
import 'package:mvvm_architecture_provider/data_directory/response_directory/status.dart';

class ApiResponse<T>{
Status? status;
T? data;// dynamic function getting data
String? message;
ApiResponse([this.status,this.data,this.message]);// created constructors
ApiResponse.loading(): status=Status.LOADING;
ApiResponse.completed(this.data): status=Status.COMPLETED;
ApiResponse.error(this.message): status=Status.ERROR;
//ApiResponse.atto(): status=Status.attp;
@override
String toString(){
  return 'Status : $status \n Message : $message \n Data :$data';
  // returning all above parameters
}

}