import 'package:adventure/model/data_model.dart';
import 'package:adventure/services/data_services.dart';
import 'package:bloc/bloc.dart';
import 'app_cubit_state.dart';
class AppCubit extends Cubit<CubitStates>{
  // ignore: non_constant_identifier_names
  AppCubit(this.data):super(InitialState()){
    emit(WelcomeState()) ;
  }
  final dataservices data;
   late final places;
  void getdata()async {
  
    try{
     emit(loadingState());
     places = await data.getinfo();
     emit(loadedState(places));
    }catch(e){

    }
  }

     detailspage(datamodel data){
        emit(detailsState(data));
     }
     gohome(){
      emit(loadedState(places));
     }


}