within ThermalMatters.Materials;

record Aluminum
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  parameter SI.Temperature T_D (displayUnit = "K")= 428 "K ; Debye Temperature";
  parameter Real effAm = 26.982 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 2699 "kg/m^3 ; Mass density";
  parameter SI.CubicExpansionCoefficient alpha0 = 22.87e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.ThermalConductivity kappa0 = 237 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a = 4.29e-3 "1/K; Resistivity T coefficient";
  parameter SI.Conductivity sigma0 = 37.74e6 "S/m; Electrical conductivity";annotation(
    Documentation(info = "<html><head></head><body>Material characteristics for Aluminum.</body></html>"));
end Aluminum;