within ThermalMatters.Components.ThermalConductors;

model WFwall "Wiedemann-Franz conducting planar wall"
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  extends Icons.Block;
  import SI = Modelica.Units.SI;
  SI.Temperature T "Temperature of material";
  SI.ThermalConductance G "Thermal conductance of material";
  SI.Conductivity sigma "S/m; Electrical conductivity";
  SI.ThermalConductivity kappa "W/(m K); Thermal conductivity";
  SI.Length g "m; Geometrical factor";
  parameter SI.Length d = 0.1 "m; Thickness";
  parameter SI.Area A = 1 "m^2; Area";
  // parameter Real L = 2.44e-8 "V^2 K^-2; Lorenz number";
  // parameter SI.Conductivity sigma0 = 59.6e6 "S/m; Electrical conductivity";
  parameter SI.ThermalConductivity kappa0 = 401 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a = 4.04e-3 "1/K; Resistivity T coefficient";
equation
  (T, g) = Functions.poissonWall(port_a.T, port_b.T, A, d);
  (kappa, sigma) = Functions.wfCond(T, kappa0, T0, a);
  G = g * kappa;
  Q_flow = G * dT;
  annotation(
    Documentation(info = "<html><head></head><body>Model of a temperature-dependent thermal conducting wall obeying the Wiedemann-Franz relation:<div><br></div><div>κ / σ = L T&nbsp;</div><div><br></div><div>where κ is the thermal conductivity, σ is the electrical conductivity, L is known as the Lorenz number, and T is the absolute temperature.&nbsp;</div><div><br></div><div>The overall thermal conductance is...&nbsp;</div><div><br></div><div>G = g κ =&nbsp;<span style=\"font-family: 'Ubuntu Sans';\">g κ</span><sub style=\"font-family: 'Ubuntu Sans';\">0&nbsp;</sub><span style=\"font-family: 'Ubuntu Sans';\">(T/T</span><sub style=\"font-family: 'Ubuntu Sans';\">0</sub><span style=\"font-family: 'Ubuntu Sans';\">) / [1&nbsp;+ a (T - T</span><sub style=\"font-family: 'Ubuntu Sans';\">0</sub><span style=\"font-family: 'Ubuntu Sans';\">)]&nbsp;</span></div><div><br></div><div>where g is a purely geometrical factor with an overall unit of length (m):&nbsp;</div><div><br></div><div>g = A / d &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for a planar wall of area, A, and thickness, d.&nbsp;</div><div><br></div><div><span style=\"font-family: 'Ubuntu Sans';\">T is taken as the average temperature from the Poisson-Eq solution in 1D planar coordinates (quasi-steady-state).</span></div><div><br></div><div><span style=\"font-family: 'Ubuntu Sans';\">The default parameters are those appropriate for copper.</span></div><div><br></div><div>(see also ThermalMatters.Functions.wfCond and&nbsp;ThermalMatters.Functions.poissonWall).</div></body></html>"),
  Icon(graphics = {Rectangle( lineColor = {230, 97, 0}, fillColor = {255, 190, 111}, fillPattern = FillPattern.Backward, lineThickness = 2, extent = {{-88, 98}, {88, -98}})}));
end WFwall;