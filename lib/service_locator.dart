import 'package:get_it/get_it.dart';
import 'package:crazy_simple_bloc/bloc.dart';

var serviceLocator = GetIt();

void initServiceLocator() {
  serviceLocator.registerSingleton<Bloc>(Bloc());
}
