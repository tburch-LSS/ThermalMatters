within ThermalMatters.Icons;

partial block Block "Basic graphical layout of input/output block"
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(lineColor = {255, 120, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-100, -100}, {100, 100}}), Text(textColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name")}),
    Documentation(info = "<html><head></head><body><p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package ThermalMatters.Blocks inherit directly or indirectly
from this block.
</p>
</body></html>"));
end Block;