import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalService {
  
  
  Future<Map<String,dynamic>> getHospitalInfo({required String id})async{
    Map<String,dynamic> dados={};
    FirebaseFirestore firestore=FirebaseFirestore.instance;
    final hospital =await firestore.collection("hospitais").doc(id).get();

    if(hospital.data()!.isNotEmpty){
      dados={
       "email":hospital.get("email")
      };

    }
    return dados;
  }
}