within ThermalMatters.Examples;

model CoolingPipe
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Temperature Tin (displayUnit = "K")= 300 "K; Inner T";
  parameter Modelica.Units.SI.Temperature Tout (displayUnit = "K")= 280 "K; Outer T";
  final parameter Modelica.Units.SI.Temperature Ta_start = Tin + 0.25*(Tout - Tin) "K; Initial T at a";
  final parameter Modelica.Units.SI.Temperature Tb_start = Tin + 0.75*(Tout - Tin) "K; Initial T at b";
  Modelica.Thermal.HeatTransfer.Components.Convection inner_convect annotation(
    Placement(transformation(origin = {-28, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature inner_Temp annotation(
    Placement(transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection outer_convect annotation(
    Placement(transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature outer_Temp(T= Tout)  annotation(
    Placement(transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.Constant inner_Gc(k = 1.e5)  annotation(
    Placement(transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant outer_Gc(k = 2.e5)  annotation(
    Placement(transformation(origin = {70, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Components.ThermalConductors.WFcylShell wFcylShell(rb = 0.11, a = alum.a, kappa0 = alum.kappa0, T0 = alum.T0)  annotation(
    Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}})));
  Components.CompositeObjects.DebyeWFPipe debyeWFPipe(rout = 0.11, T_start = 0.5*(Tout + Tin), T_D = alum.T_D, effAm = alum.effAm, Mdens = alum.Mdens, kappa0 = alum.kappa0, a = alum.a, T0 = alum.T0)  annotation(
    Placement(transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Ramp rampT(height = 73, duration = 0.5, offset = Tin, startTime = 2)  annotation(
    Placement(transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}})));
  Materials.Aluminum alum annotation(
    Placement(transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(inner_Temp.port, inner_convect.fluid) annotation(
    Line(points = {{-60, -10}, {-38, -10}}, color = {191, 0, 0}));
  connect(outer_Temp.port, outer_convect.fluid) annotation(
    Line(points = {{80, -10}, {60, -10}}, color = {191, 0, 0}));
  connect(inner_Gc.y, inner_convect.Gc) annotation(
    Line(points = {{-38, 30}, {-28, 30}, {-28, 0}}, color = {0, 0, 127}));
  connect(outer_Gc.y, outer_convect.Gc) annotation(
    Line(points = {{60, 30}, {50, 30}, {50, 0}}, color = {0, 0, 127}));
  connect(wFcylShell.port_a, inner_convect.solid) annotation(
    Line(points = {{0, -30}, {-10, -30}, {-10, -10}, {-18, -10}}, color = {191, 0, 0}));
  connect(wFcylShell.port_b, outer_convect.solid) annotation(
    Line(points = {{20, -30}, {30, -30}, {30, -10}, {40, -10}}, color = {191, 0, 0}));
  connect(debyeWFPipe.port_a, inner_convect.solid) annotation(
    Line(points = {{0, 10}, {-10, 10}, {-10, -10}, {-18, -10}}, color = {191, 0, 0}));
  connect(debyeWFPipe.port_b, outer_convect.solid) annotation(
    Line(points = {{20, 10}, {30, 10}, {30, -10}, {40, -10}}, color = {191, 0, 0}));
  connect(rampT.y, inner_Temp.T) annotation(
    Line(points = {{-98, -10}, {-82, -10}}, color = {0, 0, 127}));
  annotation(preferredView = "model", 
    Diagram(coordinateSystem(extent = {{-120, 40}, {100, -40}})),
  experiment(StartTime = 0, StopTime = 8, Tolerance = 1e-06, Interval = 0.005),
  Documentation(info = "<html><head></head><body>External cooling of an Aluminum pipe which experiences a sharp rise in the temperature of the internal fluid. The pipe is simulated in two ways: one via a simple cylindrical conductor, the other via two conductors \"connected\" to a heat capacitance at the center of mass. For the moment, the convective heating and cooling are over-simplified via constant conductances, rather than taking into account any physics of the fluid flows.<div><br></div><div>At t=2s, the temperature of the internally convecting fluid rises from 300 to 373K, while the fluid on the outside remains at 280K. The resulting temperatures at both surfaces, as well as the temperatures used for the conductors and center-of-mass heat capacitor can be plotted vs simulation time:<br><div><br><div><img src=\"modelica://ThermalMatters/Examples/CoolingPipe_T_vs_time.png\"></div></div><div><br></div><div>Including the heat capacitance of the pipe can substantially affect the dynamics of the heat flow (note, however, the steady-state agreement):&nbsp;</div><br><div><img src=\"modelica://ThermalMatters/Examples/CoolingPipe_Qflow_vs_time.png\"></div><div><br></div><br><div><img src=\"modelica://ThermalMatters/Examples/CoolingPipe_Tcom_vs_time.png\"></div><div><br></div><div>Note also the spatio-temporal variation of the thermal conductivities...&nbsp;</div><br><div><img src=\"modelica://ThermalMatters/Examples/CoolingPipe_kappa_vs_time.png\"></div><div><br></div><div>... and the specific heat capacity:&nbsp;</div><div><br></div><div><img src=\"modelica://ThermalMatters/Examples/CoolingPipe_cp_vs_time.png\"></div></div></body></html>", revisions = "<html><head></head><body><table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tbody><tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td>June 8, 2026</td>
    <td>

<table border=\"0\">
<tbody><tr><td>
         Initial version implemented by T. Burch.<br></td></tr></tbody></table>
</td></tr>

</tbody></table>
</body></html>"));
end CoolingPipe;