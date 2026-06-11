within ThermalMatters.Icons;

partial block Solid "Basic graphical layout of Solid HeatCapacitor block"
  extends ThermalMatters.Icons.Block;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Polygon(origin = {3, 9}, fillColor = {255, 120, 0}, fillPattern = FillPattern.VerticalCylinder, points = {{-51, 59}, {-67, 5}, {-57, -43}, {-35, -73}, {15, -79}, {45, -71}, {65, -45}, {75, 1}, {61, 37}, {31, 69}, {-1, 73}, {-29, 71}, {-37, 65}, {-51, 59}}), Line(origin = {-54.797, 1.97308}, points = {{6.79701, 66.0269}, {-17.203, 14.0269}, {-11.203, -33.9731}, {22.797, -65.9731}})}),
    Documentation(info = "<html><head></head><body><p>
Block that has only the basic icon for a solid heat capacitor (no declarations, no equations). Most components of package ThermalMatters.Components.HeatCapacitors inherit directly or indirectly
from this block.
</p>
</body></html>"),
  Diagram(graphics));
end Solid;