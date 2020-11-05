{ifdef(T)}
Translate 1
{endif}
{ifdef(WP)}
Warp Point 1 2
{endif}
{ifdef(WYM)}
Warp YAXIS MAP 1 1
{endif}
{ifdef(WYV)}
Warp YAXIS VERTICAL 1 1
{endif}
{ifdef(WE)}
Warp Ellipse 1 2 3 4
{endif}
{ifdef(SS)}
Spline 0.1
Angular
FRONT
 0.0	1.0
15.0	1.0
30.0	1.0
45.0	1.0
60.0	1.0
75.0	1.0
90.0	1.0
left	0.0
right	0.0
spherical
end
{endif}
{ifdef(SX)}
Spline 0.1
Angular
FRONT
 0.0	1.0
15.0	1.0
30.0	1.0
45.0	1.0
60.0	1.0
75.0	1.0
90.0	1.0
left	0.0
right	0.0
xsweep
end
{endif}
{ifdef(SY)}
Spline 0.1
FRONT
 0.0	0.4
 0.5	0.2
 1.0	0.4
left	0.0
right	0.0
ysweep
end
{endif}
EXIT
