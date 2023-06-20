enum NetworkType { hasData, error, loading, empty }

class NetworkResult<T> {
  final T? data;
  final String? message;
  final NetworkType type;
  NetworkResult._({
    this.data,
    this.message,
    required this.type,
  });

  factory NetworkResult.hasData(T data) {
    return NetworkResult._(
      type: NetworkType.hasData,
      data: data,
    );
  }

  factory NetworkResult.error(String message) {
    return NetworkResult._(
      type: NetworkType.error,
      message: message,
    );
  }

  factory NetworkResult.loading() {
    return NetworkResult._(
      type: NetworkType.loading,
    );
  }

  factory NetworkResult.empty() {
    return NetworkResult._(
      type: NetworkType.empty,
    );
  }
}
