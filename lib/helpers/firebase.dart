enum ResponseStatus { success, error }

class RequestResult {
  ResponseStatus status;
  String message;

  RequestResult({
    this.status,
    this.message,
  });
}

class FirebaseHelpers {
  RequestResult requestError(String message) {
    return RequestResult(
      status: ResponseStatus.error,
      message: message,
    );
  }

  RequestResult requestSuccess() {
    return RequestResult(status: ResponseStatus.success);
  }
}
