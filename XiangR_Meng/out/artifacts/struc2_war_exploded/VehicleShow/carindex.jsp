<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2019/12/24
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>基于three.js的炫酷动画景观特效|DEMO1_jQuery之家-自由分享jQuery、html5、css3的插件库</title>
    <link href="https://fonts.googleapis.com/css?family=Barlow:400,800" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/base.css" />
    <script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");</script>
</head>
<body class="demo-1">
<main>
    <div class="frame">
        <%--<div class="frame__title-wrap">--%>
            <%--<h1 class="frame__title">Interactive Landscape</h1>--%>
        <%--</div>--%>

        <%--<div class="frame__demos">--%>
            <%--<a href="index.html" class="frame__demo frame__demo--current">demo 1</a>--%>
            <%--<a href="index2.html" class="frame__demo">demo 2</a>--%>
            <%--<a href="index3.html" class="frame__demo">demo 3</a>--%>
        <%--</div>--%>
    </div>
    <div class="content">
        <canvas class="landscape"></canvas>
        <script id="custom-vertex" type="x-shader/x-vertex">

					//
					// GLSL textureless classic 3D noise "cnoise",
					// with an RSL-style periodic variant "pnoise".
					// Author:  Stefan Gustavson (stefan.gustavson@liu.se)
					// Version: 2011-10-11
					//
					// Many thanks to Ian McEwan of Ashima Arts for the
					// ideas for permutation and gradient selection.
					//
					// Copyright (c) 2011 Stefan Gustavson. All rights reserved.
					// Distributed under the MIT license. See LICENSE file.
					// https://github.com/stegu/webgl-noise
					//

					vec3 mod289(vec3 x)
					{
						return x - floor(x * (1.0 / 289.0)) * 289.0;
					}

					vec4 mod289(vec4 x)
					{
						return x - floor(x * (1.0 / 289.0)) * 289.0;
					}

					vec4 permute(vec4 x)
					{
						return mod289(((x*34.0)+1.0)*x);
					}

					vec4 taylorInvSqrt(vec4 r)
					{
						return 1.79284291400159 - 0.85373472095314 * r;
					}

					vec3 fade(vec3 t) {
						return t*t*t*(t*(t*6.0-15.0)+10.0);
					}

					// Classic Perlin noise
					float cnoise(vec3 P)
					{
						vec3 Pi0 = floor(P); // Integer part for indexing
						vec3 Pi1 = Pi0 + vec3(1.0); // Integer part + 1
						Pi0 = mod289(Pi0);
						Pi1 = mod289(Pi1);
						vec3 Pf0 = fract(P); // Fractional part for interpolation
						vec3 Pf1 = Pf0 - vec3(1.0); // Fractional part - 1.0
						vec4 ix = vec4(Pi0.x, Pi1.x, Pi0.x, Pi1.x);
						vec4 iy = vec4(Pi0.yy, Pi1.yy);
						vec4 iz0 = Pi0.zzzz;
						vec4 iz1 = Pi1.zzzz;

						vec4 ixy = permute(permute(ix) + iy);
						vec4 ixy0 = permute(ixy + iz0);
						vec4 ixy1 = permute(ixy + iz1);

						vec4 gx0 = ixy0 * (1.0 / 7.0);
						vec4 gy0 = fract(floor(gx0) * (1.0 / 7.0)) - 0.5;
						gx0 = fract(gx0);
						vec4 gz0 = vec4(0.5) - abs(gx0) - abs(gy0);
						vec4 sz0 = step(gz0, vec4(0.0));
						gx0 -= sz0 * (step(0.0, gx0) - 0.5);
						gy0 -= sz0 * (step(0.0, gy0) - 0.5);

						vec4 gx1 = ixy1 * (1.0 / 7.0);
						vec4 gy1 = fract(floor(gx1) * (1.0 / 7.0)) - 0.5;
						gx1 = fract(gx1);
						vec4 gz1 = vec4(0.5) - abs(gx1) - abs(gy1);
						vec4 sz1 = step(gz1, vec4(0.0));
						gx1 -= sz1 * (step(0.0, gx1) - 0.5);
						gy1 -= sz1 * (step(0.0, gy1) - 0.5);

						vec3 g000 = vec3(gx0.x,gy0.x,gz0.x);
						vec3 g100 = vec3(gx0.y,gy0.y,gz0.y);
						vec3 g010 = vec3(gx0.z,gy0.z,gz0.z);
						vec3 g110 = vec3(gx0.w,gy0.w,gz0.w);
						vec3 g001 = vec3(gx1.x,gy1.x,gz1.x);
						vec3 g101 = vec3(gx1.y,gy1.y,gz1.y);
						vec3 g011 = vec3(gx1.z,gy1.z,gz1.z);
						vec3 g111 = vec3(gx1.w,gy1.w,gz1.w);

						vec4 norm0 = taylorInvSqrt(vec4(dot(g000, g000), dot(g010, g010), dot(g100, g100), dot(g110, g110)));
						g000 *= norm0.x;
						g010 *= norm0.y;
						g100 *= norm0.z;
						g110 *= norm0.w;
						vec4 norm1 = taylorInvSqrt(vec4(dot(g001, g001), dot(g011, g011), dot(g101, g101), dot(g111, g111)));
						g001 *= norm1.x;
						g011 *= norm1.y;
						g101 *= norm1.z;
						g111 *= norm1.w;

						float n000 = dot(g000, Pf0);
						float n100 = dot(g100, vec3(Pf1.x, Pf0.yz));
						float n010 = dot(g010, vec3(Pf0.x, Pf1.y, Pf0.z));
						float n110 = dot(g110, vec3(Pf1.xy, Pf0.z));
						float n001 = dot(g001, vec3(Pf0.xy, Pf1.z));
						float n101 = dot(g101, vec3(Pf1.x, Pf0.y, Pf1.z));
						float n011 = dot(g011, vec3(Pf0.x, Pf1.yz));
						float n111 = dot(g111, Pf1);

						vec3 fade_xyz = fade(Pf0);
						vec4 n_z = mix(vec4(n000, n100, n010, n110), vec4(n001, n101, n011, n111), fade_xyz.z);
						vec2 n_yz = mix(n_z.xy, n_z.zw, fade_xyz.y);
						float n_xyz = mix(n_yz.x, n_yz.y, fade_xyz.x);
						return 2.2 * n_xyz;
					}

					// Classic Perlin noise, periodic variant
					float pnoise(vec3 P, vec3 rep)
					{
						vec3 Pi0 = mod(floor(P), rep); // Integer part, modulo period
						vec3 Pi1 = mod(Pi0 + vec3(1.0), rep); // Integer part + 1, mod period
						Pi0 = mod289(Pi0);
						Pi1 = mod289(Pi1);
						vec3 Pf0 = fract(P); // Fractional part for interpolation
						vec3 Pf1 = Pf0 - vec3(1.0); // Fractional part - 1.0
						vec4 ix = vec4(Pi0.x, Pi1.x, Pi0.x, Pi1.x);
						vec4 iy = vec4(Pi0.yy, Pi1.yy);
						vec4 iz0 = Pi0.zzzz;
						vec4 iz1 = Pi1.zzzz;

						vec4 ixy = permute(permute(ix) + iy);
						vec4 ixy0 = permute(ixy + iz0);
						vec4 ixy1 = permute(ixy + iz1);

						vec4 gx0 = ixy0 * (1.0 / 7.0);
						vec4 gy0 = fract(floor(gx0) * (1.0 / 7.0)) - 0.5;
						gx0 = fract(gx0);
						vec4 gz0 = vec4(0.5) - abs(gx0) - abs(gy0);
						vec4 sz0 = step(gz0, vec4(0.0));
						gx0 -= sz0 * (step(0.0, gx0) - 0.5);
						gy0 -= sz0 * (step(0.0, gy0) - 0.5);

						vec4 gx1 = ixy1 * (1.0 / 7.0);
						vec4 gy1 = fract(floor(gx1) * (1.0 / 7.0)) - 0.5;
						gx1 = fract(gx1);
						vec4 gz1 = vec4(0.5) - abs(gx1) - abs(gy1);
						vec4 sz1 = step(gz1, vec4(0.0));
						gx1 -= sz1 * (step(0.0, gx1) - 0.5);
						gy1 -= sz1 * (step(0.0, gy1) - 0.5);

						vec3 g000 = vec3(gx0.x,gy0.x,gz0.x);
						vec3 g100 = vec3(gx0.y,gy0.y,gz0.y);
						vec3 g010 = vec3(gx0.z,gy0.z,gz0.z);
						vec3 g110 = vec3(gx0.w,gy0.w,gz0.w);
						vec3 g001 = vec3(gx1.x,gy1.x,gz1.x);
						vec3 g101 = vec3(gx1.y,gy1.y,gz1.y);
						vec3 g011 = vec3(gx1.z,gy1.z,gz1.z);
						vec3 g111 = vec3(gx1.w,gy1.w,gz1.w);

						vec4 norm0 = taylorInvSqrt(vec4(dot(g000, g000), dot(g010, g010), dot(g100, g100), dot(g110, g110)));
						g000 *= norm0.x;
						g010 *= norm0.y;
						g100 *= norm0.z;
						g110 *= norm0.w;
						vec4 norm1 = taylorInvSqrt(vec4(dot(g001, g001), dot(g011, g011), dot(g101, g101), dot(g111, g111)));
						g001 *= norm1.x;
						g011 *= norm1.y;
						g101 *= norm1.z;
						g111 *= norm1.w;

						float n000 = dot(g000, Pf0);
						float n100 = dot(g100, vec3(Pf1.x, Pf0.yz));
						float n010 = dot(g010, vec3(Pf0.x, Pf1.y, Pf0.z));
						float n110 = dot(g110, vec3(Pf1.xy, Pf0.z));
						float n001 = dot(g001, vec3(Pf0.xy, Pf1.z));
						float n101 = dot(g101, vec3(Pf1.x, Pf0.y, Pf1.z));
						float n011 = dot(g011, vec3(Pf0.x, Pf1.yz));
						float n111 = dot(g111, Pf1);

						vec3 fade_xyz = fade(Pf0);
						vec4 n_z = mix(vec4(n000, n100, n010, n110), vec4(n001, n101, n011, n111), fade_xyz.z);
						vec2 n_yz = mix(n_z.xy, n_z.zw, fade_xyz.y);
						float n_xyz = mix(n_yz.x, n_yz.y, fade_xyz.x);
						return 2.2 * n_xyz;
					}

					#define PI 3.1415926535897932384626433832795

					uniform float time;
					uniform float maxHeight;
					uniform float speed;
					uniform float distortCenter;
					uniform float roadWidth;
					varying float vDisplace;

					varying float fogDepth;

					void main(){

						float t = time * speed;
						float wRoad = distortCenter;
						float wRoad2 = wRoad * 0.5;

						float angleCenter = uv.y * PI*4.0;
						angleCenter += t * 0.9;

						float centerOff = (
							sin(angleCenter) +
							sin(angleCenter*0.5)
						) * wRoad;


						vec3 noiseIn = vec3(uv, 1.0)*10.0;
						float noise = cnoise(vec3(noiseIn.x, noiseIn.y + t, noiseIn.z));
						noise += 1.0;
						float h = noise;
						float angle = (uv.x - centerOff) * PI;
						float f = abs(cos(angle));
						h *= pow(f, 1.5 + roadWidth);


						vDisplace = h;


						h*=maxHeight;

						vec3 transformed = vec3( position.x, position.y, position.z + h );


						vec4 mvPosition = modelViewMatrix * vec4( transformed, 1.0 );
						gl_Position = projectionMatrix * mvPosition;

						fogDepth = -mvPosition.z;

					}

				</script>
        <script id="custom-fragment" type="x-shader/x-fragment">
					uniform float time;
					uniform vec3 color;
					uniform sampler2D pallete;
					varying float vDisplace;

					uniform vec3 fogColor;
					uniform float fogNear;
					uniform float fogFar;
					varying float fogDepth;

					void main(){

						vec2 stripPos = vec2( 0.0, vDisplace );
						vec4 stripColor = texture2D( pallete, stripPos );
						stripColor *= pow(1.0-vDisplace, 1.0);

						gl_FragColor = stripColor;

						#ifdef USE_FOG
							float fogFactor = smoothstep( fogNear, fogFar, fogDepth );
							gl_FragColor.rgb = mix( gl_FragColor.rgb, fogColor, fogFactor );
						#endif
					}

				</script>
        <h2 class="content__title">VehicleChange</h2>
        <p class="content__subtitle">Version 5.5</p>
    </div>
    <div class="overlay"></div>
</main>
<script src="../js/vendor/three.min.js"></script>
<script src="../js/vendor/Sky.js"></script>
<script src="../js/vendor/hammer.min.js"></script>
<script src="../js/vendor/charming.min.js"></script>
<script src="../js/vendor/TweenMax.min.js"></script>
<script src="../js/demo1.js"></script>
</body>
</html>
