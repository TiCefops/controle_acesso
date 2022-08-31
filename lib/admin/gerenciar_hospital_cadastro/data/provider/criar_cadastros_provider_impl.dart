
import 'package:cefops_controll_acess/core/utils/firebase_auth/firebase_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../interface/entity/criar_cadastro_hospital_entity.dart';
import '../interface/provider/i_criar_cadastro_hospital_provider.dart';

class CriarCadastroHospitalProviderImpl implements ICriarCadastroHospitalProvider {
  final FirebaseFirestore firestore;
  final AuthenticationHelper authHElper;
  final firebaseAuth=FirebaseAuth.instance;
  CriarCadastroHospitalProviderImpl(this.firestore, this.authHElper);

  @override
  Future<void> criarCadastroHospital({required String email, required String password,required String nome}) async{
    await authHElper.signUp(email: email, password: password).then((value) async{
     if(value is UserCredential){
     await   firebaseAuth.currentUser!.updateDisplayName(nome);
     User user=firebaseAuth.currentUser!;

     firestore.collection("hospitais").doc(user.uid).set({
       "email":user.email,
       "id":user.uid,
       "nome": user.displayName,

     });
     }

    }


    );


  }

}