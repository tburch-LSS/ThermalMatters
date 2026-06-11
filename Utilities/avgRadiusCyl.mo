within ThermalMatters.Utilities;

function avgRadiusCyl "Cylindrical average radius function Ravg = avgRadiusCyl(ra,rb)"
  extends Modelica.Icons.Function;
  import Modelica.Units.SI;
  import const = Modelica.Constants;
  input SI.Length ra "= Radius (m)";
  input SI.Length rb "= Radius (m)";
  output SI.Length ravg "= Avg Radius (m)";
protected
  Real ra2, rb2;
algorithm
  ra2 := ra * ra;
  rb2 := rb * rb;
  ravg := (2.0/3.0) * (rb2*rb - ra2*ra)/(rb2 - ra2);
  annotation(preferredView = "text", 
    Documentation(info = "<html><head></head><body><h4>Syntax</h4>
<blockquote><pre>Ravg = ThermalMatters.Functions.<b>avgRadiusCyl</b>(ra,rb);</pre></blockquote>

<h4>Description</h4>
<p>Function for calculating the average radius (r<sub>avg</sub>) in a cylindrical geometry:&nbsp;</p><p>r<sub>avg</sub> = (2/3)&nbsp;(r<sub>b</sub><sup>3</sup>&nbsp;- r<sub>a</sub><sup>3</sup>) / (r<sub>b</sub><sup>2</sup> - r<sub>a</sub><sup>2</sup>)&nbsp;</p><p>This can be used to find the center-of-mass coordinate of a cylindrical-shell heat capacitor which may be part of a composite pipe.</p>

<h4>Example</h4>
<blockquote><pre><br></pre></blockquote>

<h4>See also</h4>
<p><br></p>
</body></html>"));
end avgRadiusCyl;