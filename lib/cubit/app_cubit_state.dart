import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitStates extends Equatable{}


class InitialState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];




}

class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object?> get props => [];




}

class loadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object?> get props => [];




}

class loadedState extends CubitStates{
  loadedState(this.places);
  final List<datamodel> places;
  @override
  // TODO: implement props
  List<Object?> get props => [places];




}
class detailsState extends CubitStates{
  detailsState(this.places);
  final datamodel places;
  @override
  // TODO: implement props
  List<Object?> get props => [places];




}