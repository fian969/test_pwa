class Failure {
  final String message;

  const Failure([this.message = "An unexpected error occurred."]);
}

class ExpressFailure extends Failure {
  final int statusCode;

ExpressFailure([super.message, this.statusCode = 500]);
}
