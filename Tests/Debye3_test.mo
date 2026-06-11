model Debye3_test
  Modelica.Blocks.Sources.RealExpression d3mod(y = ThermalMatters.Utilities.debye3(ramp.y)) annotation(
    Placement(transformation(origin = {-55, 30}, extent = {{-25, -10}, {25, 10}})));
  Modelica.Blocks.Sources.RealExpression d3gsl(y = GNU_ScientificLibrary.Functions.specfunc.debye_D3(ramp.y))  annotation(
    Placement(transformation(origin = {-50, -10}, extent = {{-50, -10}, {50, 10}})));
  Modelica.Blocks.Sources.Ramp ramp(height = 1000, duration = 1000)  annotation(
    Placement(transformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add diff(k2 = -1)  annotation(
    Placement(transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division division annotation(
    Placement(transformation(origin = {90, 4}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(d3mod.y, diff.u1) annotation(
    Line(points = {{-27.5, 30}, {20, 30}, {20, 16}, {38, 16}}, color = {0, 0, 127}));
  connect(d3gsl.y, diff.u2) annotation(
    Line(points = {{5, -10}, {20, -10}, {20, 4}, {38, 4}}, color = {0, 0, 127}));
  connect(diff.y, division.u1) annotation(
    Line(points = {{62, 10}, {78, 10}}, color = {0, 0, 127}));
  connect(d3gsl.y, division.u2) annotation(
    Line(points = {{6, -10}, {70, -10}, {70, -2}, {78, -2}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.1.0")),
  Diagram(coordinateSystem(extent = {{-120, 40}, {100, -20}})),
  version = "",
  experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.0005));
end Debye3_test;