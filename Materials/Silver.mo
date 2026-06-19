within ThermalMatters.Materials;

record Silver
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  parameter SI.Temperature T_D (displayUnit = "K")= 215 "K ; Debye Temperature";
  parameter Real effAm = 107.87 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 10503 "kg/m^3 ; Mass density";
  parameter SI.CubicExpansionCoefficient alpha0 = 18.92e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.ThermalConductivity kappa0 = 429 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a0 = 3.8e-3 "1/K; Resistivity T coefficient";
  parameter SI.Temperature Tkmax(displayUnit = "K") = 10 "K; Temperature of max kappa";
  parameter SI.Conductivity sigma0 = 63.01e6 "S/m; Electrical conductivity";
  annotation(
    Documentation(info = "<html><head></head><body>Material characteristics for Silver.</body></html>"));
end Silver;