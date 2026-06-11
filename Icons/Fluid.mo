within ThermalMatters.Icons;

partial block Fluid "Basic graphical layout of Fluid HeatCapacitor block"
  extends Icons.Block;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Ellipse(origin = {0, 4}, lineColor = {255, 120, 0}, fillColor = {246, 211, 45}, fillPattern = FillPattern.Backward, lineThickness = 0.5, extent = {{-68, 78}, {68, -78}})}),
    Documentation(info = "<html><head></head><body><p>
Block that has only the basic icon for a fluid heat capacitor (no declarations, no equations). Most components of package ThermalMatters.Components.HeatCapacitors inherit directly or indirectly
from this block.
</p>
</body></html>"),
    Diagram(graphics));
end Fluid;