import 'package:equatable/equatable.dart';
import '../enums/typedefs.dart';

class ErrorResponse extends Equatable {
  const ErrorResponse({
    this.type,
    this.message,
    this.errorMessages,
  });

  /// Create from API response (Map/JSON)
  /// Used whereType<DataMap>() to avoid runtime errors if API sends unexpected data.
  factory ErrorResponse.fromMap(DataMap map) {
    final errors = (map['errors'] as List?)
        ?.whereType<DataMap>() // ensure only Map<String,dynamic>
        .map((e) => e['message'] as String? ?? '')
        .where((msg) => msg.isNotEmpty)
        .toList();

    return ErrorResponse(
      type: map['type'] as String?,
      message: map['message'] as String?,
      errorMessages: errors?.isEmpty == true ? null : errors,
    );
  }

  final String? type;
  final String? message;
  final List<String>? errorMessages;

  /// ✅ Nicely formatted error message (for showing in UI)
  /// Used StringBuffer → more efficient than concatenating strings repeatedly.
  /// Added spacing between multiple error messages.
  String get errorMessage {
    final buffer = StringBuffer();

    if (type != null) buffer.writeln(type);

    if (message != null && message!.isNotEmpty) {
      buffer.write(message);
    } else if (errorMessages != null && errorMessages!.isNotEmpty) {
      buffer.writeln('What went wrong?');
      for (int i = 0; i < errorMessages!.length; i++) {
        buffer.writeln(errorMessages![i]);
        if (i < errorMessages!.length - 1) buffer.writeln(); // add line space
      }
    }

    return buffer.toString().trim();
  }

  /// Convert back to Map (optional, helpful for debugging/logging)
  DataMap toMap() => {
    'type': type,
    'message': message,
    'errors': errorMessages,
  };

  @override
  List<Object?> get props => [type, message, errorMessages];
}
