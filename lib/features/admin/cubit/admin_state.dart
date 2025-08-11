part of 'admin_cubit.dart';

sealed class AdminState {
}

final class AdminInitial extends AdminState {}

final class UploadCarLoading extends AdminState {}

final class UploadCarSuccess extends AdminState {}

final class UploadCarFailure extends AdminState {
  final String errorMessage;
  UploadCarFailure(this.errorMessage);
}

final class UploadCarImage extends AdminState {}
final class SelectedItemChanged extends AdminState {
  final String selectedItem;
  SelectedItemChanged(this.selectedItem);
}
