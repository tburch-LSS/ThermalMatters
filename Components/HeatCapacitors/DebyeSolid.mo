within ThermalMatters.Components.HeatCapacitors;
model DebyeSolid
  extends ThermalMatters.Icons.Solid;
  import SI = Modelica.Units.SI;
  SI.Mass Mass "kg";
  parameter SI.Temperature T_D (displayUnit = "K")= 343 "K ; Debye Temperature";
  parameter Real effAm = 63.546 "Da ; Effective atomic mass";
  parameter SI.Density Mdens (displayUnit = "kg/m3")= 8935 "kg/m^3 ; Mass density";
  parameter SI.Volume V = 1/8935 "m^3; Volume";
  SI.HeatCapacity C
    "Heat capacity of element (= cp*m)";
  SI.Temperature T(start=293.15, displayUnit="K")
    "Temperature of element";
  SI.TemperatureSlope der_T(start=0)
    "Time derivative of temperature (= der(T))";
  SI.EnergyDensity Edens;
  SI.SpecificHeatCapacity c_p;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port annotation (Placement(transformation(
        origin={0,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation
  T = port.T;
  (Edens,c_p) = ThermalMatters.Functions.debyeEoS(T,T_D,effAm,Mdens);
  Mass = Mdens * V;
  C = c_p * Mass;
  der_T = der(T);
  C*der(T) = port.Q_flow;
annotation(
    Icon,
  Documentation(info = "<html><head></head><body><span style=\"font-family: 'Ubuntu Sans';\">Solid mass obeying the Debye (Isotropic, Harmonic) Equation of State (EoS).</span><div><font face=\"Ubuntu Sans\"><br></font><div><span style=\"font-family: 'Ubuntu Sans';\">The default parameters are those appropriate for 1 kg of copper.</span></div></div></body></html>"));
end DebyeSolid;