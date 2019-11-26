import 'coffee_app_test.dart' as _i1;
import 'package:inject.example.coffee/src/drip_coffee_module.dart' as _i2;
import 'package:inject.example.coffee/src/electric_heater.dart' as _i3;
import 'dart:async' as _i4;
import 'package:inject.example.coffee/src/coffee_maker.dart' as _i5;
import 'package:inject.example.coffee/src/heater.dart' as _i6;
import 'package:inject.example.coffee/src/pump.dart' as _i7;

class TestCoffee$Injector implements _i1.TestCoffee {
  TestCoffee$Injector._(this._testModule, this._dripCoffeeModule);

  final _i1.TestModule _testModule;

  final _i2.DripCoffeeModule _dripCoffeeModule;

  _i3.PowerOutlet _nullPowerOutlet;

  _i3.Electricity _singletonnullElectricity;

  static _i4.Future<_i1.TestCoffee> create(
      _i2.DripCoffeeModule dripCoffeeModule, _i1.TestModule testModule) async {
    final injector = TestCoffee$Injector._(testModule, dripCoffeeModule);
    injector._nullPowerOutlet =
        await injector._dripCoffeeModule.providePowerOutlet();
    return injector;
  }

  _i5.CoffeeMaker _createnullCoffeeMaker() => _i5.CoffeeMaker(
      _createnullHeater(),
      _createnullPump(),
      _createBrandNameString(),
      _createModelNameString());
  _i6.Heater _createnullHeater() =>
      _testModule.testHeater(_createnullElectricity());
  _i3.Electricity _createnullElectricity() => _singletonnullElectricity ??=
      _dripCoffeeModule.provideElectricity(_createnullPowerOutlet());
  _i3.PowerOutlet _createnullPowerOutlet() => _nullPowerOutlet;
  _i7.Pump _createnullPump() =>
      _dripCoffeeModule.providePump(_createnullHeater());
  String _createBrandNameString() => _dripCoffeeModule.provideBrand();
  String _createModelNameString() => _testModule.testModel();
  @override
  _i5.CoffeeMaker getCoffeeMaker() => _createnullCoffeeMaker();
}
