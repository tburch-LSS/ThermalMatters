within ThermalMatters.Components.HeatCapacitors;

model FrenkelFluid
  extends Icons.Fluid;
  extends Modelica.Icons.UnderConstruction;
  import SI = Modelica.Units.SI;
  SI.Mass Mass "kg";
  parameter SI.Temperature T_D(displayUnit = "K") = 200 "K ; Debye Temperature";
  parameter Real effAm = 18.015 "Da ; Effective atomic mass";
  parameter SI.Density Mdens(displayUnit = "kg/m3") = 1000 "kg/m^3 ; Mass density";
  parameter SI.Volume V = 1/1000 "m^3; Volume";
  parameter SI.CubicExpansionCoefficient alpha0 = 210.e-6 "1/K ; Thermal expansion coefficient";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K ; Reference Temperature";
  parameter SI.Frequency fF(displayUnit = "THz") = 2e12 "Hz ; Frenkel Frequency";
  SI.HeatCapacity C "Heat capacity of element (= cp*m)";
  SI.Temperature T(start = 293.15, displayUnit = "K") "Temperature of element";
  SI.TemperatureSlope der_T(start = 0) "Time derivative of temperature (= der(T))";
  SI.EnergyDensity Edens;
  SI.SpecificHeatCapacity c_p;
  SI.CubicExpansionCoefficient alpha "= Thermal expansion coefficient (1/K)";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  T = port.T;
  (Edens, c_p, alpha) = Functions.frenkelEoS(T, T_D, effAm, Mdens, alpha0, T0, fF);
  Mass = Mdens * V;
  C = c_p*Mass;
  der_T = der(T);
  C*der(T) = port.Q_flow;
  annotation(
    Icon,
    Documentation(info = "<html><head></head><body><div><span style=\"font-family: 'Ubuntu Sans';\">** This will require further parametrization as the Frenkel Frequency is a function of Temperature and Pressure **</span></div><span style=\"font-family: 'Ubuntu Sans';\"><div><span style=\"font-family: 'Ubuntu Sans';\"><br></span></div>Fluid mass obeying the Frenkel (Isotropic Quasi-Harmonic-Approximation) Equation of State (EoS).</span><div><font face=\"Ubuntu Sans\"><br></font><div><span style=\"font-family: 'Ubuntu Sans';\">The default parameters are those appropriate for 1 kg of water.</span></div></div></body></html>"));
end FrenkelFluid;