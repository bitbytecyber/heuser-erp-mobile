import 'package:fpdart/fpdart.dart';
import 'package:heuser_erp_mobile/core/network/failure.dart';

/// The return type of every repository and api method: a [Failure] or a value.
typedef Result<T> = Either<Failure, T>;

/// A successful result.
Result<T> ok<T>(T value) => Right(value);

/// A failed result.
Result<T> fail<T>(Failure failure) => Left(failure);

/// Small conveniences over [Either] that read well at call sites.
extension ResultX<T> on Result<T> {
  /// The failure, or `null` on success.
  Failure? get failureOrNull => fold((f) => f, (_) => null);

  /// The value, or `null` on failure.
  T? get valueOrNull => fold((_) => null, (v) => v);

  /// `true` on success.
  bool get isOk => isRight();

  /// Runs [onOk] / [onFail] for their side effects and returns `this`.
  Result<T> when({
    void Function(T value)? onOk,
    void Function(Failure f)? onFail,
  }) {
    fold((f) => onFail?.call(f), (v) => onOk?.call(v));
    return this;
  }

  /// Maps the value on success, keeping the failure otherwise.
  Result<R> mapOk<R>(R Function(T value) f) => map(f);

  /// Chains another result-producing call on success.
  Future<Result<R>> andThen<R>(Future<Result<R>> Function(T value) f) =>
      fold((failure) async => Left(failure), f);
}
