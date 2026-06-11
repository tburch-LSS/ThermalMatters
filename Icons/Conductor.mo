within ThermalMatters.Icons;

partial block Conductor "Basic graphical layout of ThermalConductor block"
  extends Icons.Block;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Rectangle(origin = {0, -1}, lineColor = {255, 120, 0}, fillColor = {230, 97, 0}, fillPattern = FillPattern.Forward, lineThickness = 0.5, extent = {{-94, 41}, {94, -41}})}),
    Documentation(info = "<html><head></head><body><p>
Block that has only the basic icon for a thermal conductor (no declarations, no equations). Most components of package ThermalMatters.Components.ThermalConductors inherit directly or indirectly
from this block.
</p>
</body></html>"),
    Diagram(graphics));
end Conductor;