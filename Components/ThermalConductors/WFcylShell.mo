within ThermalMatters.Components.ThermalConductors;

model WFcylShell "Wiedemann-Franz conducting cylindrical shell"
  extends Modelica.Thermal.HeatTransfer.Interfaces.Element1D;
  extends Icons.Block;
  import SI = Modelica.Units.SI;
  SI.Temperature T "Temperature of material";
  SI.ThermalConductance G "Thermal conductance of material";
  SI.Conductivity sigma "S/m; Electrical conductivity";
  SI.ThermalConductivity kappa "W/(m K); Thermal conductivity";
  SI.Length g "m; Geometrical factor";
  parameter SI.Length ra = 0.1 "m; Radius at port a";
  parameter SI.Length rb = 0.2 "m; Radius at port b";
  parameter SI.Length l = 10 "m; Length of cylinder";
  // parameter Real L = 2.44e-8 "V^2 K^-2; Lorenz number";
  // parameter SI.Conductivity sigma0 = 59.6e6 "S/m; Electrical conductivity";
  parameter SI.ThermalConductivity kappa0 = 401 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
  parameter SI.LinearTemperatureCoefficient a = 4.04e-3 "1/K; Resistivity T coefficient";
equation
  (T, g) = Functions.poissonCyl(port_a.T, port_b.T, ra, rb, l);
  (kappa, sigma) = Functions.wfCond(T, kappa0, T0, a);
  G = g * kappa;
  Q_flow = G * dT;
  annotation(
    Documentation(info = "<html><head></head><body>Model of a temperature-dependent thermal conducting cylindrical shell obeying the Wiedemann-Franz relation:<div><br></div><div>κ / σ = L T&nbsp;</div><div><br></div><div>where κ is the thermal conductivity, σ is the electrical conductivity, L is known as the Lorenz number, and T is the absolute temperature.&nbsp;</div><div><br></div><div>The overall thermal conductance is...&nbsp;</div><div><br></div><div>G = g κ = g κ<sub>0&nbsp;</sub>(T/T<sub>0</sub>) / [1&nbsp;+ a (T - T<sub>0</sub>)]&nbsp;</div><div><br></div><div>where g is a purely geometrical factor with an overall unit of length (m):&nbsp;</div><div><br></div><div><span style=\"font-family: 'Ubuntu Sans';\">g = 2π l / ln(r</span><sub style=\"font-family: 'Ubuntu Sans';\">b</sub><span style=\"font-family: 'Ubuntu Sans';\">/r</span><sub style=\"font-family: 'Ubuntu Sans';\">a</sub><span style=\"font-family: 'Ubuntu Sans';\">) &nbsp; &nbsp; &nbsp; for a cylindrical shell of length, l, and inner and outer radii of r</span><sub style=\"font-family: 'Ubuntu Sans';\">a</sub><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;and r</span><sub style=\"font-family: 'Ubuntu Sans';\">b</sub><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;(radial heat flow).</span></div><div><span style=\"font-family: 'Ubuntu Sans';\"><br></span></div><div><span style=\"font-family: 'Ubuntu Sans';\">Note: for composite objects,&nbsp;</span><span style=\"font-family: 'Ubuntu Sans';\">r</span><sub style=\"font-family: 'Ubuntu Sans';\">a</sub><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;and r</span><sub style=\"font-family: 'Ubuntu Sans';\">b</sub><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;should reflect the center-of-mass coordinates of any heat capacitors at a and b.</span></div><div><span style=\"font-family: 'Ubuntu Sans';\"><br></span></div><div><span style=\"font-family: 'Ubuntu Sans';\">T is taken as the average temperature from the Poisson-Eq solution in cylindrical coordinates&nbsp;</span><span style=\"font-family: 'Ubuntu Sans';\">(quasi-steady-state)</span><span style=\"font-family: 'Ubuntu Sans';\">.</span></div><div><br></div><div><span style=\"font-family: 'Ubuntu Sans';\">The default parameters are those appropriate for copper.</span></div><div><br></div><div>(see also ThermalMatters.Functions.wfCond and&nbsp;ThermalMatters.Functions.poissonCyl).</div></body></html>"),
  Icon(graphics = {Ellipse(origin = {-4, 0}, lineColor = {230, 97, 0}, fillColor = {36, 31, 49}, fillPattern = FillPattern.Solid, lineThickness = 9, extent = {{-90, 90}, {90, -90}}), Line(origin = {-45, 85}, points = {{-17, -13}, {23, 15}}, color = {230, 97, 0}, thickness = 3), Line(origin = {71, -59}, points = {{-17, -13}, {29, 23}}, color = {230, 97, 0}, thickness = 3), Line(origin = {-44, 0}, points = {{44, 0}, {-42, -6}}, color = {224, 27, 36}, thickness = 2), Line(origin = {44, 0}, points = {{44, -6}, {-44, 0}}, color = {129, 61, 156}, thickness = 2), Text(origin = {-44, 11}, textColor = {224, 27, 36}, extent = {{-14, 15}, {14, -15}}, textString = "ra"), Text(origin = {42, 10}, textColor = {129, 61, 156}, extent = {{-12, 14}, {12, -14}}, textString = "rb"), Line(origin = {53, 91}, points = {{-9, -5}, {11, 7}, {11, 7}, {11, 7}}, thickness = 0.5), Line(origin = {87, 63}, points = {{-9, -7}, {11, 7}, {11, 7}, {11, 7}}, thickness = 0.5), Line(origin = {73, 83}, points = {{-11, -7}, {11, 7}, {11, 7}, {23, 15}}, thickness = 0.5)}),
  Diagram(graphics));
end WFcylShell;