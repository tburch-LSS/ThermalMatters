within ThermalMatters.Materials;

record Lead
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  parameter SI.Temperature T_D (displayUnit = "K")= 105 "K ; Debye Temperature";
  parameter Real effAm = 207.2 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 11348 "kg/m^3 ; Mass density";
  parameter SI.CubicExpansionCoefficient alpha0 = 28.73e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.ThermalConductivity kappa0 = 35.3 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a0 = 3.9e-3 "1/K; Resistivity T coefficient";
  parameter SI.Temperature Tkmax(displayUnit = "K") = 2 "K; Temperature of max kappa";
  parameter SI.Conductivity sigma0 = 4.81e6 "S/m; Electrical conductivity";
  annotation(
    Documentation(info = "<html><head></head><body>Material characteristics for Lead.</body></html>"));
end Lead;