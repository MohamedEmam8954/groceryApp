class OrderCubitState {}

class InitialOrderCubitState extends OrderCubitState {}

class LoadingOrderCubitState extends OrderCubitState {}

class FailuresOrderCubitState extends OrderCubitState {
  final String errorMessage;

  FailuresOrderCubitState({required this.errorMessage});
}

class SucessOrderCubitState extends OrderCubitState {}

class SucessGettingOrderState extends OrderCubitState {}

class FailureGettingOrderState extends OrderCubitState {
  final String errorMessage;

  FailureGettingOrderState({required this.errorMessage});
}

class LoadingGettingOrderState extends OrderCubitState {}
