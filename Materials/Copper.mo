within ThermalMatters.Materials;

record Copper
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  parameter SI.Temperature T_D (displayUnit = "K")= 343 "K ; Debye Temperature";
  parameter Real effAm = 63.546 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 8935 "kg/m^3 ; Mass density";
  parameter SI.CubicExpansionCoefficient alpha0 = 16.64e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.ThermalConductivity kappa0 = 401 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a = 4.04e-3 "1/K; Resistivity T coefficient";
  parameter SI.Conductivity sigma0 = 59.6e6 "S/m; Electrical conductivity";annotation(
    Documentation(info = "<html><head></head><body>Material characteristics for Copper.</body></html>"));
end Copper;