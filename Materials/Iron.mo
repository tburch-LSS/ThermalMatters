within ThermalMatters.Materials;

record Iron
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  parameter SI.Temperature T_D (displayUnit = "K")= 470 "K ; Debye Temperature";
  parameter Real effAm = 55.845 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 7874 "kg/m^3 ; Mass density";
  parameter SI.CubicExpansionCoefficient alpha0 = 12.07e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.ThermalConductivity kappa0 = 80.4 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a0 = 6.51e-3 "1/K; Resistivity T coefficient";
  parameter SI.Temperature Tkmax(displayUnit = "K") = 10 "K; Temperature of max kappa";
  parameter SI.Conductivity sigma0 = 10.41e6 "S/m; Electrical conductivity";
  annotation(
    Documentation(info = "<html><head></head><body>Material characteristics for Iron.</body></html>"));
end Iron;