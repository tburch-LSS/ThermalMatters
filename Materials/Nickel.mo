within ThermalMatters.Materials;

record Nickel
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  parameter SI.Temperature T_D (displayUnit = "K")= 450 "K ; Debye Temperature";
  parameter Real effAm = 58.693 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 8907 "kg/m^3 ; Mass density";
  parameter SI.CubicExpansionCoefficient alpha0 = 12.83e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.ThermalConductivity kappa0 = 90.9 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a = 6.0e-3 "1/K; Resistivity T coefficient";
  parameter SI.Conductivity sigma0 = 14.31e6 "S/m; Electrical conductivity";annotation(
    Documentation(info = "<html><head></head><body>Material characteristics for Nickel.</body></html>"));
end Nickel;