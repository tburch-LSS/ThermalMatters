within ThermalMatters.Components.ThermalConductors;

model WFsphShell "Wiedemann-Franz conducting spherical shell"
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
  parameter SI.ThermalConductivity kappa0 = 401 "W/(m K); Thermal conductivity at T0";
  parameter SI.Temperature T0(displayUnit = "K") = 293 "K; Reference temperature";
equation
  (T, g) = Functions.poissonSph(port_a.T, port_b.T, ra, rb);
  (kappa, sigma) = Functions.wfCond(T, kappa0, T0);
  G = g * kappa;
  Q_flow = G * dT;
  annotation(
    Documentation(info = "<html><head></head><body><div><span style=\"font-family: 'Ubuntu Sans';\">** Note: good approximation for T &gt;&gt; T<sub>k,max</sub>&nbsp;(where&nbsp;</span><span style=\"font-family: 'Ubuntu Sans';\">κ is a maximum; see Functions.wfCond). **&nbsp;</span></div>Model of a temperature-dependent thermal conducting spherical shell obeying the Wiedemann-Franz relation:<div><br></div><div>κ / σ = L T&nbsp;</div><div><br></div><div>where κ is the thermal conductivity, σ is the electrical conductivity, L is known as the Lorenz number, and T is the absolute temperature.&nbsp;</div><div><br></div><div>The overall thermal conductance is...&nbsp;</div><div><br></div><div>G = g κ =&nbsp;<span style=\"font-family: 'Ubuntu Sans';\">g κ</span><sub style=\"font-family: 'Ubuntu Sans';\">0&nbsp;</sub><span style=\"font-family: 'Ubuntu Sans';\">(T/T</span><sub style=\"font-family: 'Ubuntu Sans';\">0</sub><span style=\"font-family: 'Ubuntu Sans';\">) / [1&nbsp;+ a (T - T</span><sub style=\"font-family: 'Ubuntu Sans';\">0</sub><span style=\"font-family: 'Ubuntu Sans';\">)]&nbsp;</span></div><div><br></div><div>where g is a purely geometrical factor with an overall unit of length (m):&nbsp;</div><div><br></div><div><span style=\"font-family: 'Ubuntu Sans';\">g = 4π / (1/r</span><sub style=\"font-family: 'Ubuntu Sans';\">a</sub><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;- 1/r</span><font size=\"2\" style=\"font-family: 'Ubuntu Sans';\"><sub>b</sub></font><span style=\"font-family: 'Ubuntu Sans';\">) &nbsp; for a spherical shell of inner and outer radii of r</span><sub style=\"font-family: 'Ubuntu Sans';\">a</sub><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;and r</span><sub style=\"font-family: 'Ubuntu Sans';\">b</sub><span style=\"font-family: 'Ubuntu Sans';\">.</span></div><div><span style=\"font-family: 'Ubuntu Sans';\"><br></span></div><div><span style=\"font-family: 'Ubuntu Sans';\">Note: for composite objects,&nbsp;</span><span style=\"font-family: 'Ubuntu Sans';\">r</span><sub style=\"font-family: 'Ubuntu Sans';\">a</sub><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;and r</span><sub style=\"font-family: 'Ubuntu Sans';\">b</sub><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;should reflect the center-of-mass coordinates of any heat capacitors at a and b.</span></div><div><span style=\"font-family: 'Ubuntu Sans';\"><br></span></div><div><span style=\"font-family: 'Ubuntu Sans';\">T is taken as the average temperature from the Poisson-Eq solution in spherical coordinates</span><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;</span><span style=\"font-family: 'Ubuntu Sans';\">(quasi-steady-state)</span><span style=\"font-family: 'Ubuntu Sans';\">.</span></div><div><br></div><div><span style=\"font-family: 'Ubuntu Sans';\">The default parameters are those appropriate for copper.</span></div><div><br></div><div>(see also ThermalMatters.Functions.wfCond and&nbsp;ThermalMatters.Functions.poissonSph).</div></body></html>"),
  Diagram(graphics),
  Icon(graphics = {Ellipse(origin = {-4, 0}, lineColor = {230, 97, 0}, fillColor = {255, 163, 72}, fillPattern = FillPattern.Backward, lineThickness = 9, extent = {{-90, 90}, {90, -90}}), Line(origin = {-44, 0}, points = {{44, 0}, {-42, -6}}, color = {224, 27, 36}, thickness = 2), Text(origin = {-44, 11}, textColor = {224, 27, 36}, extent = {{-14, 15}, {14, -15}}, textString = "ra"), Text(origin = {42, 10}, textColor = {129, 61, 156}, extent = {{-12, 14}, {12, -14}}, textString = "rb"), Line(origin = {44, 0}, points = {{44, -6}, {-44, 0}}, color = {129, 61, 156}, thickness = 2)}));
end WFsphShell;