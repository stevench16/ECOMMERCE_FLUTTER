import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/home/bloc/AdminHomeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {
  AdminHomeBloc() : super(AdminHomeState()) {
    on<AdminChangeDrawerPage>(_onAdminChangeDrawerPager);
  }

  Future<void> _onAdminChangeDrawerPager(
      AdminChangeDrawerPage event, Emitter<AdminHomeState> emit) async {
    emit(state.copywith(pageIndex: event.pageIndex));
  }
}
