within ThermalMatters.Materials;

record Silicon
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  parameter SI.Temperature T_D (displayUnit = "K")= 645 "K ; Debye Temperature";
  parameter Real effAm = 28.085 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 2329.1 "kg/m^3 ; Mass density";
  parameter SI.CubicExpansionCoefficient alpha0 = 2.556e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.ThermalConductivity kappa0 = 149 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a0 = -0.07 "1/K; Resistivity T coefficient";
  parameter SI.Temperature Tkmax(displayUnit = "K") = 0 "K; Temperature of max kappa";
  parameter SI.Conductivity sigma0 = 4.348e-4 "S/m; Electrical conductivity";
  annotation(
    Documentation(info = "<html><head></head><body>Material characteristics for Silicon.</body></html>"));
end Silicon;