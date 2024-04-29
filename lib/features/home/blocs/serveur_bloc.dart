import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pfe/features/home/blocs/serveur_event.dart';

import 'package:pfe/features/home/blocs/serveur_state.dart';
import 'package:pfe/features/home/repositories/serveur_repository.dart';

class ServeurBloc extends Bloc<ServeurEvent, ServeurState> {
  final ServeurRepository _serveurRepository;
  StreamSubscription? _serveurSubscription;

  ServeurBloc({
    required ServeurRepository serveurRepository,
  })  : _serveurRepository = serveurRepository,
        super(ServeurLoading()) {
    on<LoadServeurs>(_onLoadServeurs);
    on<UpdateProducts>(_onUpdateProducts);
  }
  //
  void _onLoadServeurs(
    LoadServeurs event,
    Emitter<ServeurState> emit,
  ) async {
    // emit(AppointmentLoading());

    //Appointment appointment = new Appointment();
    _serveurSubscription?.cancel();

    _serveurSubscription = _serveurRepository.getAllServeurs().listen(
          (products) => add(
            UpdateProducts(products),
          ),
        );

    print('les serveurs sont ');
  }

  //
  void _onUpdateProducts(
    UpdateProducts event,
    Emitter<ServeurState> emit,
  ) {
    print('here i am');
    print(event.products);
    emit(ServeurLoaded(serveurs: event.products));
  }
}
