within ThermalMatters.Utilities;

function avgRadiusSph "Spherical average radius function Ravg = avgRadiusSph(ra,rb)"
  extends Modelica.Icons.Function;
  import Modelica.Units.SI;
  import const = Modelica.Constants;
  input SI.Length ra "= Radius (m)";
  input SI.Length rb "= Radius (m)";
  output SI.Length ravg "= Avg Radius (m)";
protected
  Real ra3, rb3;
algorithm
  ra3 := ra * ra * ra;
  rb3 := rb * rb * rb;
  ravg := 0.75 * (rb3*rb - ra3*ra)/(rb3 - ra3);
  annotation(preferredView = "text", 
    Documentation(info = "<html><head></head><body><h4>Syntax</h4>
<blockquote><pre>Ravg = ThermalMatters.Functions.<b>avgRadiusSph</b>(ra,rb);</pre></blockquote>

<h4>Description</h4>
<p>Function for calculating the average radius (r<sub>avg</sub>) in a spherical geometry:&nbsp;</p><p>r<sub>avg</sub> =&nbsp;<span style=\"font-family: 'Ubuntu Sans';\">(3/4)&nbsp;(r</span><sub style=\"font-family: 'Ubuntu Sans';\">b</sub><sup style=\"font-family: 'Ubuntu Sans';\">4</sup><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;- r</span><sub style=\"font-family: 'Ubuntu Sans';\">a</sub><sup style=\"font-family: 'Ubuntu Sans';\">4</sup><span style=\"font-family: 'Ubuntu Sans';\">) / (r</span><sub style=\"font-family: 'Ubuntu Sans';\">b</sub><sup style=\"font-family: 'Ubuntu Sans';\">3</sup><span style=\"font-family: 'Ubuntu Sans';\">&nbsp;- r</span><sub style=\"font-family: 'Ubuntu Sans';\">a</sub><sup style=\"font-family: 'Ubuntu Sans';\">3</sup><span style=\"font-family: 'Ubuntu Sans';\">)&nbsp;</span></p><p>This can be used to find the center-of-mass coordinate of a spherical-shell heat capacitor which may be part of a composite vessel or ball.</p>

<h4>Example</h4>
<blockquote><pre><br></pre></blockquote>

<h4>See also</h4>
<p><br></p>
</body></html>"));
end avgRadiusSph;