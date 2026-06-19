within ThermalMatters.Functions;
function wfCond "Wiedemann-Franz thermal conductivity function (kappa,sigma) = wfCond(T,kappa0,T0,a0,Tkmax)"
  extends Modelica.Icons.Function;
  import Modelica.Units.SI;
  input SI.Temperature T "= Temperature (K)";
  input SI.ThermalConductivity kappa0 "= Thermal conductivity at T0 (W/(K m))";
  input SI.Temperature T0 "= Reference_Temperature (K)";
  input SI.LinearTemperatureCoefficient a0 "Linear temperature coefficient (1/K)";
  input SI.Temperature Tkmax "= Temperature of max kappa (K)";
  output SI.ThermalConductivity kappa "= Thermal conductivity (W/(K m))";
  output SI.Conductivity sigma "= Estim. Elec. Conductivity (S/m)";
protected
  parameter Real L = 2.44e-8 "Lorenz number (V^2 K^-2)";
  SI.Temperature Tsing "Singular Temperature (K)";
  SI.Temperature Tstar "Temperature where a=0 (K)";
  SI.LinearTemperatureCoefficient a "Linear temperature coefficient (1/K)";
  SI.QuadraticTemperatureCoefficient b;
algorithm
  Tsing := T0 - 1/a0;
  Tstar := (Tkmax*Tkmax - T0/a0) / Tsing;
  b := a0 / (T0 - Tstar);
  a := b * (T - Tstar);
  kappa := kappa0 * (T / T0) / (1 + a * (T - T0));
  sigma := kappa / (L * T);
  annotation(preferredView = "text", 
    Documentation(info = "<html><head></head><body><h4>Syntax</h4>
<blockquote><pre>(kappa,sigma) = ThermalMatters.Functions.<b>wfCond</b>(T,kapp0,T0,a0,Tkmax);</pre></blockquote>

<h4>Description</h4>
<p><span style=\"font-family: 'Ubuntu Sans';\">Model of a temperature-dependent conductivity obeying the Wiedemann-Franz relation:</span></p><div style=\"font-family: 'Ubuntu Sans';\">κ / σ = L T&nbsp;</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">where κ is the thermal conductivity, σ is the electrical conductivity, L is known as the Lorenz number, and T is the absolute temperature.</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">For good electrical conductors (e.g., metals), both conductivities are dominated by the (nearly free) conduction electrons. The empirical value of the Lorenz number is rather close to the free-electron model value:</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">L = π<sup>2</sup>&nbsp;k<sub>B</sub><sup>2&nbsp;</sup>/ (3 e<sup>2</sup>)&nbsp; ≅ 2.44 × 10<sup>-8</sup>&nbsp;V<sup>2</sup>&nbsp;K<sup>-2</sup>&nbsp;</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">The electrical resistivity (1/σ) is well modeled with a residual plus a linear temperature response:</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">σ = σ<sub>0</sub>&nbsp;/ [1 + a (T - T<sub>0</sub>)]&nbsp;</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">The overall thermal conductivity is then...&nbsp;</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">κ =&nbsp;(T/T<sub>0</sub>) κ<sub>0</sub>&nbsp;/ [1 + a (T - T<sub>0</sub>)]&nbsp;</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">where one may set κ<sub>0</sub>&nbsp;using Lσ<sub>0</sub>T<sub>0</sub>, or the known thermal conductivity at T<sub>0</sub>.&nbsp;</div><div style=\"font-family: 'Ubuntu Sans';\">Note: given this form and constant a, it is possible to encounter a singularity at T<sub>s</sub>&nbsp;= T<sub>0</sub> - 1/a.</div><div style=\"font-family: 'Ubuntu Sans';\">To handle this, a is taken to be a function of temperature: a(T). A maximum of κ(T) is then bound to occur instead as long as:</div><div style=\"font-family: 'Ubuntu Sans';\">T<sub>k,max</sub><sup>2</sup> da/dT|<font size=\"1\"><sub>Tkmax</sub></font>&nbsp;+ T<sub>0</sub> a<sub>k,max</sub> = 1 .</div><div style=\"font-family: 'Ubuntu Sans';\"><br></div><div style=\"font-family: 'Ubuntu Sans';\">T<sub>k,max</sub>&nbsp;is O(10K) for most metals. For the general solution for a(T), we use a linear approximation:&nbsp;</div><div style=\"font-family: 'Ubuntu Sans';\">a(T) = a<sub>0</sub> + (T - T<sub>0</sub>) (a<sub>0</sub>&nbsp;- a<sub>k,max</sub>) / (T<sub>0</sub>&nbsp;- T<sub>k.max</sub>)&nbsp;</div><div style=\"font-family: 'Ubuntu Sans';\">This approximation works well as long as T &gt;&gt; T<sub>k,max</sub> .&nbsp;</div>

<p>For more details, see <a href=\"http://en.wikipedia.org/wiki/Wiedemann%E2%80%93Franz_law\">Wikipedia</a>.
</p>

<h4>Example</h4>
<blockquote><pre><br></pre></blockquote>

<h4>See also</h4>
<p><br></p>
</body></html>", revisions = "<html><head></head><body><table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tbody><tr><th>Date</th> <th align=\"left\">Description</th></tr>

<tr><td>May 26, 2026</td>
    <td>

<table border=\"0\">
<tbody><tr><td>
         Initial version implemented by T. Burch.<br></td></tr></tbody></table>
</td></tr>

</tbody></table>
</body></html>"));
end wfCond;