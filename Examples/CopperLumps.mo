within ThermalMatters.Examples;

model CopperLumps
  extends Modelica.Icons.Example;
  Modelica.Units.SI.ThermalConductivity kappa;
  Modelica.Units.SI.Conductivity sigma;
  Components.HeatCapacitors.DebyeSolid debyeSolid(T(start = 1, fixed = true), T_D= copper.T_D, Mdens= copper.Mdens, effAm = copper.effAm, V = 1/copper.Mdens)  annotation(
    Placement(transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Components.HeatCapacitors.DebyeGruenSolid debyeGruenSolid(T(start = 1, fixed = true), T0= copper.T0, T_D= copper.T_D, Mdens= copper.Mdens, effAm = copper.effAm, V = 1/copper.Mdens, alpha0 = copper.alpha0)  annotation(
    Placement(transformation(origin = {-30, -30}, extent = {{10, 10}, {-10, -10}}, rotation = 270)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection_d annotation(
    Placement(transformation(origin = {10, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T(displayUnit = "K") = 350)  annotation(
    Placement(transformation(origin = {90, 0}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection_dg annotation(
    Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sensors.RelTemperatureSensor relTemperatureSensor annotation(
    Placement(transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor constCpSolid(T(start = 1, fixed = true, displayUnit = "K"), C = 385)  annotation(
    Placement(transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection_c annotation(
    Placement(transformation(origin = {30, 70}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  Materials.Copper copper annotation(
    Placement(transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}})));
equation
  (kappa,sigma) = Functions.wfCond(debyeSolid.T,copper.kappa0,copper.T0,copper.a0,copper.Tkmax);
  connect(debyeSolid.port, convection_d.solid) annotation(
    Line(points = {{-20, 30}, {0, 30}}, color = {191, 0, 0}));
  connect(debyeGruenSolid.port, convection_dg.solid) annotation(
    Line(points = {{-20, -30}, {0, -30}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, convection_d.fluid) annotation(
    Line(points = {{80, 0}, {70, 0}, {70, 30}, {20, 30}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, convection_dg.fluid) annotation(
    Line(points = {{80, 0}, {70, 0}, {70, -30}, {20, -30}}, color = {191, 0, 0}));
  connect(relTemperatureSensor.port_a, debyeSolid.port) annotation(
    Line(points = {{-10, 10}, {-10, 30}, {-20, 30}}, color = {191, 0, 0}));
  connect(relTemperatureSensor.port_b, debyeGruenSolid.port) annotation(
    Line(points = {{-10, -10}, {-10, -30}, {-20, -30}}, color = {191, 0, 0}));
  connect(const.y, convection_c.Gc) annotation(
    Line(points = {{39, 0}, {30, 0}, {30, 60}}, color = {0, 0, 127}));
  connect(constCpSolid.port, convection_c.solid) annotation(
    Line(points = {{-20, 70}, {20, 70}}, color = {191, 0, 0}));
  connect(fixedTemperature.port, convection_c.fluid) annotation(
    Line(points = {{80, 0}, {70, 0}, {70, 70}, {40, 70}}, color = {191, 0, 0}));
  connect(const.y, convection_d.Gc) annotation(
    Line(points = {{40, 0}, {10, 0}, {10, 20}}, color = {0, 0, 127}));
  connect(const.y, convection_dg.Gc) annotation(
    Line(points = {{40, 0}, {10, 0}, {10, -20}}, color = {0, 0, 127}));
  annotation(preferredView = "model", 
    Diagram(coordinateSystem(extent = {{-40, 80}, {100, -40}})),
  experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-06, Interval = 0.001),
  Documentation(info = "<html><head></head><body>A simple convective heating simulation of two copper masses, one with its heat capacity given via the Debye model (isotropic, harmonic), the other via the Debye-Grüneisen model (isotropic, slightly anharmonic). The heating model may be oversimplified, but the relevant properties of the solids are thereby revealed...<div><br></div><div>Looking at the specific heat capacities as functions of the temperature, we can see the correct T<sup>3</sup>-dependence at low temperatures, turning over to a constant at higher T:<br><div><br></div><img src=\"modelica://ThermalMatters/Examples/CopperLumps_cps_vs_T.png\"></div><div><br></div><div>Note the slightly higher c<sub>p</sub> values for the&nbsp;Debye-Grüneisen model, resulting in a higher temperature for the Debye model after the same amount of time:<br><div><br></div><div><img src=\"modelica://ThermalMatters/Examples/CopperLumps_DeltaT_vs_time.png\"></div><div><br></div><div>This results from the small anharmonicity in the interatomic potentials in the Debye-Grüneisen model (resulting in a non-zero thermal expansion coefficient,&nbsp;<span style=\"font-family: 'Ubuntu Sans';\">α</span>). According to Grüneisen's law, the <span style=\"font-family: 'Ubuntu Sans';\">α</span>/c<sub>p</sub> ratio is temperature-independent:</div><div><br></div><div><img src=\"modelica://ThermalMatters/Examples/CopperLumps_cp_alpha_vs_T.png\"></div><div><br></div></div><div><div>By comparison, the same mass with a constant heat capacity (taken as that of 1 kg of copper at room temperature: 385 J/K at 293 K) is 50 K cooler after the 3-minute heating simulation:</div><div><br></div><div><img src=\"modelica://ThermalMatters/Examples/CopperLumps_T_vs_time.png\"></div></div><div><br></div></body></html>", revisions = "<html><head></head><body><table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tbody><tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td>May 12, 2026</td>
    <td>

<table border=\"0\">
<tbody><tr><td>
         Initial version implemented by T. Burch.<br></td></tr></tbody></table>
</td></tr>

</tbody></table>
</body></html>"));
end CopperLumps;