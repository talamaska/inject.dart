import 'coffee_app.dart' as _i1;
import 'src/drip_coffee_module.dart' as _i2;
import 'src/electric_heater.dart' as _i3;
import 'src/heater.dart' as _i4;
import 'dart:async' as _i5;
import 'src/coffee_maker.dart' as _i6;
import 'src/pump.dart' as _i7;

class Coffee$Injector implements _i1.Coffee {
  Coffee$Injector._(this._dripCoffeeModule);

  final _i2.DripCoffeeModule _dripCoffeeModule;

  _i3.PowerOutlet _nullPowerOutlet;

  _i4.Heater _nullHeater;

  _i3.Electricity _singletonnullElectricity;

  static _i5.Future<_i1.Coffee> create(
      _i2.DripCoffeeModule dripCoffeeModule) async {
    final injector = Coffee$Injector._(dripCoffeeModule);
    injector._nullPowerOutlet =
        await injector._dripCoffeeModule.providePowerOutlet();
    injector._nullHeater = await injector._dripCoffeeModule
        .provideHeater(injector._createnullElectricity());
    return injector;
  }

  _i6.CoffeeMaker _createnullCoffeeMaker() => _i6.CoffeeMaker(
      _createnullHeater(),
      _createnullPump(),
      _createBrandNameString(),
      _createModelNameString());
  _i4.Heater _createnullHeater() => _nullHeater;
  _i3.Electricity _createnullElectricity() => _singletonnullElectricity ??=
      _dripCoffeeModule.provideElectricity(_createnullPowerOutlet());
  _i3.PowerOutlet _createnullPowerOutlet() => _nullPowerOutlet;
  _i7.Pump _createnullPump() =>
      _dripCoffeeModule.providePump(_createnullHeater());
  String _createBrandNameString() => _dripCoffeeModule.provideBrand();
  String _createModelNameString() => _dripCoffeeModule.provideModel();
  @override
  _i6.CoffeeMaker getCoffeeMaker() => _createnullCoffeeMaker();
}
