import "package:cloud_functions/cloud_functions.dart";
import "package:mockito/mockito.dart";

class MockFirebaseFunctions extends Mock implements FirebaseFunctions {
  @override
  HttpsCallable httpsCallable(String name, {HttpsCallableOptions? options}) =>
      super.noSuchMethod(
        Invocation.method(#httpCallable, [name, options]),
        returnValue: MockHttpsCallable(),
        returnValueForMissingStub: MockHttpsCallable(),
      );
}

class MockHttpsCallable extends Mock implements HttpsCallable {
  @override
  Future<HttpsCallableResult<T>> call<T>([dynamic parameters]) async =>
      super.noSuchMethod(
        Invocation.method(#call, [parameters]),
        returnValue: MockHttpsCallableResult(),
        returnValueForMissingStub: MockHttpsCallableResult(),
      );
}

class MockHttpsCallableResult<T> extends Mock
    implements HttpsCallableResult<T> {
  @override
  get data => super.noSuchMethod(
        Invocation.getter(#data),
        returnValue: null,
        returnValueForMissingStub: null,
      );
}
