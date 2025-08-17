part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetCarLoading extends HomeState {}

final class GetCarSuccess extends HomeState {}

final class GetCarFailure extends HomeState {
  final String errorMessage;
  GetCarFailure(this.errorMessage);
}
  final class ChangeColor extends HomeState{}
  
