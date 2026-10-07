import 'package:flutter_test/flutter_test.dart';
import 'package:heuser_erp_mobile/app/security/app_lock_cubit.dart';
import 'package:heuser_erp_mobile/core/security/app_lock_service.dart';
import 'package:mocktail/mocktail.dart';

class _Service extends Mock implements AppLockService;

void main() {
  late _Service service;
  late DateTime now;

  setUp(() {
    service = _Service();
    now = DateTime(2026, 10, 7, 9);
    when(() => service.supported()).thenAnswer((_) async => true);
    when(() => service.enabled()).thenAnswer((_) async => false);
    when(() => service.setEnabled(value: any(named: 'value')))
        .thenAnswer((_) async {});
  });

  Future<AppLockCubit> make() async {
    final cubit = AppLockCubit(service, clock: () => now);
    await Future<void>.delayed(Duration.zero);
    return cubit;
  }

  test('cold start locks when enabled', () async {
    when(() => service.enabled()).thenAnswer((_) async => true);
    final cubit = await make();
    expect(cubit.state.supported, isTrue);
    expect(cubit.state.locked, isTrue);
    await cubit.close();
  });

  test('unsupported device is never enabled', () async {
    when(() => service.supported()).thenAnswer((_) async => false);
    when(() => service.enabled()).thenAnswer((_) async => true);
    final cubit = await make();
    expect(cubit.state.enabled, isFalse);
    expect(cubit.state.locked, isFalse);
    await cubit.close();
  });

  test('locks only after the grace period in the background', () async {
    when(() => service.enabled()).thenAnswer((_) async => true);
    when(() => service.authenticate(any())).thenAnswer((_) async => true);
    final cubit = await make();
    await cubit.unlock('r');
    expect(cubit.state.locked, isFalse);

    cubit.paused();
    now = now.add(const Duration(seconds: 10));
    cubit.resumed();
    expect(cubit.state.locked, isFalse);

    cubit.paused();
    now = now.add(const Duration(seconds: 31));
    cubit.resumed();
    expect(cubit.state.locked, isTrue);
    await cubit.close();
  });

  test('failed unlock stays locked', () async {
    when(() => service.enabled()).thenAnswer((_) async => true);
    when(() => service.authenticate(any())).thenAnswer((_) async => false);
    final cubit = await make();
    await cubit.unlock('r');
    expect(cubit.state.locked, isTrue);
    expect(cubit.state.busy, isFalse);
    await cubit.close();
  });

  test('enabling needs a successful prompt', () async {
    when(() => service.authenticate(any())).thenAnswer((_) async => false);
    final cubit = await make();
    expect(await cubit.setEnabled(value: true, reason: 'r'), isFalse);
    expect(cubit.state.enabled, isFalse);
    verifyNever(() => service.setEnabled(value: true));

    when(() => service.authenticate(any())).thenAnswer((_) async => true);
    expect(await cubit.setEnabled(value: true, reason: 'r'), isTrue);
    expect(cubit.state.enabled, isTrue);
    verify(() => service.setEnabled(value: true)).called(1);
    await cubit.close();
  });

  test('sign-out turns the lock off and unlocks', () async {
    when(() => service.enabled()).thenAnswer((_) async => true);
    final cubit = await make();
    await cubit.signedOut();
    expect(cubit.state.enabled, isFalse);
    expect(cubit.state.locked, isFalse);
    verify(() => service.setEnabled(value: false)).called(1);
    await cubit.close();
  });
}
