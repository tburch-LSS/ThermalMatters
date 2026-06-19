within ThermalMatters.Materials;

record Gold
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  parameter SI.Temperature T_D (displayUnit = "K")= 170 "K ; Debye Temperature";
  parameter Real effAm = 196.97 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 19283 "kg/m^3 ; Mass density";
  parameter SI.CubicExpansionCoefficient alpha0 = 14.13e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.ThermalConductivity kappa0 = 318 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a0 = 3.4e-3 "1/K; Resistivity T coefficient";
  parameter SI.Temperature Tkmax(displayUnit = "K") = 10 "K; Temperature of max kappa";
  parameter SI.Conductivity sigma0 = 45.17e6 "S/m; Electrical conductivity";
  annotation(
    Documentation(info = "<html><head></head><body>Material characteristics for Gold.</body></html>"));
end Gold;