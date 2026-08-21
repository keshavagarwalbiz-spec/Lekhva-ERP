New-Item -Path "apps/web/package.json" -ItemType File -Force -Value '{
  "name": "@lekhva/web",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "14.2.3",
    "react": "^18",
    "react-dom": "^18",
    "framer-motion": "^11.2.10",
    "lucide-react": "^0.394.0",
    "clsx": "^2.1.1",
    "tailwind-merge": "^2.3.0"
  },
  "devDependencies": {
    "typescript": "^5",
    "@types/node": "^20",
    "@types/react": "^18",
    "@types/react-dom": "^18",
    "postcss": "^8",
    "tailwindcss": "^3.4.1",
    "eslint": "^8",
    "eslint-config-next": "14.2.3"
  }
}
'

New-Item -Path "apps/web/src/app" -ItemType Directory -Force;

New-Item -Path "apps/web/src/lib/utils.ts" -ItemType File -Force -Value 'import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
';

New-Item -Path "apps/web/src/app/globals.css" -ItemType File -Force -Value '@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --background: #0b0a09;
  --foreground: #f5f5f5;
}

body {
  background-color: var(--background);
  color: var(--foreground);
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}
';

New-Item -Path "apps/web/src/app/layout.tsx" -ItemType File -Force -Value 'import "./globals.css";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Lekhva ERP",
  description: "Lekhva makes you compliant. Not another ERP on a subscription, a partner in your growth.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased bg-[#0b0a09] text-white">
        {children}
      </body>
    </html>
  );
}
';


New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion, useScroll, useTransform } from "framer-motion";
import { ArrowRight, Code2, Database, ShieldCheck, Zap } from "lucide-react";
import { useRef } from "react";

const StarIcon = () => (
  <svg viewBox="0 0 24 24" aria-hidden="true" className="w-6 h-6 fill-amber-500 opacity-80">
    <path d="M12 0Q13.1 10.9 24 12Q13.1 13.1 12 24Q10.9 13.1 0 12Q10.9 10.9 12 0Z"></path>
  </svg>
);

export default function Home() {
  const containerRef = useRef(null);
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end end"]
  });

  return (
    <main ref={containerRef} className="min-h-screen relative overflow-x-hidden selection:bg-amber-500/30">
      {/* Grid Background */}
      <div className="fixed inset-0 pointer-events-none opacity-[0.03] z-0" 
           style={{ backgroundImage: "linear-gradient(#fff 1px, transparent 1px), linear-gradient(90deg, #fff 1px, transparent 1px)", backgroundSize: "4rem 4rem" }}>
      </div>

      {/* Hero Section */}
      <section className="relative min-h-screen flex flex-col justify-center items-center px-4 pt-20 z-10">
        <motion.div 
          initial={{ opacity: 0, y: 50 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 1, ease: "easeOut" }}
          className="text-center max-w-4xl mx-auto"
        >
          <div className="flex justify-center mb-6">
            <StarIcon />
          </div>
          <h1 className="text-5xl md:text-7xl font-serif font-medium tracking-tight mb-6 text-neutral-100">
            Lekhva makes you <span className="text-amber-500">compliant.</span>
          </h1>
          <p className="text-xl md:text-2xl text-neutral-400 mb-10 font-light max-w-2xl mx-auto">
            Not another ERP on a subscription, a partner in your growth.
          </p>
          
          <motion.a 
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            href="https://github.com/keshavagarwalbiz-spec/Lekhva-ERP" 
            className="inline-flex items-center gap-2 bg-white text-black px-8 py-4 rounded-full font-medium hover:bg-neutral-200 transition-colors"
          >
            Star on GitHub <ArrowRight className="w-4 h-4" />
          </motion.a>
        </motion.div>
      </section>

      {/* Chapter 1: The Problem */}
      <section className="relative min-h-screen flex flex-col justify-center px-4 md:px-20 z-10">
        <motion.div 
          initial={{ opacity: 0, x: -50 }}
          whileInView={{ opacity: 1, x: 0 }}
          viewport={{ once: true, margin: "-20%" }}
          transition={{ duration: 0.8 }}
          className="max-w-3xl"
        >
          <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 1 — The Problem</p>
          <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight">
            Indian SMBs pay ₹50,000 a year for software they barely use.
          </h2>
          <p className="text-xl text-neutral-400 leading-relaxed">
            Tally costs ₹54,000. Zoho Books costs ₹30,000. ClearTax costs ₹24,000. Most businesses use less than 10% of the features they are paying for. We think that is wrong.
          </p>
        </motion.div>
      </section>

      {/* Chapter 2: The Engine */}
      <section className="relative min-h-screen flex flex-col justify-center px-4 md:px-20 z-10 bg-neutral-950/50">
        <motion.div 
          initial={{ opacity: 0, x: 50 }}
          whileInView={{ opacity: 1, x: 0 }}
          viewport={{ once: true, margin: "-20%" }}
          transition={{ duration: 0.8 }}
          className="max-w-3xl ml-auto text-right"
        >
          <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 2 — The Engine</p>
          <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight">
            We calculate it.
          </h2>
          <p className="text-xl text-neutral-400 leading-relaxed mb-8">
            38 state codes. Automatic Place of Supply detection. Intra-state gets CGST + SGST. Inter-state gets IGST. Zero manual tax calculation, zero errors.
          </p>
          
          <div className="flex justify-end gap-4">
            <div className="bg-neutral-900 p-6 rounded-2xl border border-neutral-800 text-left w-64">
              <Zap className="text-amber-500 mb-4" />
              <h3 className="text-white font-medium mb-2">Automated Rules</h3>
              <p className="text-neutral-500 text-sm">Instant tax determination based on state codes.</p>
            </div>
            <div className="bg-neutral-900 p-6 rounded-2xl border border-neutral-800 text-left w-64">
              <ShieldCheck className="text-amber-500 mb-4" />
              <h3 className="text-white font-medium mb-2">100% Compliant</h3>
              <p className="text-neutral-500 text-sm">Always up to date with Indian GST law.</p>
            </div>
          </div>
        </motion.div>
      </section>

      {/* Chapter 3: The Ledger */}
      <section className="relative min-h-screen flex flex-col justify-center px-4 md:px-20 z-10">
        <motion.div 
          initial={{ opacity: 0, y: 50 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-20%" }}
          transition={{ duration: 0.8 }}
          className="max-w-4xl mx-auto text-center"
        >
          <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 3 — The Ledger</p>
          <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight">
            We balance it.
          </h2>
          <p className="text-xl text-neutral-400 leading-relaxed mb-12">
            Every invoice auto-posts a balanced journal entry. Debit Accounts Receivable. Credit Sales Revenue. Credit Output Tax. Always balanced. Always accurate.
          </p>

          <div className="bg-neutral-900 rounded-3xl p-8 border border-neutral-800 text-left mx-auto shadow-2xl">
             <div className="flex justify-between text-neutral-500 font-mono text-sm border-b border-neutral-800 pb-4 mb-4">
                <span>ACCOUNT</span>
                <div className="flex gap-12">
                  <span>DEBIT</span>
                  <span>CREDIT</span>
                </div>
             </div>
             <div className="space-y-4 font-mono">
                <div className="flex justify-between items-center">
                  <span className="text-neutral-300">Accounts Receivable</span>
                  <div className="flex gap-12">
                    <span className="text-white">₹11,800</span>
                    <span className="text-neutral-600">--</span>
                  </div>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-neutral-400 ml-4">Sales Revenue</span>
                  <div className="flex gap-12">
                    <span className="text-neutral-600">--</span>
                    <span className="text-white">₹10,000</span>
                  </div>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-neutral-400 ml-4">Output IGST (18%)</span>
                  <div className="flex gap-12">
                    <span className="text-neutral-600">--</span>
                    <span className="text-white">₹1,800</span>
                  </div>
                </div>
             </div>
          </div>
        </motion.div>
      </section>

      {/* Chapter 4: The Terms */}
      <section className="relative min-h-[70vh] flex flex-col justify-center items-center px-4 z-10 bg-black">
        <motion.div 
          initial={{ opacity: 0, scale: 0.95 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true, margin: "-20%" }}
          transition={{ duration: 0.8 }}
          className="text-center max-w-2xl"
        >
          <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 4 — The Terms</p>
          <h2 className="text-4xl md:text-6xl font-serif mb-6">
            Free. Open source. Forever.
          </h2>
          <p className="text-xl text-neutral-400 mb-8">
            MIT licensed. Self-host it, fork it, own your data. No vendor lock-in, no monthly SaaS fees. You keep everything.
          </p>
          <div className="inline-block border border-neutral-800 bg-neutral-900 rounded-full px-6 py-2 text-sm text-neutral-300">
            <span className="font-semibold text-white">Full disclosure:</span> Built with Claude AI by Anthropic. Every line reviewed by a human.
          </div>
        </motion.div>
      </section>

      {/* Footer */}
      <footer className="border-t border-neutral-900 py-12 px-4 md:px-20 flex flex-col md:flex-row justify-between items-center z-10 relative">
        <div className="flex items-center gap-4 mb-4 md:mb-0">
          <StarIcon />
          <span className="font-serif text-2xl tracking-wide">LEKHVA</span>
        </div>
        <div className="text-neutral-500 text-sm flex gap-6">
          <span>MIT LICENSE</span>
          <span>OPEN SOURCE</span>
          <span>INDIA</span>
        </div>
        <a href="mailto:keshavagarwalbiz@gmail.com" className="text-amber-500 hover:text-amber-400 transition-colors mt-4 md:mt-0">
          keshavagarwalbiz@gmail.com
        </a>
      </footer>
    </main>
  );
}
'

New-Item -Path "apps/web/src/components/ui" -ItemType Directory -Force;

New-Item -Path "apps/web/src/components/ui/blackhole-hero-section.tsx" -ItemType File -Force -Value '
"use client";

import * as React from "react";
import { useEffect, useRef } from "react";

/* -------------------------------------------------------------------------- */
/*  What this draws                                                           */
/*                                                                            */
/*  A black hole, with the light bent the way a black hole bends it.          */
/*                                                                            */
/*  Nothing here is a picture of a ring laid over a disc. Every pixel fires    */
/*  one ray out of the camera and walks it backwards through curved space      */
/*  until the ray either falls through the horizon, leaves for the stars, or   */
/*  cuts the gas disc — often three or four times over, because a ray can      */
/*  loop the hole and come back. The disc is drawn once. The halo above it,    */
/*  the halo below it, and the hard thin ring hugging the shadow are the same  */
/*  disc seen again through bent light. That is why they line up: nobody       */
/*  lined them up.                                                            */
/*                                                                            */
/*  Units are set by the horizon: r = 1 is the event horizon. Then the photon  */
/*  sphere sits at 1.5, the shadow the camera sees is 2.6 across the radius,   */
/*  and the disc starts at 3 — the innermost orbit gas can hold in this        */
/*  geometry. Those numbers are not tuned. They fall out of the metric.        */
/* -------------------------------------------------------------------------- */

export interface BlackHoleHeroSectionProps
  extends React.HTMLAttributes<HTMLDivElement> {
  distance?: number;
  elevation?: number;
  azimuth?: number;
  orbitSpeed?: number;
  roll?: number;
  fov?: number;
  diskInner?: number;
  diskOuter?: number;
  diskThickness?: number;
  diskDensity?: number;
  brightness?: number;
  spinSpeed?: number;
  grain?: number;
  doppler?: number;
  hotColor?: string;
  midColor?: string;
  coolColor?: string;
  starBrightness?: number;
  glow?: number;
  exposure?: number;
  vignette?: number;
  steps?: number;
  resolution?: number;
  maxDpr?: number;
  focus?: [number, number];
  scrim?: "none" | "left" | "right" | "top" | "bottom";
  scrimStrength?: number;
  paused?: boolean;
  children?: React.ReactNode;
}

/* -------------------------------------------------------------------------- */
/*  Shaders                                                                   */
/* -------------------------------------------------------------------------- */

const VERT = `
attribute vec2 aPos;
varying vec2 vUv;
void main() {
  vUv = aPos * 0.5 + 0.5;
  gl_Position = vec4(aPos, 0.0, 1.0);
}
`;

const SCENE_FRAG = `
precision highp float;

#define MAX_STEPS 460
#define WIND_CYCLE 46.0

varying vec2 vUv;

uniform vec2  uRes;
uniform float uTime;
uniform vec3  uCamPos;
uniform vec3  uRight;
uniform vec3  uUp;
uniform vec3  uFwd;
uniform float uTanHalf;
uniform vec2  uFocus;
uniform float uSteps;
uniform float uSkyR;
uniform float uDiskIn;
uniform float uDiskOut;
uniform float uThick;
uniform float uDensity;
uniform float uSpin;
uniform float uGrain;
uniform float uBright;
uniform float uDoppler;
uniform vec3  uHot;
uniform vec3  uMid;
uniform vec3  uCool;
uniform float uStars;
uniform float uEncode;
uniform vec2  uJitter;
uniform float uSeed;

/* --- noise ---------------------------------------------------------------- */

float hash13(vec3 p) {
  p = fract(p * 0.3183099 + vec3(0.1, 0.2, 0.3));
  p *= 17.0;
  return fract(p.x * p.y * p.z * (p.x + p.y + p.z));
}

float vnoise(vec3 x) {
  vec3 i = floor(x);
  vec3 f = fract(x);
  f = f * f * (3.0 - 2.0 * f);
  float n000 = hash13(i + vec3(0.0, 0.0, 0.0));
  float n100 = hash13(i + vec3(1.0, 0.0, 0.0));
  float n010 = hash13(i + vec3(0.0, 1.0, 0.0));
  float n110 = hash13(i + vec3(1.0, 1.0, 0.0));
  float n001 = hash13(i + vec3(0.0, 0.0, 1.0));
  float n101 = hash13(i + vec3(1.0, 0.0, 1.0));
  float n011 = hash13(i + vec3(0.0, 1.0, 1.0));
  float n111 = hash13(i + vec3(1.0, 1.0, 1.0));
  return mix(
    mix(mix(n000, n100, f.x), mix(n010, n110, f.x), f.y),
    mix(mix(n001, n101, f.x), mix(n011, n111, f.x), f.y),
    f.z
  );
}

float fbm(vec3 p, float lod) {
  float a = 0.5;
  float s = 0.0;
  for (int i = 0; i < 4; i++) {
    s += (i == 3 ? a * lod : a) * vnoise(p);
    p = p * 2.03 + vec3(11.3, 7.1, 3.7);
    a *= 0.5;
  }
  return s;
}

/* --- the gas -------------------------------------------------------------- */

void gasAt(vec3 p, float rd, float dt, out float dens, out vec3 tint, out float heat) {
  float rn = clamp((rd - uDiskIn) / max(0.001, uDiskOut - uDiskIn), 0.0, 1.0);

  float tk = uThick * (0.35 + 1.25 * rn);
  float v = p.y / tk;
  float sheet = exp(-v * v);

  float lod = clamp(1.0 - dt * uGrain * 14.0, 0.0, 1.0);

  float phi = atan(p.z, p.x);
  float omega = uSpin * pow(uDiskIn / rd, 1.5);
  float lr = log(rd) * 1.1 + uSpin * uTime * 0.05;

  float u = uTime / WIND_CYCLE;
  float fA = fract(u);
  float fB = fract(u + 0.5);
  float w = abs(2.0 * fA - 1.0);

  float cloudsA = fbm(vec3(vec2(cos(phi + omega * fA * WIND_CYCLE),
                                sin(phi + omega * fA * WIND_CYCLE)) * (rd * uGrain), lr), lod);
  float cloudsB = fbm(vec3(vec2(cos(phi + omega * fB * WIND_CYCLE),
                                sin(phi + omega * fB * WIND_CYCLE)) * (rd * uGrain), lr + 40.0), lod);
  float clouds = mix(cloudsA, cloudsB, w);

  float filaments = clouds * clouds * 1.75;

  float inner = smoothstep(0.0, 0.07, rn);
  float outer = 1.0 - smoothstep(0.45, 1.0, rn);
  float prof = inner * outer * pow(uDiskIn / rd, 2.0);

  dens = max(0.0, filaments * 1.5 - 0.30) * sheet * prof * uDensity * 4.6;

  heat = pow(uDiskIn / rd, 0.8) * (0.72 + 0.55 * clouds);
  tint = mix(uCool, uMid, smoothstep(0.10, 0.52, heat));
  tint = mix(tint, uHot, smoothstep(0.52, 1.05, heat));
}

/* --- stars ---------------------------------------------------------------- */

vec3 starField(vec3 d) {
  vec3 a = abs(d);
  vec2 uv;
  float face;
  if (a.x >= a.y && a.x >= a.z)      { uv = d.yz / a.x; face = d.x > 0.0 ? 0.0 : 1.0; }
  else if (a.y >= a.z)               { uv = d.xz / a.y; face = d.y > 0.0 ? 2.0 : 3.0; }
  else                               { uv = d.xy / a.z; face = d.z > 0.0 ? 4.0 : 5.0; }

  vec3 col = vec3(0.0);
  for (int k = 0; k < 3; k++) {
    float sc = 90.0 * pow(2.2, float(k));
    vec2 p = uv * sc;
    vec2 id = floor(p);
    vec2 f = fract(p) - 0.5;
    float h = hash13(vec3(id, face * 19.0));
    if (h > 0.965) {
      vec2 off = vec2(hash13(vec3(id, face + 11.0)), hash13(vec3(id, face + 23.0)));
      float dd = length(f - (off - 0.5) * 0.7);
      float s = smoothstep(0.055, 0.0, dd);
      float warm = hash13(vec3(id, face + 51.0));
      col += s * (0.6 + 4.5 * fract(h * 97.0))
           * mix(vec3(0.72, 0.82, 1.0), vec3(1.0, 0.88, 0.72), warm)
           / pow(2.2, float(k));
    }
  }
  col += vec3(0.013, 0.017, 0.030) * fbm(d * 2.6, 1.0);
  return col;
}

/* --- march ---------------------------------------------------------------- */

void main() {
  vec2 uv = (gl_FragCoord.xy + uJitter - uFocus * uRes) / uRes.y;
  vec3 dir = normalize(uFwd + (uv.x * uRight + uv.y * uUp) * 2.0 * uTanHalf);

  vec3 pos = uCamPos;
  vec3 vel = dir;

  vec3 hv = cross(pos, vel);
  float h2 = dot(hv, hv);
  float h = sqrt(h2);
  float swept = 0.0;

  vec3 col = vec3(0.0);
  float transmit = 1.0;
  bool captured = false;

  float jitter = fract(sin(dot(gl_FragCoord.xy + uSeed, vec2(12.9898, 78.233))) * 43758.5453);

  for (int i = 0; i < MAX_STEPS; i++) {
    if (float(i) >= uSteps) break;

    float r2 = dot(pos, pos);
    float r = sqrt(r2);

    if (r < 1.0) { captured = true; break; }          
    if (r > uSkyR && dot(pos, vel) > 0.0) break;      
    if (transmit < 0.004) break;                      

    float dt = clamp(0.14 * (r - 1.0), 0.025, 1.1);

    if (r < uDiskOut * 1.25) {
      float rn = clamp((r - uDiskIn) / max(0.001, uDiskOut - uDiskIn), 0.0, 1.0);
      float tk = uThick * (0.35 + 1.25 * rn);
      dt = min(dt, max(tk * 0.38, abs(pos.y) * 0.5));
    }

    swept += h * dt / r2;

    float deep = exp(-1.3 * max(0.0, swept - 4.6));

    jitter = fract(jitter + 0.6180339887);
    vec3 mid = pos + vel * (dt * jitter);
    float rd = length(mid.xz);

    if (rd > uDiskIn && rd < uDiskOut && abs(mid.y) < uThick * 5.0) {
      float dens;
      float heat;
      vec3 tint;
      gasAt(mid, rd, dt, dens, tint, heat);

      if (dens > 0.001) {
        vec3 tang = normalize(cross(vec3(0.0, 1.0, 0.0), vec3(mid.x, 0.0, mid.z)));
        float beta = min(0.85, sqrt(0.5 / max(rd, 1.5)));
        float gam = inversesqrt(max(1e-4, 1.0 - beta * beta));
        vec3 toObs = -normalize(vel);
        float g = 1.0 / (gam * (1.0 - beta * dot(tang, toObs)));
        g *= sqrt(max(0.05, 1.0 - 1.0 / rd));
        float boost = pow(max(g, 0.02), 3.0 * uDoppler);

        vec3 shift = mix(
          vec3(1.0),
          g > 1.0 ? vec3(0.86, 0.94, 1.14) : vec3(1.15, 0.82, 0.62),
          clamp(abs(g - 1.0) * 1.6, 0.0, 1.0) * uDoppler
        );

        float emit = uBright * (0.26 + 2.0 * heat * heat);
        col += tint * shift * (emit * boost * dens * transmit * dt * deep);
        transmit *= exp(-dens * 0.30 * dt);
      }
    }

    vec3 acc = -1.5 * h2 * pos / (r2 * r2 * r);
    vel += acc * dt;
    pos += vel * dt;
  }

  if (!captured && uStars > 0.001) {
    vec3 toHole = normalize(-uCamPos);
    float sI = length(cross(normalize(dir), toHole));
    float sS = length(cross(normalize(vel), toHole));
    float stretch = clamp(sI / max(1e-3, sS), 1.0, 40.0);
    col += starField(normalize(vel)) * uStars * transmit / stretch;
  }

  if (uEncode > 0.5) col = col / (1.0 + col);
  gl_FragColor = vec4(col, 1.0);
}
`;

const BLEND_FRAG = `
precision highp float;
varying vec2 vUv;
uniform sampler2D uCur;
uniform sampler2D uPrev;
uniform float uAlpha;

void main() {
  vec3 c = texture2D(uCur, vUv).rgb;
  vec3 p = texture2D(uPrev, vUv).rgb;
  gl_FragColor = vec4(mix(p, c, uAlpha), 1.0);
}
`;

const BRIGHT_FRAG = `
precision highp float;
varying vec2 vUv;
uniform sampler2D uTex;
uniform vec2 uTexel;
uniform float uDecode;
uniform float uPack;
uniform float uThreshold;

void main() {
  vec3 s = texture2D(uTex, vUv + uTexel * vec2(-1.0, -1.0)).rgb
         + texture2D(uTex, vUv + uTexel * vec2( 1.0, -1.0)).rgb
         + texture2D(uTex, vUv + uTexel * vec2(-1.0,  1.0)).rgb
         + texture2D(uTex, vUv + uTexel * vec2( 1.0,  1.0)).rgb;
  s *= 0.25;
  if (uDecode > 0.5) s = s / max(vec3(0.002), 1.0 - s);
  float l = max(s.r, max(s.g, s.b));
  s *= max(0.0, l - uThreshold) / max(0.0001, l);
  gl_FragColor = vec4(s * uPack, 1.0);
}
`;

const BLUR_FRAG = `
precision highp float;
varying vec2 vUv;
uniform sampler2D uTex;
uniform vec2 uStep;

void main() {
  vec3 s = texture2D(uTex, vUv).rgb * 0.2270270;
  s += (texture2D(uTex, vUv + uStep * 1.3846154).rgb
      + texture2D(uTex, vUv - uStep * 1.3846154).rgb) * 0.3162162;
  s += (texture2D(uTex, vUv + uStep * 3.2307692).rgb
      + texture2D(uTex, vUv - uStep * 3.2307692).rgb) * 0.0702702;
  gl_FragColor = vec4(s, 1.0);
}
`;

const COMPOSITE_FRAG = `
precision highp float;
varying vec2 vUv;
uniform sampler2D uScene;
uniform sampler2D uBloom;
uniform vec2  uRes;
uniform float uDecode;
uniform float uPack;
uniform float uGlow;
uniform float uExposure;
uniform float uVignette;
uniform float uScrimDir;
uniform float uScrimAmt;
uniform float uSeed;

vec3 aces(vec3 x) {
  return clamp((x * (2.51 * x + 0.03)) / (x * (2.43 * x + 0.59) + 0.14), 0.0, 1.0);
}

void main() {
  vec3 scene = texture2D(uScene, vUv).rgb;
  if (uDecode > 0.5) scene = scene / max(vec3(0.002), 1.0 - scene);
  vec3 bloom = texture2D(uBloom, vUv).rgb / uPack;

  vec3 c = scene + bloom * uGlow;
  c = aces(c * uExposure);
  c = pow(max(c, 0.0), vec3(0.4545));

  vec2 d = vUv - 0.5;
  c *= 1.0 - uVignette * dot(d, d) * 1.9;

  if (uScrimDir > 0.5) {
    float x = uScrimDir < 1.5 ? vUv.x
            : uScrimDir < 2.5 ? 1.0 - vUv.x
            : uScrimDir < 3.5 ? 1.0 - vUv.y
            : vUv.y;
    c *= 1.0 - uScrimAmt * pow(1.0 - clamp(x, 0.0, 1.0), 2.4);
  }

  float n = fract(sin(dot(gl_FragCoord.xy + uSeed, vec2(12.9898, 78.233))) * 43758.5453);
  c += (n - 0.5) / 255.0;

  gl_FragColor = vec4(c, 1.0);
}
`;

/* -------------------------------------------------------------------------- */
/*  Small helpers                                                             */
/* -------------------------------------------------------------------------- */

const RAD = Math.PI / 180;

function hexToLinear(hex: string): [number, number, number] {
  const h = hex.trim().replace("#", "");
  const full =
    h.length === 3 ? h[0] + h[0] + h[1] + h[1] + h[2] + h[2] : h.slice(0, 6);
  const n = parseInt(full, 16);
  const srgb = [((n >> 16) & 255) / 255, ((n >> 8) & 255) / 255, (n & 255) / 255];
  return srgb.map((v) =>
    v <= 0.04045 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4)
  ) as [number, number, number];
}

type Prog = {
  program: WebGLProgram;
  u: Record<string, WebGLUniformLocation | null>;
};

type Target = {
  fb: WebGLFramebuffer;
  tex: WebGLTexture;
  w: number;
  h: number;
};

/* -------------------------------------------------------------------------- */
/*  Component                                                                 */
/* -------------------------------------------------------------------------- */

export function BlackHoleHeroSection({
  distance = 24,
  elevation = -5.5,
  azimuth = 0,
  orbitSpeed = 0,
  roll = -20,
  fov = 42,
  diskInner = 3,
  diskOuter = 15,
  diskThickness = 0.26,
  diskDensity = 1,
  brightness = 1,
  spinSpeed = 0.06,
  grain = 0.48,
  doppler = 0.35,
  hotColor = "#FFF3DE",
  midColor = "#FF9838",
  coolColor = "#8E3A0B",
  starBrightness = 0,
  glow = 1,
  exposure = 0.9,
  vignette = 0.28,
  steps = 300,
  resolution = 0.7,
  maxDpr = 1.75,
  focus = [0.72, 0.46],
  scrim = "none",
  scrimStrength = 0.9,
  paused = false,
  className = "",
  children,
  ...rest
}: BlackHoleHeroSectionProps) {
  const hostRef = useRef<HTMLDivElement | null>(null);
  const canvasRef = useRef<HTMLCanvasElement | null>(null);

  const props = useRef({
    distance, elevation, azimuth, orbitSpeed, roll, fov, diskInner, diskOuter,
    diskThickness, diskDensity, brightness, spinSpeed, grain, doppler, hotColor,
    midColor, coolColor, starBrightness, glow, exposure, vignette, steps,
    resolution, maxDpr, focus, scrim, scrimStrength, paused,
  });
  props.current = {
    distance, elevation, azimuth, orbitSpeed, roll, fov, diskInner, diskOuter,
    diskThickness, diskDensity, brightness, spinSpeed, grain, doppler, hotColor,
    midColor, coolColor, starBrightness, glow, exposure, vignette, steps,
    resolution, maxDpr, focus, scrim, scrimStrength, paused,
  };

  useEffect(() => {
    const host = hostRef.current;
    const canvas = canvasRef.current;
    if (!host || !canvas) return;

    const reduced =
      typeof window.matchMedia === "function" &&
      window.matchMedia("(prefers-reduced-motion: reduce)").matches;

    const opts: WebGLContextAttributes = {
      alpha: false,
      antialias: false,
      depth: false,
      stencil: false,
      powerPreference: "high-performance",
      preserveDrawingBuffer: false,
    };
    const gl = (canvas.getContext("webgl2", opts) ||
      canvas.getContext("webgl", opts)) as
      | WebGL2RenderingContext
      | WebGLRenderingContext
      | null;

    function giveUp(why: string) {
      host!.dataset.webgl = why;
      canvas!.style.display = "none";
    }

    if (!gl) {
      giveUp("unsupported");
      return;
    }

    const dbg = gl.getExtension("WEBGL_debug_renderer_info");
    const renderer = dbg
      ? String(gl.getParameter((dbg as any).UNMASKED_RENDERER_WEBGL) || "")
      : "";
    const software = /swiftshader|llvmpipe|softpipe|software|microsoft basic/i.test(renderer);
    const isGL2 = typeof WebGL2RenderingContext !== "undefined" &&
      gl instanceof WebGL2RenderingContext;

    function compile(type: number, src: string): WebGLShader | null {
      const sh = gl!.createShader(type);
      if (!sh) return null;
      gl!.shaderSource(sh, src);
      gl!.compileShader(sh);
      if (!gl!.getShaderParameter(sh, gl!.COMPILE_STATUS)) {
        console.error("blackhole: shader failed —", gl!.getShaderInfoLog(sh) || "no log (context lost?)");
        gl!.deleteShader(sh);
        return null;
      }
      return sh;
    }

    function link(fragSrc: string): Prog | null {
      const vs = compile(gl!.VERTEX_SHADER, VERT);
      const fs = compile(gl!.FRAGMENT_SHADER, fragSrc);
      if (!vs || !fs) return null;
      const program = gl!.createProgram();
      if (!program) return null;
      gl!.attachShader(program, vs);
      gl!.attachShader(program, fs);
      gl!.bindAttribLocation(program, 0, "aPos");
      gl!.linkProgram(program);
      gl!.deleteShader(vs);
      gl!.deleteShader(fs);
      if (!gl!.getProgramParameter(program, gl!.LINK_STATUS)) {
        console.error(gl!.getProgramInfoLog(program));
        return null;
      }
      const u: Record<string, WebGLUniformLocation | null> = {};
      const n = gl!.getProgramParameter(program, gl!.ACTIVE_UNIFORMS) as number;
      for (let i = 0; i < n; i++) {
        const info = gl!.getActiveUniform(program, i);
        if (info) u[info.name] = gl!.getUniformLocation(program, info.name);
      }
      return { program, u };
    }

    let hdr = true;
    let texType: number = gl.UNSIGNED_BYTE;
    let internal: number = gl.RGBA;
    if (isGL2) {
      const g2 = gl as WebGL2RenderingContext;
      const ok =
        g2.getExtension("EXT_color_buffer_half_float") ||
        g2.getExtension("EXT_color_buffer_float");
      if (ok) {
        texType = g2.HALF_FLOAT;
        internal = g2.RGBA16F;
      } else hdr = false;
    } else {
      const hf = gl.getExtension("OES_texture_half_float");
      const cb = gl.getExtension("EXT_color_buffer_half_float");
      if (hf && cb) texType = (hf as any).HALF_FLOAT_OES;
      else hdr = false;
    }
    if (!hdr) {
      texType = gl.UNSIGNED_BYTE;
      internal = gl.RGBA;
    }
    const linearOK =
      isGL2 ||
      !!gl.getExtension("OES_texture_half_float_linear") ||
      !hdr;
    const filter = linearOK ? gl.LINEAR : gl.NEAREST;
    const pack = hdr ? 1 : 0.12;

    function makeTarget(w: number, h: number): Target | null {
      const tex = gl!.createTexture();
      const fb = gl!.createFramebuffer();
      if (!tex || !fb) return null;
      gl!.bindTexture(gl!.TEXTURE_2D, tex);
      gl!.texImage2D(gl!.TEXTURE_2D, 0, internal, w, h, 0, gl!.RGBA, texType, null);
      gl!.texParameteri(gl!.TEXTURE_2D, gl!.TEXTURE_MIN_FILTER, filter);
      gl!.texParameteri(gl!.TEXTURE_2D, gl!.TEXTURE_MAG_FILTER, filter);
      gl!.texParameteri(gl!.TEXTURE_2D, gl!.TEXTURE_WRAP_S, gl!.CLAMP_TO_EDGE);
      gl!.texParameteri(gl!.TEXTURE_2D, gl!.TEXTURE_WRAP_T, gl!.CLAMP_TO_EDGE);
      gl!.bindFramebuffer(gl!.FRAMEBUFFER, fb);
      gl!.framebufferTexture2D(
        gl!.FRAMEBUFFER, gl!.COLOR_ATTACHMENT0, gl!.TEXTURE_2D, tex, 0
      );
      const status = gl!.checkFramebufferStatus(gl!.FRAMEBUFFER);
      gl!.bindFramebuffer(gl!.FRAMEBUFFER, null);
      if (status !== gl!.FRAMEBUFFER_COMPLETE) {
        gl!.deleteTexture(tex);
        gl!.deleteFramebuffer(fb);
        return null;
      }
      return { fb, tex, w, h };
    }

    let sceneProg: Prog | null = null;
    let blendProg: Prog | null = null;
    let brightProg: Prog | null = null;
    let blurProg: Prog | null = null;
    let compProg: Prog | null = null;
    let vbo: WebGLBuffer | null = null;
    let scene: Target | null = null;
    let histA: Target | null = null;
    let histB: Target | null = null;
    let bloomA: Target | null = null;
    let bloomB: Target | null = null;
    let settled = 0;

    let width = 0;
    let height = 0;
    let sceneW = 0;
    let sceneH = 0;

    function build(): boolean {
      sceneProg = link(SCENE_FRAG);
      blendProg = link(BLEND_FRAG);
      brightProg = link(BRIGHT_FRAG);
      blurProg = link(BLUR_FRAG);
      compProg = link(COMPOSITE_FRAG);
      if (!sceneProg || !blendProg || !brightProg || !blurProg || !compProg) return false;

      vbo = gl!.createBuffer();
      gl!.bindBuffer(gl!.ARRAY_BUFFER, vbo);
      gl!.bufferData(
        gl!.ARRAY_BUFFER,
        new Float32Array([-1, -1, 3, -1, -1, 3]),
        gl!.STATIC_DRAW
      );
      gl!.enableVertexAttribArray(0);
      gl!.vertexAttribPointer(0, 2, gl!.FLOAT, false, 0, 0);
      gl!.disable(gl!.DEPTH_TEST);
      gl!.disable(gl!.BLEND);
      return true;
    }

    function dropTargets() {
      for (const t of [scene, histA, histB, bloomA, bloomB]) {
        if (!t) continue;
        gl!.deleteTexture(t.tex);
        gl!.deleteFramebuffer(t.fb);
      }
      scene = null;
      histA = null;
      histB = null;
      bloomA = null;
      bloomB = null;
      settled = 0;
    }

    function resize() {
      const rect = host!.getBoundingClientRect();
      const dpr = software
        ? 1
        : Math.min(window.devicePixelRatio || 1, Math.max(1, props.current.maxDpr));
      const cssW = Math.max(1, Math.round(rect.width));
      const cssH = Math.max(1, Math.round(rect.height));
      const scale = software
        ? 0.34
        : Math.min(1, Math.max(0.4, props.current.resolution));
      const w = Math.max(2, Math.round(cssW * dpr));
      const h = Math.max(2, Math.round(cssH * dpr));
      const sw = Math.max(2, Math.round(w * scale));
      const sh = Math.max(2, Math.round(h * scale));
      if (w === width && h === height && sw === sceneW && sh === sceneH) return;
      width = w;
      height = h;
      sceneW = sw;
      sceneH = sh;
      canvas!.width = w;
      canvas!.height = h;
      canvas!.style.width = cssW + "px";
      canvas!.style.height = cssH + "px";
      dropTargets();
      scene = makeTarget(sw, sh);
      histA = makeTarget(sw, sh);
      histB = makeTarget(sw, sh);
      const bw = Math.max(2, sw >> 2);
      const bh = Math.max(2, sh >> 2);
      bloomA = makeTarget(bw, bh);
      bloomB = makeTarget(bw, bh);
    }

    let clock = reduced ? 6 : 0;
    let lastFrame = 0;
    let running = true;
    let visible = true;
    let raf = 0;

    function pass(prog: Prog, target: Target | null) {
      gl!.useProgram(prog.program);
      gl!.bindFramebuffer(gl!.FRAMEBUFFER, target ? target.fb : null);
      gl!.viewport(0, 0, target ? target.w : width, target ? target.h : height);
    }

    function draw() {
      gl!.drawArrays(gl!.TRIANGLES, 0, 3);
    }

    function bind(tex: WebGLTexture, unit: number) {
      gl!.activeTexture(gl!.TEXTURE0 + unit);
      gl!.bindTexture(gl!.TEXTURE_2D, tex);
    }

    const HALTON: Array<[number, number]> = [
      [0.5, 0.333], [0.25, 0.667], [0.75, 0.111], [0.125, 0.444],
      [0.625, 0.778], [0.375, 0.222], [0.875, 0.556], [0.0625, 0.889],
    ];

    function render(t: number) {
      if (!sceneProg || !blendProg || !brightProg || !blurProg || !compProg) return;
      if (!scene || !histA || !histB || !bloomA || !bloomB) return;
      const C = props.current;

      const az = (C.azimuth + C.orbitSpeed * t) * RAD;
      const el = Math.max(-88, Math.min(88, C.elevation)) * RAD;
      const dist = Math.max(2.2, C.distance);
      const ce = Math.cos(el);
      const camX = dist * ce * Math.cos(az);
      const camY = dist * Math.sin(el);
      const camZ = dist * ce * Math.sin(az);

      const fx = -camX / dist, fy = -camY / dist, fz = -camZ / dist;
      let rx = fz, ry = 0, rz = -fx;          
      const rl = Math.hypot(rx, ry, rz) || 1;
      rx /= rl; ry /= rl; rz /= rl;
      let ux = ry * fz - rz * fy;
      let uy = rz * fx - rx * fz;
      let uz = rx * fy - ry * fx;
      const cr = Math.cos(C.roll * RAD);
      const sr = Math.sin(C.roll * RAD);
      const RX = rx * cr + ux * sr, RY = ry * cr + uy * sr, RZ = rz * cr + uz * sr;
      const UX = -rx * sr + ux * cr, UY = -ry * sr + uy * cr, UZ = -rz * sr + uz * cr;

      const hot = hexToLinear(C.hotColor);
      const mid = hexToLinear(C.midColor);
      const cool = hexToLinear(C.coolColor);
      const outer = Math.max(C.diskInner + 0.5, C.diskOuter);

      pass(sceneProg, scene);
      const u = sceneProg.u;
      gl!.uniform2f(u.uRes!, scene.w, scene.h);
      gl!.uniform1f(u.uTime!, t);
      gl!.uniform3f(u.uCamPos!, camX, camY, camZ);
      gl!.uniform3f(u.uRight!, RX, RY, RZ);
      gl!.uniform3f(u.uUp!, UX, UY, UZ);
      gl!.uniform3f(u.uFwd!, fx, fy, fz);
      gl!.uniform1f(u.uTanHalf!, Math.tan(Math.max(8, Math.min(110, C.fov)) * 0.5 * RAD));
      gl!.uniform2f(u.uFocus!, C.focus[0], 1 - C.focus[1]);
      gl!.uniform1f(
        u.uSteps!,
        software ? 130 : Math.max(60, Math.min(460, Math.round(C.steps)))
      );
      gl!.uniform1f(u.uSkyR!, Math.max(dist * 1.35, outer * 2.4));
      gl!.uniform1f(u.uDiskIn!, Math.max(1.05, C.diskInner));
      gl!.uniform1f(u.uDiskOut!, outer);
      gl!.uniform1f(u.uThick!, Math.max(0.02, C.diskThickness));
      gl!.uniform1f(u.uDensity!, Math.max(0, C.diskDensity));
      gl!.uniform1f(u.uSpin!, C.spinSpeed * 6.2831853);
      gl!.uniform1f(u.uGrain!, Math.max(0.02, C.grain));
      gl!.uniform1f(u.uBright!, Math.max(0, C.brightness));
      gl!.uniform1f(u.uDoppler!, Math.max(0, Math.min(1, C.doppler)));
      gl!.uniform3f(u.uHot!, hot[0], hot[1], hot[2]);
      gl!.uniform3f(u.uMid!, mid[0], mid[1], mid[2]);
      gl!.uniform3f(u.uCool!, cool[0], cool[1], cool[2]);
      gl!.uniform1f(u.uStars!, Math.max(0, C.starBrightness));
      gl!.uniform1f(u.uEncode!, hdr ? 0 : 1);
      const h = HALTON[settled % HALTON.length];
      gl!.uniform2f(u.uJitter!, h[0] - 0.5, h[1] - 0.5);
      gl!.uniform1f(u.uSeed!, (settled % 64) * 17.13);
      draw();

      const alpha = settled === 0 ? 1 : 0.14;
      pass(blendProg, histB);
      bind(scene.tex, 0);
      bind(histA.tex, 1);
      gl!.uniform1i(blendProg.u.uCur!, 0);
      gl!.uniform1i(blendProg.u.uPrev!, 1);
      gl!.uniform1f(blendProg.u.uAlpha!, alpha);
      draw();
      const shown = histB;
      const tmp = histA;
      histA = histB;
      histB = tmp;
      settled++;

      pass(brightProg, bloomA);
      bind(shown.tex, 0);
      gl!.uniform1i(brightProg.u.uTex!, 0);
      gl!.uniform2f(brightProg.u.uTexel!, 1 / shown.w, 1 / shown.h);
      gl!.uniform1f(brightProg.u.uDecode!, hdr ? 0 : 1);
      gl!.uniform1f(brightProg.u.uPack!, pack);
      gl!.uniform1f(brightProg.u.uThreshold!, 0.85);
      draw();

      const blurStep = (src: Target, dst: Target, dx: number, dy: number) => {
        pass(blurProg!, dst);
        bind(src.tex, 0);
        gl!.uniform1i(blurProg!.u.uTex!, 0);
        gl!.uniform2f(blurProg!.u.uStep!, dx / dst.w, dy / dst.h);
        draw();
      };
      blurStep(bloomA, bloomB, 1, 0);
      blurStep(bloomB, bloomA, 0, 1);
      blurStep(bloomA, bloomB, 2.6, 0);
      blurStep(bloomB, bloomA, 0, 2.6);

      pass(compProg, null);
      bind(shown.tex, 0);
      bind(bloomA.tex, 1);
      gl!.uniform1i(compProg.u.uScene!, 0);
      gl!.uniform1i(compProg.u.uBloom!, 1);
      gl!.uniform2f(compProg.u.uRes!, width, height);
      gl!.uniform1f(compProg.u.uDecode!, hdr ? 0 : 1);
      gl!.uniform1f(compProg.u.uPack!, pack);
      gl!.uniform1f(compProg.u.uGlow!, Math.max(0, C.glow) * 0.26);
      gl!.uniform1f(compProg.u.uExposure!, Math.max(0.05, C.exposure));
      gl!.uniform1f(compProg.u.uVignette!, Math.max(0, Math.min(1, C.vignette)));
      gl!.uniform1f(
        compProg.u.uScrimDir!,
        C.scrim === "left" ? 1 : C.scrim === "right" ? 2 : C.scrim === "top" ? 3 : C.scrim === "bottom" ? 4 : 0
      );
      gl!.uniform1f(compProg.u.uScrimAmt!, Math.max(0, Math.min(1, C.scrimStrength)));
      gl!.uniform1f(compProg.u.uSeed!, (t * 60) % 1000);
      draw();
    }

    function settle(passes: number) {
      for (let i = 0; i < passes; i++) render(clock);
    }

    function tick(now: number) {
      if (!running) return;
      raf = requestAnimationFrame(tick);
      if (!visible) { lastFrame = now; return; }
      const dt = lastFrame ? Math.min(0.05, (now - lastFrame) / 1000) : 0;
      lastFrame = now;
      if (!props.current.paused && !reduced) clock += dt;
      render(clock);
    }

    if (!build()) {
      giveUp("build-failed");
      return;
    }
    resize();
    settle(reduced ? 16 : 1);
    if (!reduced) raf = requestAnimationFrame(tick);

    const ro = new ResizeObserver(() => {
      resize();
      if (reduced || props.current.paused) settle(16);
    });
    ro.observe(host);

    const io = new IntersectionObserver(
      (entries) => { visible = entries[0]?.isIntersecting ?? true; },
      { threshold: 0 }
    );
    io.observe(host);

    const onVisibility = () => { visible = !document.hidden; lastFrame = 0; };
    const onLost = (e: Event) => {
      e.preventDefault();
      running = false;
      cancelAnimationFrame(raf);
      canvas.style.display = "none";
    };
    const onRestored = () => {
      width = height = sceneW = sceneH = 0;
      if (!build()) {
        giveUp("lost");
        return;
      }
      canvas.style.display = "";
      host.dataset.webgl = "";
      resize();
      running = true;
      lastFrame = 0;
      settle(reduced ? 16 : 1);
      if (!reduced) raf = requestAnimationFrame(tick);
    };

    document.addEventListener("visibilitychange", onVisibility);
    canvas.addEventListener("webglcontextlost", onLost);
    canvas.addEventListener("webglcontextrestored", onRestored);

    return () => {
      running = false;
      cancelAnimationFrame(raf);
      ro.disconnect();
      io.disconnect();
      document.removeEventListener("visibilitychange", onVisibility);
      canvas.removeEventListener("webglcontextlost", onLost);
      canvas.removeEventListener("webglcontextrestored", onRestored);
      dropTargets();
      if (vbo) gl.deleteBuffer(vbo);
      for (const p of [sceneProg, blendProg, brightProg, blurProg, compProg]) {
        if (p) gl.deleteProgram(p.program);
      }
    };
  }, []);

  return (
    <div
      ref={hostRef}
      className={`relative isolate h-full w-full overflow-hidden bg-black ${className}`}
      {...rest}
    >
      <canvas ref={canvasRef} aria-hidden="true" className="absolute inset-0 h-full w-full" />
      {children ? <div className="relative z-10 h-full w-full">{children}</div> : null}
    </div>
  );
}

export default BlackHoleHeroSection;
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { useEffect, useState } from "react";
import { BlackHoleHeroSection } from "@/components/ui/blackhole-hero-section";

/** True while the viewport is narrow. Drives the layout swap below. */
function useNarrow(query = "(max-width: 767px)") {
  const [narrow, setNarrow] = useState(false);
  useEffect(() => {
    const m = window.matchMedia(query);
    const sync = () => setNarrow(m.matches);
    sync();
    m.addEventListener("change", sync);
    return () => m.removeEventListener("change", sync);
  }, [query]);
  return narrow;
}

export default function BlackHoleHeroSectionDemo() {
  const narrow = useNarrow();

  return (
    <section className="relative min-h-[100vh] w-full bg-black">
      <BlackHoleHeroSection
        focus={narrow ? [0.5, 0.76] : [0.72, 0.46]}
        scrim={narrow ? "top" : "left"}
        scrimStrength={0.9}
        distance={24}
        elevation={narrow ? -7 : -5.5}
        fov={narrow ? 58 : 42}
        glow={narrow ? 0.85 : 1}
        steps={narrow ? 200 : 300}
        resolution={narrow ? 0.6 : 0.7}
      >
        <div className="flex h-full min-h-[100vh] items-start px-6 pt-14 sm:px-10 md:items-center md:pt-0 lg:px-20">
          <div className="max-w-[34rem]">
            <h1 className="text-[2.5rem] font-light leading-[1.05] tracking-[-0.03em] text-white sm:text-6xl lg:text-[4.25rem]">
              Light does not
              <br />
              leave here
            </h1>

            <p className="mt-6 max-w-md text-[0.95rem] leading-relaxed text-white/60 md:mt-7">
              The ring above the shadow is the far side of the disc, bent over
              the top. Nothing put it there but gravity.
            </p>

            <div className="mt-8 flex flex-wrap items-center gap-3 md:mt-10">
              <a
                href="#"
                className="rounded-full bg-white px-6 py-3 text-sm font-medium text-black transition hover:bg-white/90"
              >
                Get started
              </a>
              <a
                href="#"
                className="rounded-full border border-white/20 px-6 py-3 text-sm text-white/80 transition hover:border-white/40 hover:text-white"
              >
                Read the maths
              </a>
            </div>
          </div>
        </div>
      </BlackHoleHeroSection>
    </section>
  );
}
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion } from "framer-motion";
import { ArrowRight, ShieldCheck, Zap } from "lucide-react";
import { useEffect, useRef, useState } from "react";
import { BlackHoleHeroSection } from "@/components/ui/blackhole-hero-section";

const StarIcon = () => (
  <svg viewBox="0 0 24 24" aria-hidden="true" className="w-6 h-6 fill-amber-500 opacity-80">
    <path d="M12 0Q13.1 10.9 24 12Q13.1 13.1 12 24Q10.9 13.1 0 12Q10.9 10.9 12 0Z"></path>
  </svg>
);

export default function Home() {
  const containerRef = useRef(null);
  
  const [narrow, setNarrow] = useState(false);
  useEffect(() => {
    const m = window.matchMedia("(max-width: 767px)");
    const sync = () => setNarrow(m.matches);
    sync();
    m.addEventListener("change", sync);
    return () => m.removeEventListener("change", sync);
  }, []);

  return (
    <main ref={containerRef} className="relative min-h-screen selection:bg-amber-500/30">
      
      {/* Persistent Cinematic Background */}
      <div className="fixed inset-0 z-0">
        <BlackHoleHeroSection
          focus={narrow ? [0.5, 0.76] : [0.72, 0.46]}
          scrim="none"
          distance={24}
          elevation={narrow ? -7 : -5.5}
          fov={narrow ? 58 : 42}
          glow={narrow ? 0.85 : 1}
          steps={narrow ? 140 : 300}
          resolution={narrow ? 0.6 : 0.7}
        />
        <div className="absolute inset-0 bg-black/40 pointer-events-none" />
      </div>

      {/* Foreground Content */}
      <div className="relative z-10">
        
        {/* Hero Section */}
        <section className="min-h-[100svh] flex flex-col justify-center items-center px-4 pt-20">
          <motion.div 
            initial={{ opacity: 0, y: 50 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 1, ease: "easeOut" }}
            className="text-center max-w-4xl mx-auto"
          >
            <div className="flex justify-center mb-6">
              <StarIcon />
            </div>
            <h1 className="text-5xl md:text-7xl font-serif font-medium tracking-tight mb-6 text-neutral-100 drop-shadow-2xl">
              Lekhva makes you <span className="text-amber-500">compliant.</span>
            </h1>
            <p className="text-xl md:text-2xl text-neutral-300 mb-10 font-light max-w-2xl mx-auto drop-shadow-lg">
              Not another ERP on a subscription, a partner in your growth.
            </p>
            
            <motion.a 
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              href="https://github.com/keshavagarwalbiz-spec/Lekhva-ERP" 
              className="inline-flex items-center gap-2 bg-white text-black px-8 py-4 rounded-full font-medium hover:bg-neutral-200 transition-colors shadow-2xl"
            >
              Star on GitHub <ArrowRight className="w-4 h-4" />
            </motion.a>
          </motion.div>
        </section>

        {/* Chapter 1: The Problem */}
        <section className="min-h-screen flex flex-col justify-center px-4 md:px-20">
          <motion.div 
            initial={{ opacity: 0, x: -50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true, margin: "-20%" }}
            transition={{ duration: 0.8 }}
            className="max-w-3xl backdrop-blur-md bg-black/40 p-8 md:p-12 rounded-3xl border border-white/10"
          >
            <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 1 — The Problem</p>
            <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight text-white drop-shadow-lg">
              Indian SMBs pay ₹50,000 a year for software they barely use.
            </h2>
            <p className="text-xl text-neutral-300 leading-relaxed drop-shadow-md">
              Tally costs ₹54,000. Zoho Books costs ₹30,000. ClearTax costs ₹24,000. Most businesses use less than 10% of the features they are paying for. We think that is wrong.
            </p>
          </motion.div>
        </section>

        {/* Chapter 2: The Engine */}
        <section className="min-h-screen flex flex-col justify-center px-4 md:px-20">
          <motion.div 
            initial={{ opacity: 0, x: 50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true, margin: "-20%" }}
            transition={{ duration: 0.8 }}
            className="max-w-3xl ml-auto text-right backdrop-blur-md bg-black/40 p-8 md:p-12 rounded-3xl border border-white/10"
          >
            <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 2 — The Engine</p>
            <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight text-white drop-shadow-lg">
              We calculate it.
            </h2>
            <p className="text-xl text-neutral-300 leading-relaxed mb-8 drop-shadow-md">
              38 state codes. Automatic Place of Supply detection. Intra-state gets CGST + SGST. Inter-state gets IGST. Zero manual tax calculation, zero errors.
            </p>
            
            <div className="flex justify-end gap-4 flex-wrap">
              <div className="bg-black/60 p-6 rounded-2xl border border-neutral-800 text-left w-64 shadow-xl">
                <Zap className="text-amber-500 mb-4" />
                <h3 className="text-white font-medium mb-2">Automated Rules</h3>
                <p className="text-neutral-400 text-sm">Instant tax determination based on state codes.</p>
              </div>
              <div className="bg-black/60 p-6 rounded-2xl border border-neutral-800 text-left w-64 shadow-xl">
                <ShieldCheck className="text-amber-500 mb-4" />
                <h3 className="text-white font-medium mb-2">100% Compliant</h3>
                <p className="text-neutral-400 text-sm">Always up to date with Indian GST law.</p>
              </div>
            </div>
          </motion.div>
        </section>

        {/* Chapter 3: The Ledger */}
        <section className="min-h-screen flex flex-col justify-center px-4 md:px-20">
          <motion.div 
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-20%" }}
            transition={{ duration: 0.8 }}
            className="max-w-4xl mx-auto text-center backdrop-blur-md bg-black/40 p-8 md:p-12 rounded-3xl border border-white/10"
          >
            <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 3 — The Ledger</p>
            <h2 className="text-4xl md:text-6xl font-serif mb-6 leading-tight text-white drop-shadow-lg">
              We balance it.
            </h2>
            <p className="text-xl text-neutral-300 leading-relaxed mb-12 drop-shadow-md">
              Every invoice auto-posts a balanced journal entry. Debit Accounts Receivable. Credit Sales Revenue. Credit Output Tax. Always balanced. Always accurate.
            </p>

            <div className="bg-black/70 rounded-3xl p-8 border border-neutral-700 text-left mx-auto shadow-2xl backdrop-blur-lg">
               <div className="flex justify-between text-neutral-400 font-mono text-sm border-b border-neutral-700 pb-4 mb-4">
                  <span>ACCOUNT</span>
                  <div className="flex gap-12">
                    <span>DEBIT</span>
                    <span>CREDIT</span>
                  </div>
               </div>
               <div className="space-y-4 font-mono">
                  <div className="flex justify-between items-center">
                    <span className="text-neutral-200">Accounts Receivable</span>
                    <div className="flex gap-12">
                      <span className="text-white font-semibold">₹11,800</span>
                      <span className="text-neutral-600">--</span>
                    </div>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-neutral-400 ml-4">Sales Revenue</span>
                    <div className="flex gap-12">
                      <span className="text-neutral-600">--</span>
                      <span className="text-white font-semibold">₹10,000</span>
                    </div>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-neutral-400 ml-4">Output IGST (18%)</span>
                    <div className="flex gap-12">
                      <span className="text-neutral-600">--</span>
                      <span className="text-amber-500 font-semibold">₹1,800</span>
                    </div>
                  </div>
               </div>
            </div>
          </motion.div>
        </section>

        {/* Chapter 4: The Terms */}
        <section className="min-h-[70vh] flex flex-col justify-center items-center px-4 bg-gradient-to-t from-black via-black/80 to-transparent">
          <motion.div 
            initial={{ opacity: 0, scale: 0.95 }}
            whileInView={{ opacity: 1, scale: 1 }}
            viewport={{ once: true, margin: "-20%" }}
            transition={{ duration: 0.8 }}
            className="text-center max-w-2xl"
          >
            <p className="text-amber-500 font-mono text-sm tracking-widest uppercase mb-4">Ch. 4 — The Terms</p>
            <h2 className="text-4xl md:text-6xl font-serif mb-6 text-white drop-shadow-xl">
              Free. Open source. Forever.
            </h2>
            <p className="text-xl text-neutral-300 mb-8 drop-shadow-md">
              MIT licensed. Self-host it, fork it, own your data. No vendor lock-in, no monthly SaaS fees. You keep everything.
            </p>
            <div className="inline-block border border-neutral-800 bg-neutral-900/80 backdrop-blur-md rounded-full px-6 py-2 text-sm text-neutral-300 shadow-xl">
              <span className="font-semibold text-white">Full disclosure:</span> Built with AI components by 21st.dev.
            </div>
          </motion.div>
        </section>

        {/* Footer */}
        <footer className="bg-black border-t border-neutral-900 py-12 px-4 md:px-20 flex flex-col md:flex-row justify-between items-center relative">
          <div className="flex items-center gap-4 mb-4 md:mb-0">
            <StarIcon />
            <span className="font-serif text-2xl tracking-wide text-white">LEKHVA</span>
          </div>
          <div className="text-neutral-500 text-sm flex gap-6">
            <span>MIT LICENSE</span>
            <span>OPEN SOURCE</span>
            <span>INDIA</span>
          </div>
          <a href="mailto:keshavagarwalbiz@gmail.com" className="text-amber-500 hover:text-amber-400 transition-colors mt-4 md:mt-0">
            keshavagarwalbiz@gmail.com
          </a>
        </footer>
      </div>
    </main>
  );
}
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion } from "framer-motion";
import { ArrowRight, CheckCircle2, LayoutDashboard, ShieldCheck, Zap, Server, BarChart3, Receipt } from "lucide-react";

const FeatureCard = ({ icon: Icon, title, description, delay = 0, className = "" }: any) => (
  <motion.div
    initial={{ opacity: 0, y: 20 }}
    whileInView={{ opacity: 1, y: 0 }}
    viewport={{ once: true, margin: "-100px" }}
    transition={{ duration: 0.5, delay }}
    className={`group relative overflow-hidden rounded-3xl bg-neutral-900/50 border border-white/10 p-8 hover:bg-neutral-900/80 transition-colors ${className}`}
  >
    <div className="absolute inset-0 bg-gradient-to-br from-amber-500/5 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
    <Icon className="w-10 h-10 text-amber-500 mb-6" />
    <h3 className="text-xl font-medium text-white mb-3">{title}</h3>
    <p className="text-neutral-400 leading-relaxed">{description}</p>
  </motion.div>
);

export default function Home() {
  return (
    <main className="min-h-screen bg-[#050505] text-neutral-200 selection:bg-amber-500/30 overflow-hidden font-sans">
      
      {/* Cinematic Ambient Background */}
      <div className="fixed inset-0 z-0 pointer-events-none">
        <div className="absolute top-[-20%] left-[-10%] w-[50%] h-[50%] rounded-full bg-amber-600/20 blur-[120px]" />
        <div className="absolute bottom-[-20%] right-[-10%] w-[50%] h-[50%] rounded-full bg-orange-600/10 blur-[120px]" />
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#80808012_1px,transparent_1px),linear-gradient(to_bottom,#80808012_1px,transparent_1px)] bg-[size:24px_24px]" />
      </div>

      <div className="relative z-10">
        
        {/* Navigation */}
        <nav className="absolute top-0 w-full px-6 py-8 flex justify-between items-center z-50">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 rounded-lg bg-amber-500 flex items-center justify-center">
              <Zap className="w-5 h-5 text-black" />
            </div>
            <span className="font-semibold text-xl tracking-tight text-white">LEKHVA</span>
          </div>
          <a href="https://github.com/keshavagarwalbiz-spec/Lekhva-ERP" className="text-sm font-medium hover:text-white transition-colors">
            GitHub
          </a>
        </nav>

        {/* Hero Section */}
        <section className="relative pt-32 pb-20 md:pt-48 md:pb-32 px-6 flex flex-col items-center text-center">
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/5 border border-white/10 text-sm font-medium text-neutral-300 mb-8 backdrop-blur-md"
          >
            <span className="flex h-2 w-2 rounded-full bg-amber-500 animate-pulse"></span>
            Open Source ERP for India
          </motion.div>
          
          <motion.h1 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.1 }}
            className="text-5xl md:text-8xl font-bold tracking-tighter text-white mb-8 max-w-5xl leading-[1.1]"
          >
            Financial software that <br className="hidden md:block" />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 to-orange-600">
              actually works for you.
            </span>
          </motion.h1>

          <motion.p 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.2 }}
            className="text-lg md:text-2xl text-neutral-400 mb-12 max-w-2xl font-light"
          >
            Tally costs ₹54,000. Zoho Books costs ₹30,000. Most businesses use 10% of the features. Lekhva is free, open-source, and perfectly tailored for Indian GST.
          </motion.p>

          <motion.div 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.3 }}
            className="flex flex-col sm:flex-row gap-4"
          >
            <a href="#" className="inline-flex items-center justify-center gap-2 bg-white text-black px-8 py-4 rounded-xl font-medium hover:bg-neutral-200 transition-colors text-lg">
              Get Started <ArrowRight className="w-5 h-5" />
            </a>
            <a href="#" className="inline-flex items-center justify-center gap-2 bg-white/5 text-white px-8 py-4 rounded-xl font-medium border border-white/10 hover:bg-white/10 transition-colors text-lg">
              View on GitHub
            </a>
          </motion.div>
        </section>

        {/* Dashboard Preview / Abstract UI */}
        <section className="px-4 md:px-12 pb-32 max-w-7xl mx-auto">
          <motion.div 
            initial={{ opacity: 0, y: 40 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-100px" }}
            transition={{ duration: 1 }}
            className="relative rounded-2xl md:rounded-[2.5rem] bg-neutral-900 border border-white/10 p-2 overflow-hidden shadow-2xl"
          >
            <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent z-10" />
            <img 
              src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=2000" 
              alt="Dashboard visualization" 
              className="w-full h-[400px] md:h-[600px] object-cover rounded-xl md:rounded-[2rem] opacity-50"
            />
            {/* Overlay UI elements */}
            <div className="absolute bottom-8 left-8 right-8 z-20 flex flex-col md:flex-row gap-4 justify-between items-end">
               <div className="bg-black/60 backdrop-blur-xl p-6 rounded-2xl border border-white/10">
                 <p className="text-sm text-neutral-400 mb-1">Total Revenue</p>
                 <p className="text-3xl text-white font-semibold tracking-tight">₹ 12,45,000</p>
                 <p className="text-xs text-emerald-400 mt-2 flex items-center gap-1"><CheckCircle2 className="w-3 h-3"/> Up 14% this month</p>
               </div>
               <div className="bg-amber-500/10 backdrop-blur-xl p-6 rounded-2xl border border-amber-500/20 w-full md:w-auto">
                 <p className="text-sm text-amber-500 mb-1">GST Output Status</p>
                 <p className="text-lg text-white font-medium">Reconciled</p>
               </div>
            </div>
          </motion.div>
        </section>

        {/* Bento Grid Features */}
        <section className="px-4 md:px-12 pb-32 max-w-7xl mx-auto">
          <div className="mb-16 text-center">
            <h2 className="text-3xl md:text-5xl font-bold tracking-tight text-white mb-6">Everything you need, nothing you don&apos;t.</h2>
            <p className="text-xl text-neutral-400">A meticulously crafted toolkit for the modern Indian business.</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <FeatureCard 
              className="md:col-span-2"
              delay={0.1}
              icon={ShieldCheck}
              title="100% GST Compliant Engine"
              description="Built-in logic for 38 state codes. Automatic Place of Supply detection. Intra-state gets CGST + SGST. Inter-state gets IGST. Zero manual tax calculation, zero errors."
            />
            <FeatureCard 
              delay={0.2}
              icon={Receipt}
              title="Automated Invoicing"
              description="Generate beautiful, professional invoices in seconds. One click to email them to your clients."
            />
            <FeatureCard 
              delay={0.3}
              icon={Server}
              title="Own Your Data"
              description="Self-host Lekhva on your own servers. No vendor lock-in, complete privacy, absolute control."
            />
            <FeatureCard 
              className="md:col-span-2"
              delay={0.4}
              icon={BarChart3}
              title="The Perfect Ledger"
              description="Every invoice auto-posts a balanced journal entry. Debit Accounts Receivable. Credit Sales Revenue. Credit Output Tax. Always balanced. Always accurate."
            />
          </div>
        </section>

        {/* CTA Section */}
        <section className="px-4 md:px-12 pb-32">
          <motion.div 
            initial={{ opacity: 0, scale: 0.95 }}
            whileInView={{ opacity: 1, scale: 1 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
            className="max-w-5xl mx-auto bg-gradient-to-br from-amber-500/10 to-orange-600/10 border border-amber-500/20 rounded-[3rem] p-12 md:p-20 text-center relative overflow-hidden"
          >
            <div className="absolute inset-0 bg-[url(https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?q=80&w=2564&auto=format&fit=crop)] mix-blend-overlay opacity-[0.03] bg-cover" />
            <h2 className="text-4xl md:text-6xl font-bold text-white mb-6 relative z-10">Stop paying for SaaS subscriptions.</h2>
            <p className="text-xl text-neutral-300 mb-10 max-w-2xl mx-auto relative z-10">
              Join the growing community of businesses running on open-source software. Free forever under the MIT license.
            </p>
            <a href="https://github.com/keshavagarwalbiz-spec/Lekhva-ERP" className="inline-flex items-center justify-center gap-2 bg-amber-500 text-black px-10 py-5 rounded-2xl font-bold hover:bg-amber-400 transition-colors text-lg relative z-10">
              Get Lekhva Now <ArrowRight className="w-5 h-5" />
            </a>
          </motion.div>
        </section>

        {/* Footer */}
        <footer className="border-t border-white/10 py-12 px-6 md:px-12 flex flex-col md:flex-row justify-between items-center bg-black/50 backdrop-blur-xl">
          <div className="flex items-center gap-3 mb-6 md:mb-0">
            <Zap className="w-5 h-5 text-amber-500" />
            <span className="font-semibold text-lg tracking-wide text-white">LEKHVA</span>
          </div>
          <div className="text-neutral-500 text-sm flex gap-8 font-medium">
            <span className="hover:text-white transition-colors cursor-pointer">MIT LICENSE</span>
            <span className="hover:text-white transition-colors cursor-pointer">OPEN SOURCE</span>
            <span className="hover:text-white transition-colors cursor-pointer">INDIA</span>
          </div>
        </footer>

      </div>
    </main>
  );
}
'

New-Item -Path "apps/web/src/components/layout" -ItemType Directory -Force;

New-Item -Path "apps/web/src/components/layout/Navbar.tsx" -ItemType File -Force -Value '
"use client";

import Link from "next/link";
import { Zap } from "lucide-react";
import { usePathname } from "next/navigation";

export function Navbar() {
  const pathname = usePathname();

  const links = [
    { name: "Features", href: "/features" },
    { name: "Pricing", href: "/pricing" },
    { name: "About", href: "/about" },
  ];

  return (
    <nav className="fixed top-0 w-full px-6 py-6 flex justify-between items-center z-50 bg-black/50 backdrop-blur-xl border-b border-white/5">
      <Link href="/" className="flex items-center gap-2 group">
        <div className="w-8 h-8 rounded-lg bg-amber-500 flex items-center justify-center group-hover:scale-105 transition-transform">
          <Zap className="w-5 h-5 text-black" />
        </div>
        <span className="font-semibold text-xl tracking-tight text-white">LEKHVA</span>
      </Link>
      
      <div className="hidden md:flex items-center gap-8">
        {links.map((link) => (
          <Link 
            key={link.name} 
            href={link.href}
            className={`text-sm font-medium transition-colors hover:text-white ${
              pathname === link.href ? "text-white" : "text-neutral-400"
            }`}
          >
            {link.name}
          </Link>
        ))}
      </div>

      <div className="flex items-center gap-4">
        <Link 
          href="/contact" 
          className="text-sm font-medium text-black bg-white px-5 py-2.5 rounded-full hover:bg-neutral-200 transition-colors"
        >
          Book a Demo
        </Link>
      </div>
    </nav>
  );
}
';

New-Item -Path "apps/web/src/components/layout/Footer.tsx" -ItemType File -Force -Value '
import Link from "next/link";
import { Zap } from "lucide-react";

export function Footer() {
  return (
    <footer className="border-t border-white/10 py-12 px-6 md:px-12 flex flex-col md:flex-row justify-between items-center bg-black/50 backdrop-blur-xl relative z-10">
      <div className="flex items-center gap-3 mb-6 md:mb-0">
        <Zap className="w-5 h-5 text-amber-500" />
        <span className="font-semibold text-lg tracking-wide text-white">LEKHVA</span>
      </div>
      <div className="text-neutral-500 text-sm flex gap-8 font-medium">
        <Link href="/features" className="hover:text-white transition-colors">Features</Link>
        <Link href="/pricing" className="hover:text-white transition-colors">Pricing</Link>
        <Link href="/about" className="hover:text-white transition-colors">About Us</Link>
        <Link href="/contact" className="hover:text-white transition-colors">Contact</Link>
      </div>
    </footer>
  );
}
';

New-Item -Path "apps/web/src/components/layout/CinematicBackground.tsx" -ItemType File -Force -Value '
export function CinematicBackground() {
  return (
    <div className="fixed inset-0 z-0 pointer-events-none">
      <div className="absolute top-[-20%] left-[-10%] w-[50%] h-[50%] rounded-full bg-amber-600/10 blur-[120px]" />
      <div className="absolute bottom-[-20%] right-[-10%] w-[50%] h-[50%] rounded-full bg-orange-600/5 blur-[120px]" />
      <div className="absolute inset-0 bg-[linear-gradient(to_right,#8080800a_1px,transparent_1px),linear-gradient(to_bottom,#8080800a_1px,transparent_1px)] bg-[size:24px_24px]" />
    </div>
  );
}
';

New-Item -Path "apps/web/src/app/layout.tsx" -ItemType File -Force -Value '
import "./globals.css";
import type { Metadata } from "next";
import { Navbar } from "@/components/layout/Navbar";
import { Footer } from "@/components/layout/Footer";
import { CinematicBackground } from "@/components/layout/CinematicBackground";

export const metadata: Metadata = {
  title: "Lekhva | The Modern ERP for India",
  description: "Financial software that actually works for you.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased bg-[#050505] text-neutral-200 font-sans min-h-screen flex flex-col selection:bg-amber-500/30 overflow-x-hidden">
        <CinematicBackground />
        <Navbar />
        <main className="flex-1 pt-24 relative z-10">
          {children}
        </main>
        <Footer />
      </body>
    </html>
  );
}
';


New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion } from "framer-motion";
import { ArrowRight, CheckCircle2, ShieldCheck, Zap, Server, BarChart3, Receipt } from "lucide-react";
import Link from "next/link";

const FeatureCard = ({ icon: Icon, title, description, delay = 0, className = "" }: any) => (
  <motion.div
    initial={{ opacity: 0, y: 20 }}
    whileInView={{ opacity: 1, y: 0 }}
    viewport={{ once: true, margin: "-100px" }}
    transition={{ duration: 0.5, delay }}
    className={`group relative overflow-hidden rounded-3xl bg-neutral-900/50 border border-white/10 p-8 hover:bg-neutral-900/80 transition-colors ${className}`}
  >
    <div className="absolute inset-0 bg-gradient-to-br from-amber-500/5 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
    <Icon className="w-10 h-10 text-amber-500 mb-6" />
    <h3 className="text-xl font-medium text-white mb-3">{title}</h3>
    <p className="text-neutral-400 leading-relaxed">{description}</p>
  </motion.div>
);

export default function Home() {
  return (
    <div className="pb-20">
      {/* Hero Section */}
      <section className="relative pt-12 pb-20 md:pt-24 md:pb-32 px-6 flex flex-col items-center text-center">
        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.8, ease: "easeOut" }}
          className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/5 border border-white/10 text-sm font-medium text-neutral-300 mb-8 backdrop-blur-md"
        >
          <span className="flex h-2 w-2 rounded-full bg-amber-500 animate-pulse"></span>
          Meet the new standard for Indian SMBs
        </motion.div>
        
        <motion.h1 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.1 }}
          className="text-5xl md:text-8xl font-bold tracking-tighter text-white mb-8 max-w-5xl leading-[1.1]"
        >
          Financial software that <br className="hidden md:block" />
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-amber-400 to-orange-600">
            actually works for you.
          </span>
        </motion.h1>

        <motion.p 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="text-lg md:text-2xl text-neutral-400 mb-12 max-w-2xl font-light"
        >
          Stop paying ₹50,000+ for legacy ERPs. Lekhva is the modern, lightning-fast platform tailored perfectly for Indian GST.
        </motion.p>

        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.3 }}
          className="flex flex-col sm:flex-row gap-4"
        >
          <Link href="/pricing" className="inline-flex items-center justify-center gap-2 bg-white text-black px-8 py-4 rounded-xl font-medium hover:bg-neutral-200 transition-colors text-lg shadow-[0_0_40px_rgba(245,158,11,0.2)]">
            Start Free Trial <ArrowRight className="w-5 h-5" />
          </Link>
          <Link href="/contact" className="inline-flex items-center justify-center gap-2 bg-white/5 text-white px-8 py-4 rounded-xl font-medium border border-white/10 hover:bg-white/10 transition-colors text-lg">
            Book a Demo
          </Link>
        </motion.div>
      </section>

      {/* Dashboard Preview / Abstract UI */}
      <section className="px-4 md:px-12 pb-32 max-w-7xl mx-auto">
        <motion.div 
          initial={{ opacity: 0, y: 40 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: "-100px" }}
          transition={{ duration: 1 }}
          className="relative rounded-2xl md:rounded-[2.5rem] bg-neutral-900 border border-white/10 p-2 overflow-hidden shadow-2xl"
        >
          <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent z-10" />
          <img 
            src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=2000" 
            alt="Dashboard visualization" 
            className="w-full h-[400px] md:h-[600px] object-cover rounded-xl md:rounded-[2rem] opacity-50"
          />
          {/* Overlay UI elements */}
          <div className="absolute bottom-8 left-8 right-8 z-20 flex flex-col md:flex-row gap-4 justify-between items-end">
             <div className="bg-black/60 backdrop-blur-xl p-6 rounded-2xl border border-white/10">
               <p className="text-sm text-neutral-400 mb-1">Total Revenue</p>
               <p className="text-3xl text-white font-semibold tracking-tight">₹ 12,45,000</p>
               <p className="text-xs text-emerald-400 mt-2 flex items-center gap-1"><CheckCircle2 className="w-3 h-3"/> Up 14% this month</p>
             </div>
             <div className="bg-amber-500/10 backdrop-blur-xl p-6 rounded-2xl border border-amber-500/20 w-full md:w-auto">
               <p className="text-sm text-amber-500 mb-1">GST Output Status</p>
               <p className="text-lg text-white font-medium">Reconciled</p>
             </div>
          </div>
        </motion.div>
      </section>

      {/* Bento Grid Features */}
      <section className="px-4 md:px-12 pb-32 max-w-7xl mx-auto">
        <div className="mb-16 text-center">
          <h2 className="text-3xl md:text-5xl font-bold tracking-tight text-white mb-6">Everything you need, nothing you don&apos;t.</h2>
          <p className="text-xl text-neutral-400">A meticulously crafted toolkit for the modern Indian business.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <FeatureCard 
            className="md:col-span-2"
            delay={0.1}
            icon={ShieldCheck}
            title="100% GST Compliant Engine"
            description="Built-in logic for 38 state codes. Automatic Place of Supply detection. Intra-state gets CGST + SGST. Inter-state gets IGST. Zero manual tax calculation, zero errors."
          />
          <FeatureCard 
            delay={0.2}
            icon={Receipt}
            title="Automated Invoicing"
            description="Generate beautiful, professional invoices in seconds. One click to email them to your clients."
          />
          <FeatureCard 
            delay={0.3}
            icon={Server}
            title="Cloud or On-Premise"
            description="Choose our managed cloud service for zero-hassle setup, or self-host on your own infrastructure for ultimate control."
          />
          <FeatureCard 
            className="md:col-span-2"
            delay={0.4}
            icon={BarChart3}
            title="The Perfect Ledger"
            description="Every invoice auto-posts a balanced journal entry. Debit Accounts Receivable. Credit Sales Revenue. Credit Output Tax. Always balanced. Always accurate."
          />
        </div>
      </section>

      {/* CTA Section */}
      <section className="px-4 md:px-12">
        <motion.div 
          initial={{ opacity: 0, scale: 0.95 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="max-w-5xl mx-auto bg-gradient-to-br from-amber-500/10 to-orange-600/10 border border-amber-500/20 rounded-[3rem] p-12 md:p-20 text-center relative overflow-hidden"
        >
          <div className="absolute inset-0 bg-[url(https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?q=80&w=2564&auto=format&fit=crop)] mix-blend-overlay opacity-[0.03] bg-cover" />
          <h2 className="text-4xl md:text-6xl font-bold text-white mb-6 relative z-10">Ready to upgrade your finance stack?</h2>
          <p className="text-xl text-neutral-300 mb-10 max-w-2xl mx-auto relative z-10">
            Join the growing community of businesses running on Lekhva. Try it free today.
          </p>
          <div className="flex justify-center gap-4 relative z-10">
            <Link href="/pricing" className="inline-flex items-center justify-center gap-2 bg-amber-500 text-black px-10 py-5 rounded-2xl font-bold hover:bg-amber-400 transition-colors text-lg">
              View Pricing <ArrowRight className="w-5 h-5" />
            </Link>
          </div>
        </motion.div>
      </section>
    </div>
  );
}
'

New-Item -Path "apps/web/src/app/features" -ItemType Directory -Force;
New-Item -Path "apps/web/src/app/features/page.tsx" -ItemType File -Force -Value '
import { ShieldCheck, Receipt, BarChart3, Cloud, Search, Workflow, Lock, Zap } from "lucide-react";

const features = [
  { icon: ShieldCheck, name: "GST Compliance Engine", description: "Automated 38 state code logic, intelligent CGST/SGST/IGST splitting, and real-time HSN/SAC validation." },
  { icon: Receipt, name: "Smart Invoicing", description: "Generate beautiful e-invoices with embedded QR codes. Setup recurring billing and automated payment reminders." },
  { icon: BarChart3, name: "Double-Entry Ledger", description: "Automated journal posting ensures your balance sheet, P&L, and trial balance are always perfectly reconciled." },
  { icon: Cloud, name: "Cloud & On-Premise", description: "Deploy instantly on our managed cloud, or host it yourself in your own AWS/Azure environment." },
  { icon: Search, name: "Global Search", description: "Find any transaction, invoice, or customer instantly with our lightning-fast fuzzy search engine." },
  { icon: Workflow, name: "Approval Workflows", description: "Set up multi-level approval hierarchies for large expenses and critical journal entries." },
  { icon: Lock, name: "Bank-Grade Security", description: "End-to-end encryption, regular penetration testing, and granular role-based access control." },
  { icon: Zap, name: "Real-time Analytics", description: "Live dashboard tracking cash flow, outstanding receivables, and automated tax liability projections." }
];

export default function FeaturesPage() {
  return (
    <div className="min-h-screen px-6 py-20 md:py-32 max-w-7xl mx-auto">
      <div className="text-center mb-20">
        <h1 className="text-4xl md:text-6xl font-bold text-white mb-6">Built for scale. Designed for speed.</h1>
        <p className="text-xl text-neutral-400 max-w-3xl mx-auto">
          Explore the powerful modules that make Lekhva the ultimate financial operating system for Indian businesses.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
        {features.map((feature, i) => {
          const Icon = feature.icon;
          return (
            <div key={i} className="bg-neutral-900/40 border border-white/5 p-8 rounded-3xl hover:bg-neutral-900/80 transition-colors">
              <div className="w-12 h-12 bg-amber-500/10 rounded-2xl flex items-center justify-center mb-6">
                <Icon className="w-6 h-6 text-amber-500" />
              </div>
              <h3 className="text-xl font-semibold text-white mb-3">{feature.name}</h3>
              <p className="text-neutral-400 text-sm leading-relaxed">{feature.description}</p>
            </div>
          )
        })}
      </div>
    </div>
  );
}
';

New-Item -Path "apps/web/src/app/pricing" -ItemType Directory -Force;
New-Item -Path "apps/web/src/app/pricing/page.tsx" -ItemType File -Force -Value '
import { Check } from "lucide-react";

export default function PricingPage() {
  return (
    <div className="min-h-screen px-6 py-20 md:py-32 max-w-7xl mx-auto">
      <div className="text-center mb-20">
        <h1 className="text-4xl md:text-6xl font-bold text-white mb-6">Simple, transparent pricing</h1>
        <p className="text-xl text-neutral-400 max-w-2xl mx-auto">
          Whether you self-host for free or use our managed cloud, Lekhva scales with your business.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
        {/* Starter */}
        <div className="bg-neutral-900/40 border border-white/5 p-10 rounded-3xl flex flex-col">
          <h3 className="text-2xl font-semibold text-white mb-2">Self-Hosted</h3>
          <p className="text-neutral-400 mb-8 h-12">For technical teams who want absolute control.</p>
          <div className="text-5xl font-bold text-white mb-8">₹0<span className="text-lg text-neutral-500 font-normal">/forever</span></div>
          <ul className="space-y-4 mb-10 flex-1">
            {["Full source code access", "Unlimited users", "Community support", "Self-managed backups"].map((feature, i) => (
              <li key={i} className="flex items-center gap-3 text-neutral-300">
                <Check className="w-5 h-5 text-amber-500" /> {feature}
              </li>
            ))}
          </ul>
          <a href="https://github.com/keshavagarwalbiz-spec/Lekhva-ERP" className="w-full py-4 text-center rounded-xl bg-white/5 hover:bg-white/10 text-white font-medium border border-white/10 transition-colors">View GitHub</a>
        </div>

        {/* Pro */}
        <div className="bg-neutral-900 border border-amber-500/30 p-10 rounded-3xl flex flex-col relative shadow-[0_0_40px_rgba(245,158,11,0.1)] transform md:-translate-y-4">
          <div className="absolute -top-4 left-1/2 -translate-x-1/2 bg-amber-500 text-black px-4 py-1 rounded-full text-xs font-bold uppercase tracking-wide">Most Popular</div>
          <h3 className="text-2xl font-semibold text-white mb-2">Cloud Pro</h3>
          <p className="text-neutral-400 mb-8 h-12">Managed hosting with automated backups and updates.</p>
          <div className="text-5xl font-bold text-white mb-8">₹2,499<span className="text-lg text-neutral-500 font-normal">/mo</span></div>
          <ul className="space-y-4 mb-10 flex-1">
            {["Zero setup required", "Automated daily backups", "99.9% Uptime SLA", "Priority email support", "Up to 50 users"].map((feature, i) => (
              <li key={i} className="flex items-center gap-3 text-neutral-300">
                <Check className="w-5 h-5 text-amber-500" /> {feature}
              </li>
            ))}
          </ul>
          <a href="/contact" className="w-full py-4 text-center rounded-xl bg-amber-500 hover:bg-amber-400 text-black font-bold transition-colors">Start Free Trial</a>
        </div>

        {/* Enterprise */}
        <div className="bg-neutral-900/40 border border-white/5 p-10 rounded-3xl flex flex-col">
          <h3 className="text-2xl font-semibold text-white mb-2">Enterprise</h3>
          <p className="text-neutral-400 mb-8 h-12">Custom deployments and dedicated engineering support.</p>
          <div className="text-5xl font-bold text-white mb-8">Custom</div>
          <ul className="space-y-4 mb-10 flex-1">
            {["On-premise deployment assistance", "Custom integrations", "Dedicated account manager", "24/7 phone support", "Unlimited everything"].map((feature, i) => (
              <li key={i} className="flex items-center gap-3 text-neutral-300">
                <Check className="w-5 h-5 text-amber-500" /> {feature}
              </li>
            ))}
          </ul>
          <a href="/contact" className="w-full py-4 text-center rounded-xl bg-white/5 hover:bg-white/10 text-white font-medium border border-white/10 transition-colors">Contact Sales</a>
        </div>
      </div>
    </div>
  );
}
';


New-Item -Path "apps/web/src/app/about" -ItemType Directory -Force;
New-Item -Path "apps/web/src/app/about/page.tsx" -ItemType File -Force -Value '
export default function AboutPage() {
  return (
    <div className="min-h-screen px-6 py-20 md:py-32 max-w-4xl mx-auto">
      <h1 className="text-4xl md:text-6xl font-bold text-white mb-12">The Lekhva Story</h1>
      
      <div className="prose prose-invert prose-lg max-w-none">
        <p className="text-2xl text-neutral-300 font-light leading-relaxed mb-12">
          Indian businesses are the backbone of the economy, yet they are forced to rely on expensive, clunky, legacy software built decades ago. We decided to change that.
        </p>

        <h3 className="text-2xl font-semibold text-white mt-12 mb-6">The Problem</h3>
        <p className="text-neutral-400 leading-relaxed mb-8">
          Walk into any small or medium business in India, and you will see the same story: 
          Accountants struggling with complex legacy ERPs that cost upwards of ₹50,000 a year. 
          Most of these businesses use less than 10% of the features they pay for. They are locked into ecosystems that are hard to use, hard to integrate, and expensive to maintain.
        </p>

        <h3 className="text-2xl font-semibold text-white mt-12 mb-6">Our Mission</h3>
        <p className="text-neutral-400 leading-relaxed mb-8">
          Lekhva was built to democratize financial software. We believe that world-class GST compliance, automated invoicing, and double-entry accounting should be accessible to every business, regardless of size. 
          By making the core engine open-source, we ensure that you are never locked in, and your data always belongs to you.
        </p>

        <div className="bg-neutral-900/50 border border-amber-500/20 rounded-3xl p-10 mt-16">
          <h4 className="text-xl font-medium text-white mb-4">Join the Movement</h4>
          <p className="text-neutral-400 mb-8">Whether you are a developer looking to contribute to the open-source core, or a business owner looking to streamline your finances, there is a place for you here.</p>
          <a href="/contact" className="inline-flex items-center gap-2 bg-amber-500 text-black px-6 py-3 rounded-xl font-bold hover:bg-amber-400 transition-colors">
            Get in Touch
          </a>
        </div>
      </div>
    </div>
  );
}
';

New-Item -Path "apps/web/src/app/contact" -ItemType Directory -Force;
New-Item -Path "apps/web/src/app/contact/page.tsx" -ItemType File -Force -Value '
"use client";

import { useState } from "react";
import { Send, CheckCircle2 } from "lucide-react";

export default function ContactPage() {
  const [submitted, setSubmitted] = useState(false);

  return (
    <div className="min-h-screen px-6 py-20 md:py-32 max-w-7xl mx-auto flex flex-col md:flex-row gap-16">
      
      <div className="flex-1">
        <h1 className="text-4xl md:text-6xl font-bold text-white mb-6">Let&apos;s talk.</h1>
        <p className="text-xl text-neutral-400 mb-12">
          Whether you want to book a demo of our Cloud Pro plan, discuss an Enterprise deployment, or just say hi, we&apos;re here for you.
        </p>
        
        <div className="space-y-8">
          <div>
            <h3 className="text-white font-medium mb-2">Email</h3>
            <a href="mailto:keshavagarwalbiz@gmail.com" className="text-amber-500 hover:text-amber-400 transition-colors">keshavagarwalbiz@gmail.com</a>
          </div>
          <div>
            <h3 className="text-white font-medium mb-2">Headquarters</h3>
            <p className="text-neutral-400">Mumbai, India</p>
          </div>
        </div>
      </div>

      <div className="flex-1">
        <div className="bg-neutral-900/60 border border-white/5 p-8 md:p-12 rounded-3xl backdrop-blur-xl">
          {submitted ? (
            <div className="text-center py-20">
              <div className="w-16 h-16 bg-emerald-500/20 rounded-full flex items-center justify-center mx-auto mb-6">
                <CheckCircle2 className="w-8 h-8 text-emerald-500" />
              </div>
              <h3 className="text-2xl font-semibold text-white mb-2">Message Sent!</h3>
              <p className="text-neutral-400">We will get back to you within 24 hours.</p>
              <button onClick={() => setSubmitted(false)} className="mt-8 text-sm text-amber-500 hover:text-amber-400">Send another message</button>
            </div>
          ) : (
            <form onSubmit={(e) => { e.preventDefault(); setSubmitted(true); }} className="space-y-6">
              <div className="grid grid-cols-2 gap-6">
                <div className="space-y-2">
                  <label className="text-sm font-medium text-neutral-300">First Name</label>
                  <input required type="text" className="w-full bg-black/50 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-amber-500 transition-colors" />
                </div>
                <div className="space-y-2">
                  <label className="text-sm font-medium text-neutral-300">Last Name</label>
                  <input required type="text" className="w-full bg-black/50 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-amber-500 transition-colors" />
                </div>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium text-neutral-300">Work Email</label>
                <input required type="email" className="w-full bg-black/50 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-amber-500 transition-colors" />
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium text-neutral-300">Company Size</label>
                <select className="w-full bg-black/50 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-amber-500 transition-colors appearance-none">
                  <option>1-10 employees</option>
                  <option>11-50 employees</option>
                  <option>51-200 employees</option>
                  <option>201+ employees</option>
                </select>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium text-neutral-300">How can we help?</label>
                <textarea required rows={4} className="w-full bg-black/50 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-amber-500 transition-colors resize-none"></textarea>
              </div>
              <button type="submit" className="w-full flex items-center justify-center gap-2 bg-amber-500 text-black font-bold py-4 rounded-xl hover:bg-amber-400 transition-colors">
                Send Message <Send className="w-4 h-4" />
              </button>
            </form>
          )}
        </div>
      </div>

    </div>
  );
}
';


New-Item -Path "apps/web/src/app/pricing/page.tsx" -ItemType File -Force -Value '
import { Check, Plus } from "lucide-react";

export default function PricingPage() {
  return (
    <div className="min-h-screen px-6 py-20 md:py-32 max-w-7xl mx-auto">
      <div className="text-center mb-20">
        <h1 className="text-4xl md:text-6xl font-bold text-white mb-6">Simple, transparent pricing</h1>
        <p className="text-xl text-neutral-400 max-w-2xl mx-auto">
          One platform. Zero compromises. Scale from your first invoice to an enterprise-grade ERP.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-24">
        {/* Free */}
        <div className="bg-neutral-900/40 border border-white/5 p-8 rounded-3xl flex flex-col">
          <h3 className="text-2xl font-semibold text-white mb-2">Free</h3>
          <p className="text-neutral-400 mb-6 text-sm">Perfect for freelancers and new sole proprietorships.</p>
          <div className="text-4xl font-bold text-white mb-6">₹0<span className="text-base text-neutral-500 font-normal">/mo</span></div>
          <div className="text-sm font-medium text-amber-500 mb-6 pb-6 border-b border-white/10">1 User • 1 Company</div>
          <ul className="space-y-4 mb-8 flex-1">
            {["50 Invoices / month", "Basic Reports", "1 Standard Template", "Community Support"].map((feature, i) => (
              <li key={i} className="flex items-start gap-3 text-sm text-neutral-300">
                <Check className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" /> {feature}
              </li>
            ))}
          </ul>
          <button className="w-full py-3 rounded-xl bg-white/5 hover:bg-white/10 text-white font-medium border border-white/10 transition-colors">Start Free</button>
        </div>

        {/* Growth */}
        <div className="bg-neutral-900/40 border border-white/5 p-8 rounded-3xl flex flex-col">
          <h3 className="text-2xl font-semibold text-white mb-2">Growth</h3>
          <p className="text-neutral-400 mb-6 text-sm">For growing small businesses needing more capacity.</p>
          <div className="text-4xl font-bold text-white mb-6">₹999<span className="text-base text-neutral-500 font-normal">/mo</span></div>
          <div className="text-sm font-medium text-amber-500 mb-6 pb-6 border-b border-white/10">5 Users • 2 Companies</div>
          <ul className="space-y-4 mb-8 flex-1">
            {["Unlimited Invoices", "1 Sales Channel", "Basic HR (≤10 emp)", "All 30+ Print Templates", "Standard Support"].map((feature, i) => (
              <li key={i} className="flex items-start gap-3 text-sm text-neutral-300">
                <Check className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" /> {feature}
              </li>
            ))}
          </ul>
          <button className="w-full py-3 rounded-xl bg-white/5 hover:bg-white/10 text-white font-medium border border-white/10 transition-colors">Start 14-Day Trial</button>
        </div>

        {/* Pro */}
        <div className="bg-neutral-900 border border-amber-500/30 p-8 rounded-3xl flex flex-col relative shadow-[0_0_40px_rgba(245,158,11,0.1)] transform lg:-translate-y-4">
          <div className="absolute -top-3 left-1/2 -translate-x-1/2 bg-amber-500 text-black px-3 py-1 rounded-full text-[10px] font-bold uppercase tracking-wide">Most Popular</div>
          <h3 className="text-2xl font-semibold text-white mb-2">Pro</h3>
          <p className="text-neutral-400 mb-6 text-sm">The complete suite for established companies.</p>
          <div className="text-4xl font-bold text-white mb-6">₹2,999<span className="text-base text-neutral-500 font-normal">/mo</span></div>
          <div className="text-sm font-medium text-amber-500 mb-6 pb-6 border-b border-white/10">15 Users • 5 Companies</div>
          <ul className="space-y-4 mb-8 flex-1">
            {["All Sales Channels", "E-Invoicing & E-Way Bill", "Full HRMS Suite", "ITR & TDS Filing", "Visual Template Designer", "Priority Support"].map((feature, i) => (
              <li key={i} className="flex items-start gap-3 text-sm text-neutral-300">
                <Check className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" /> {feature}
              </li>
            ))}
          </ul>
          <button className="w-full py-3 rounded-xl bg-amber-500 hover:bg-amber-400 text-black font-bold transition-colors">Start 14-Day Trial</button>
        </div>

        {/* Enterprise */}
        <div className="bg-neutral-900/40 border border-white/5 p-8 rounded-3xl flex flex-col">
          <h3 className="text-2xl font-semibold text-white mb-2">Enterprise</h3>
          <p className="text-neutral-400 mb-6 text-sm">Custom limits, on-premise deployments, and dedicated support.</p>
          <div className="text-4xl font-bold text-white mb-6">Custom</div>
          <div className="text-sm font-medium text-amber-500 mb-6 pb-6 border-b border-white/10">Unlimited Users & Companies</div>
          <ul className="space-y-4 mb-8 flex-1">
            {["Open API Access", "Dedicated Account Manager", "Custom Integrations", "On-Premise Server Option", "24/7 Phone Support"].map((feature, i) => (
              <li key={i} className="flex items-start gap-3 text-sm text-neutral-300">
                <Check className="w-4 h-4 text-amber-500 shrink-0 mt-0.5" /> {feature}
              </li>
            ))}
          </ul>
          <button className="w-full py-3 rounded-xl bg-white/5 hover:bg-white/10 text-white font-medium border border-white/10 transition-colors">Contact Sales</button>
        </div>
      </div>

      {/* Add-ons */}
      <div className="max-w-4xl mx-auto bg-black/40 backdrop-blur-md border border-white/10 rounded-3xl p-8 md:p-12">
        <h2 className="text-2xl font-bold text-white mb-8">Modular Add-ons</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-x-12 gap-y-6">
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Pharma / Jewelry / Mfg</span>
            <span className="text-white font-medium">+₹499-699/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Full HRMS + Payroll (>10 emp)</span>
            <span className="text-white font-medium">+₹999/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Employee Portal</span>
            <span className="text-white font-medium">+₹499/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> CA-Free Tax Suite</span>
            <span className="text-white font-medium">+₹399/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Financial Intelligence & AI</span>
            <span className="text-white font-medium">+₹499/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Invoice AI OCR + NLP</span>
            <span className="text-white font-medium">+₹599/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Project & Job Costing</span>
            <span className="text-white font-medium">+₹399/mo</span>
          </div>
          <div className="flex justify-between items-center border-b border-white/5 pb-4">
            <span className="text-neutral-300 flex items-center gap-2"><Plus className="w-4 h-4 text-neutral-500"/> Open API Access</span>
            <span className="text-white font-medium">+₹499/mo</span>
          </div>
        </div>
      </div>
    </div>
  );
}
'

New-Item -Path "apps/web/src/app/features/page.tsx" -ItemType File -Force -Value '
import { 
  ShieldCheck, Receipt, BarChart3, Cloud, FileText, 
  ShoppingCart, Truck, Users, Calculator, BrainCircuit,
  Building2, LineChart, Key, FileCheck2, Globe, ScanFace
} from "lucide-react";

export default function FeaturesPage() {
  return (
    <div className="min-h-screen px-6 py-20 md:py-32 max-w-7xl mx-auto">
      <div className="text-center mb-24">
        <h1 className="text-4xl md:text-7xl font-bold text-white mb-8 tracking-tight">One platform.<br/>Zero compromises.</h1>
        <p className="text-xl text-neutral-400 max-w-3xl mx-auto leading-relaxed">
          Lekhva replaces Tally, Zoho People, greytHR, ClearTax, and Excel. Built on a unified database, every module communicates perfectly with the rest.
        </p>
      </div>

      {/* Core ERP */}
      <div className="mb-24">
        <div className="flex items-center gap-4 mb-10">
          <div className="w-10 h-10 rounded-xl bg-amber-500/20 flex items-center justify-center">
            <Building2 className="w-5 h-5 text-amber-500" />
          </div>
          <h2 className="text-3xl font-bold text-white">Core ERP & Ledger</h2>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <FeatureCard 
            icon={BarChart3} title="Double-Entry Bookkeeping" 
            desc="Hierarchical COA, immutable journal entries, and sub-ledgers. Real-time consolidated Trial Balance, P&L, and Balance Sheet." 
          />
          <FeatureCard 
            icon={Receipt} title="GST-Compliant Invoicing" 
            desc="Auto tax determination (CGST/SGST/IGST), E-Invoicing (v1.04), E-Way Bills, and 30+ premium print templates." 
          />
          <FeatureCard 
            icon={ShoppingCart} title="Multi-Warehouse Inventory" 
            desc="FIFO/Weighted Average valuation, GRN, Landed Cost calculation, and Batch/Serial/Expiry tracking." 
          />
        </div>
      </div>

      {/* People & HRMS */}
      <div className="mb-24">
        <div className="flex items-center gap-4 mb-10">
          <div className="w-10 h-10 rounded-xl bg-amber-500/20 flex items-center justify-center">
            <Users className="w-5 h-5 text-amber-500" />
          </div>
          <h2 className="text-3xl font-bold text-white">HRMS & Payroll</h2>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <FeatureCard 
            icon={Calculator} title="Statutory Payroll" 
            desc="Automated PF, ESI, PT, and LWF computations. One-click ECR file generation and payslip emailing." 
          />
          <FeatureCard 
            icon={ScanFace} title="Attendance & Leave" 
            desc="Web/Mobile GPS clock-in, biometric API integration, roster planning, and multi-tier leave approval workflows." 
          />
          <FeatureCard 
            icon={Globe} title="Employee Portal" 
            desc="Self-service portal for tax declarations (Form 12BB), expense claims, payslip downloads, and HR help desk." 
          />
        </div>
      </div>

      {/* Tax & Compliance */}
      <div className="mb-24">
        <div className="flex items-center gap-4 mb-10">
          <div className="w-10 h-10 rounded-xl bg-amber-500/20 flex items-center justify-center">
            <FileCheck2 className="w-5 h-5 text-amber-500" />
          </div>
          <h2 className="text-3xl font-bold text-white">Tax Filing & Compliance</h2>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <FeatureCard 
            icon={FileText} title="GST Filing Engine" 
            desc="Auto-extract GSTR-1, compute GSTR-3B liability, and reconcile GSTR-2B. Direct e-filing via GSP." 
          />
          <FeatureCard 
            icon={ShieldCheck} title="ITR & TDS Returns" 
            desc="Auto-populate ITR schedules from the General Ledger. Generate 24Q, 26Q, and 27EQ returns instantly." 
          />
          <FeatureCard 
            icon={LineChart} title="Tax Planning" 
            desc="Old vs New regime comparator, 80C/80D optimizer, and predictive Advance Tax installment tracking." 
          />
        </div>
      </div>

      {/* Commerce & AI */}
      <div className="mb-24">
        <div className="flex items-center gap-4 mb-10">
          <div className="w-10 h-10 rounded-xl bg-amber-500/20 flex items-center justify-center">
            <BrainCircuit className="w-5 h-5 text-amber-500" />
          </div>
          <h2 className="text-3xl font-bold text-white">Commerce & AI</h2>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <FeatureCard 
            icon={Cloud} title="E-Commerce Sync" 
            desc="Native adapters for Amazon, Flipkart, Shopify, and WooCommerce. Centralized inventory and order deduping." 
          />
          <FeatureCard 
            icon={Truck} title="Shipping Integration" 
            desc="Shiprocket and Delhivery APIs. Auto-generate AWBs, thermal labels, and track COD remittances." 
          />
          <FeatureCard 
            icon={Key} title="Financial AI" 
            desc="Invoice OCR scanning, smart bank reconciliation, NLP queries (Ask Lekhva), and predictive cash flow." 
          />
        </div>
      </div>

    </div>
  );
}

function FeatureCard({ icon: Icon, title, desc }: { icon: any, title: string, desc: string }) {
  return (
    <div className="bg-neutral-900/40 border border-white/5 p-8 rounded-3xl hover:bg-neutral-900/80 transition-colors group">
      <div className="w-12 h-12 bg-black border border-white/10 rounded-2xl flex items-center justify-center mb-6 group-hover:border-amber-500/50 transition-colors">
        <Icon className="w-6 h-6 text-neutral-300 group-hover:text-amber-500 transition-colors" />
      </div>
      <h3 className="text-xl font-semibold text-white mb-3">{title}</h3>
      <p className="text-neutral-400 text-sm leading-relaxed">{desc}</p>
    </div>
  )
}
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion, useScroll, useTransform } from "framer-motion";
import { useRef } from "react";
import Link from "next/link";
import { ArrowRight, Cpu, Shield, Zap, LayoutGrid } from "lucide-react";

export default function Home() {
  const containerRef = useRef(null);
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end end"]
  });

  // Hero text fading out
  const heroOpacity = useTransform(scrollYProgress, [0, 0.1], [1, 0]);
  const heroScale = useTransform(scrollYProgress, [0, 0.1], [1, 0.9]);

  // Dashboard image scaling up to fill screen
  const dashboardScale = useTransform(scrollYProgress, [0.05, 0.25], [0.8, 1]);
  const dashboardY = useTransform(scrollYProgress, [0.05, 0.25], ["20vh", "0vh"]);
  const dashboardOpacity = useTransform(scrollYProgress, [0.05, 0.15], [0, 1]);

  return (
    <div ref={containerRef} className="bg-black text-white selection:bg-white selection:text-black min-h-[400vh]">
      
      {/* 1. HERO SECTION (Sticky) */}
      <div className="sticky top-0 h-screen flex flex-col items-center justify-center overflow-hidden">
        <motion.div style={{ opacity: heroOpacity, scale: heroScale }} className="text-center z-10 px-4">
          <h1 className="text-[5rem] md:text-[9rem] font-semibold tracking-tighter leading-none mb-4">
            Lekhva.
          </h1>
          <p className="text-2xl md:text-4xl font-medium tracking-tight text-neutral-400 mb-8">
            The ultimate financial engine.
          </p>
          <div className="flex gap-6 justify-center">
            <Link href="/pricing" className="text-lg bg-white text-black px-8 py-3 rounded-full font-medium hover:scale-105 transition-transform">
              Buy
            </Link>
            <Link href="/features" className="text-lg text-white px-8 py-3 rounded-full font-medium hover:bg-white/10 transition-colors flex items-center gap-2">
              Learn more <ArrowRight className="w-5 h-5" />
            </Link>
          </div>
        </motion.div>

        {/* Dashboard scaling up behind/below */}
        <motion.div 
          style={{ 
            scale: dashboardScale, 
            y: dashboardY, 
            opacity: dashboardOpacity 
          }}
          className="absolute inset-0 flex items-center justify-center z-20 pointer-events-none px-4 md:px-12 mt-32"
        >
          <div className="relative w-full max-w-7xl aspect-[16/10] rounded-2xl md:rounded-[2.5rem] overflow-hidden border border-white/10 shadow-[0_0_100px_rgba(255,255,255,0.1)] bg-[#111]">
             {/* Mock UI Image */}
             <img 
               src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=2500" 
               alt="Lekhva Interface"
               className="w-full h-full object-cover opacity-80 mix-blend-luminosity"
             />
             <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent" />
          </div>
        </motion.div>
      </div>

      {/* spacer for scroll */}
      <div className="h-screen" />

      {/* 2. TEXT REVEAL SECTION */}
      <div className="relative z-30 bg-black py-32 md:py-64">
        <div className="max-w-5xl mx-auto px-6 md:px-12">
          <motion.h2 
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-20%" }}
            transition={{ duration: 1 }}
            className="text-4xl md:text-7xl font-semibold tracking-tighter leading-tight"
          >
            Pro to the core.
            <br />
            <span className="text-neutral-500">
              A unified database for ERP, HRMS, and Tax. Everything works together. Beautifully.
            </span>
          </motion.h2>
        </div>
      </div>

      {/* 3. HARDWARE / FEATURE GRID (Apple Style) */}
      <div className="relative z-30 bg-black pb-32 md:pb-64 px-6 md:px-12 max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 md:gap-8">
          
          {/* Card 1 */}
          <motion.div 
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
            className="bg-[#111] rounded-[2.5rem] p-10 md:p-16 flex flex-col items-center text-center overflow-hidden relative min-h-[500px]"
          >
            <Cpu className="w-16 h-16 text-white mb-8" />
            <h3 className="text-3xl md:text-5xl font-semibold tracking-tight mb-4">M-Class AI Engine.</h3>
            <p className="text-xl text-neutral-400 font-medium max-w-sm">
              Scan invoices. Reconcile banks. Let AI do the heavy lifting.
            </p>
            <div className="absolute bottom-0 left-0 right-0 h-1/2 bg-gradient-to-t from-black to-transparent" />
          </motion.div>

          {/* Card 2 */}
          <motion.div 
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8, delay: 0.2 }}
            className="bg-[#111] rounded-[2.5rem] p-10 md:p-16 flex flex-col items-center text-center overflow-hidden relative min-h-[500px]"
          >
            <Shield className="w-16 h-16 text-white mb-8" />
            <h3 className="text-3xl md:text-5xl font-semibold tracking-tight mb-4">Total Compliance.</h3>
            <p className="text-xl text-neutral-400 font-medium max-w-sm">
              GSTR-1 to ITR-7. Handled flawlessly. Secure by design.
            </p>
            <div className="absolute bottom-0 left-0 right-0 h-1/2 bg-gradient-to-t from-black to-transparent" />
          </motion.div>

        </div>
      </div>

      {/* 4. FINAL CTA */}
      <div className="relative z-30 bg-black py-32 flex flex-col items-center text-center px-4">
        <h2 className="text-[4rem] md:text-[8rem] font-semibold tracking-tighter leading-none mb-12">
          Ready?
        </h2>
        <div className="flex gap-6">
          <Link href="/pricing" className="text-2xl bg-white text-black px-12 py-5 rounded-full font-medium hover:scale-105 transition-transform">
            Buy Now
          </Link>
        </div>
      </div>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion, useScroll, useTransform } from "framer-motion";
import { useRef } from "react";
import Link from "next/link";
import { ArrowRight, Cpu, Shield, Users, Calculator, FileText, Smartphone, Globe, Cloud } from "lucide-react";

export default function Home() {
  const containerRef = useRef(null);
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end end"]
  });

  // Hero animations
  const heroOpacity = useTransform(scrollYProgress, [0, 0.05], [1, 0]);
  const heroScale = useTransform(scrollYProgress, [0, 0.05], [1, 0.9]);
  
  // Dashboard image scaling
  const dashboardScale = useTransform(scrollYProgress, [0.02, 0.15], [0.7, 1]);
  const dashboardY = useTransform(scrollYProgress, [0.02, 0.15], ["30vh", "0vh"]);
  const dashboardOpacity = useTransform(scrollYProgress, [0.01, 0.1], [0, 1]);

  return (
    <div ref={containerRef} className="bg-black text-white selection:bg-white selection:text-black min-h-[500vh] font-sans">
      
      {/* 1. SCROLL-LINKED HERO */}
      <div className="sticky top-0 h-screen flex flex-col items-center justify-center overflow-hidden">
        <motion.div style={{ opacity: heroOpacity, scale: heroScale }} className="text-center z-10 px-4">
          <h1 className="text-[5rem] md:text-[10rem] font-semibold tracking-tighter leading-none mb-2">
            Lekhva.
          </h1>
          <p className="text-2xl md:text-5xl font-medium tracking-tight text-neutral-400 mb-8">
            Enterprise power. Unbelievably simple.
          </p>
          <div className="flex gap-6 justify-center">
            <Link href="/pricing" className="text-lg bg-white text-black px-8 py-3 rounded-full font-medium hover:scale-105 transition-transform">
              Buy Now
            </Link>
            <Link href="/features" className="text-lg text-white px-8 py-3 rounded-full font-medium hover:bg-white/10 transition-colors flex items-center gap-2">
              Explore Platform <ArrowRight className="w-5 h-5" />
            </Link>
          </div>
        </motion.div>

        <motion.div 
          style={{ 
            scale: dashboardScale, 
            y: dashboardY, 
            opacity: dashboardOpacity 
          }}
          className="absolute inset-0 flex items-center justify-center z-20 pointer-events-none px-4 md:px-12 mt-40"
        >
          <div className="relative w-full max-w-7xl aspect-[16/10] rounded-2xl md:rounded-[2.5rem] overflow-hidden border border-white/10 shadow-[0_0_100px_rgba(255,255,255,0.05)] bg-[#111]">
             <img 
               src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=2500" 
               alt="Lekhva Interface"
               className="w-full h-full object-cover opacity-90 mix-blend-luminosity"
             />
             <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-80" />
          </div>
        </motion.div>
      </div>

      {/* Spacer for sticky hero */}
      <div className="h-[100vh]" />

      {/* 2. THE PHILOSOPHY (Big Text Reveal) */}
      <div className="relative z-30 bg-black py-32 md:py-64">
        <div className="max-w-6xl mx-auto px-6 md:px-12">
          <motion.h2 
            initial={{ opacity: 0, y: 50 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-20%" }}
            transition={{ duration: 1 }}
            className="text-4xl md:text-7xl font-semibold tracking-tighter leading-tight"
          >
            Tally, Zoho, and Excel. 
            <br />
            <span className="text-neutral-500">
              Replaced by one unified database. From double-entry bookkeeping to your team&apos;s payroll, everything works together. Beautifully.
            </span>
          </motion.h2>
        </div>
      </div>

      {/* 3. CORE ERP & INVOICING */}
      <div className="relative z-30 bg-black pb-32 px-6 md:px-12 max-w-7xl mx-auto">
        <div className="mb-20">
          <h2 className="text-4xl md:text-6xl font-bold tracking-tight mb-6">Core ERP. Absolute control.</h2>
          <p className="text-2xl text-neutral-400 max-w-3xl">Manage multiple companies, complex inventories, and premium invoicing without breaking a sweat.</p>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-12 gap-6">
          <div className="md:col-span-8 bg-[#111] rounded-[2.5rem] p-10 md:p-16 overflow-hidden relative min-h-[400px]">
            <h3 className="text-3xl font-semibold mb-4">Premium Invoicing.</h3>
            <p className="text-lg text-neutral-400 max-w-md">30+ designer print templates. Auto GST determination. E-Invoicing out of the box.</p>
            <FileText className="absolute bottom-[-20%] right-[-10%] w-96 h-96 text-white/5" />
          </div>
          <div className="md:col-span-4 bg-[#111] rounded-[2.5rem] p-10 overflow-hidden relative min-h-[400px]">
            <h3 className="text-3xl font-semibold mb-4">Multi-Warehouse.</h3>
            <p className="text-lg text-neutral-400">FIFO, landed costs, and barcode tracking.</p>
          </div>
          <div className="md:col-span-4 bg-[#111] rounded-[2.5rem] p-10 overflow-hidden relative min-h-[400px]">
            <Globe className="w-12 h-12 mb-6" />
            <h3 className="text-3xl font-semibold mb-4">E-Commerce Sync.</h3>
            <p className="text-lg text-neutral-400">Amazon, Shopify, and Flipkart.</p>
          </div>
          <div className="md:col-span-8 bg-[#111] rounded-[2.5rem] p-10 md:p-16 overflow-hidden relative min-h-[400px]">
            <h3 className="text-3xl font-semibold mb-4">Double-Entry Ledger.</h3>
            <p className="text-lg text-neutral-400 max-w-md">Hierarchical COA with immutable journal entries. Real-time consolidated balance sheets across your entire group of companies.</p>
            <Calculator className="absolute bottom-[-20%] right-[-10%] w-96 h-96 text-white/5" />
          </div>
        </div>
      </div>

      {/* 4. HRMS & PAYROLL */}
      <div className="relative z-30 bg-black py-32 px-6 md:px-12 max-w-7xl mx-auto">
        <div className="flex flex-col md:flex-row items-center gap-16">
          <div className="flex-1">
            <motion.div
              initial={{ opacity: 0, x: -50 }}
              whileInView={{ opacity: 1, x: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.8 }}
            >
              <h2 className="text-5xl md:text-7xl font-bold tracking-tight mb-8">Your people.<br/>Managed perfectly.</h2>
              <p className="text-2xl text-neutral-400 mb-8">
                A complete HRMS built right in. From applicant tracking to full & final settlement.
              </p>
              <ul className="space-y-4 text-lg text-neutral-300">
                <li className="flex items-center gap-4"><Users className="w-6 h-6 text-white"/> GPS & Biometric Attendance</li>
                <li className="flex items-center gap-4"><Calculator className="w-6 h-6 text-white"/> Auto PF, ESI, PT, and TDS Computations</li>
                <li className="flex items-center gap-4"><Smartphone className="w-6 h-6 text-white"/> Employee Self-Service App</li>
              </ul>
            </motion.div>
          </div>
          <div className="flex-1 w-full aspect-square bg-[#111] rounded-[3rem] p-8 border border-white/5">
             {/* Abstract HR UI representation */}
             <div className="w-full h-full rounded-[2rem] border border-white/10 bg-black/50 p-6 flex flex-col gap-4">
                <div className="h-20 w-full rounded-2xl bg-white/5 flex items-center px-6 gap-4">
                  <div className="w-10 h-10 rounded-full bg-white/20" />
                  <div>
                    <div className="h-3 w-32 bg-white/80 rounded mb-2" />
                    <div className="h-2 w-20 bg-white/40 rounded" />
                  </div>
                  <div className="ml-auto text-emerald-400 text-sm font-medium">Payslip Generated</div>
                </div>
                <div className="h-20 w-full rounded-2xl bg-white/5 flex items-center px-6 gap-4">
                  <div className="w-10 h-10 rounded-full bg-white/20" />
                  <div>
                    <div className="h-3 w-32 bg-white/80 rounded mb-2" />
                    <div className="h-2 w-20 bg-white/40 rounded" />
                  </div>
                  <div className="ml-auto text-amber-500 text-sm font-medium">Leave Pending</div>
                </div>
             </div>
          </div>
        </div>
      </div>

      {/* 5. TAX & COMPLIANCE */}
      <div className="relative z-30 bg-[#111] py-32 mt-32 rounded-[3rem] mx-4 md:mx-12 overflow-hidden">
        <div className="max-w-6xl mx-auto px-6 md:px-12 text-center">
          <Shield className="w-20 h-20 text-white mx-auto mb-8" />
          <h2 className="text-5xl md:text-8xl font-bold tracking-tight mb-8">GSTR-1 to ITR-7.<br/>Handled.</h2>
          <p className="text-2xl text-neutral-400 max-w-3xl mx-auto mb-16">
            Direct integration with GSTN and CBDT. Auto-extract data from your ledger, reconcile 26AS/AIS, and e-file your returns without leaving Lekhva.
          </p>
          <div className="flex justify-center">
             <Link href="/features" className="text-lg text-white px-8 py-3 rounded-full font-medium bg-white/10 hover:bg-white/20 transition-colors">
               Explore Compliance Features
             </Link>
          </div>
        </div>
      </div>

      {/* 6. AI ENGINE */}
      <div className="relative z-30 bg-black py-32 md:py-64 px-6 md:px-12 max-w-7xl mx-auto flex flex-col md:flex-row-reverse items-center gap-16">
        <div className="flex-1">
          <motion.div
            initial={{ opacity: 0, x: 50 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.8 }}
          >
            <h2 className="text-5xl md:text-7xl font-bold tracking-tight mb-8">Meet your new<br/>financial analyst.</h2>
            <p className="text-2xl text-neutral-400 mb-8">
              Lekhva&apos;s M-Class AI Engine automatically scans vendor invoices, suggests bank reconciliations, and predicts your cash flow using advanced machine learning.
            </p>
            <div className="flex items-center gap-4 text-lg text-white font-medium bg-[#111] p-6 rounded-2xl border border-white/10">
               <Cpu className="w-8 h-8" /> Powered by Google Gemini & Vercel AI
            </div>
          </motion.div>
        </div>
        <div className="flex-1 w-full aspect-[4/3] bg-[#111] rounded-[3rem] border border-white/5 relative overflow-hidden flex items-center justify-center p-8">
            <div className="text-left w-full max-w-sm">
              <div className="bg-black/80 backdrop-blur p-6 rounded-2xl border border-white/10 mb-4 shadow-2xl transform -rotate-2">
                 <p className="text-sm text-neutral-400 mb-2">You</p>
                 <p className="text-white">Show me the top 5 customers by revenue this quarter.</p>
              </div>
              <div className="bg-white/10 backdrop-blur p-6 rounded-2xl border border-white/20 shadow-2xl transform translate-x-8">
                 <p className="text-sm text-neutral-400 mb-3">Lekhva AI</p>
                 <div className="space-y-3">
                   <div className="flex justify-between text-white text-sm"><span className="font-medium">1. Reliance Retail</span><span>₹45.2L</span></div>
                   <div className="w-full bg-white/10 h-1.5 rounded-full overflow-hidden"><div className="bg-white w-[80%] h-full"></div></div>
                   
                   <div className="flex justify-between text-white text-sm mt-2"><span className="font-medium">2. Tata Motors</span><span>₹32.8L</span></div>
                   <div className="w-full bg-white/10 h-1.5 rounded-full overflow-hidden"><div className="bg-white w-[60%] h-full"></div></div>
                 </div>
              </div>
            </div>
        </div>
      </div>

      {/* 7. CROSS PLATFORM & FINAL CTA */}
      <div className="relative z-30 bg-black py-32 flex flex-col items-center text-center px-4 border-t border-white/10">
        <Cloud className="w-16 h-16 text-white mb-8" />
        <h2 className="text-[3rem] md:text-[6rem] font-bold tracking-tighter leading-none mb-8">
          Web. Desktop. Mobile.
        </h2>
        <p className="text-2xl text-neutral-400 max-w-2xl mx-auto mb-16">
          Access your data anywhere. Download the ~30MB desktop app for offline POS and thermal printing, or use the mobile app for on-the-go approvals.
        </p>
        <div className="flex gap-6">
          <Link href="/pricing" className="text-2xl bg-white text-black px-12 py-5 rounded-full font-medium hover:scale-105 transition-transform">
            Start 14-Day Trial
          </Link>
          <Link href="/contact" className="text-2xl text-white px-12 py-5 rounded-full font-medium bg-[#111] hover:bg-white/10 transition-colors">
            Contact Sales
          </Link>
        </div>
      </div>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/globals.css" -ItemType File -Force -Value '
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: #090908;
    --foreground: #f4f4f0;
  }
  
  body {
    background-color: var(--background);
    color: var(--foreground);
  }
}

.noise-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  pointer-events: none;
  z-index: 50;
  opacity: 0.04;
  background-image: url("data:image/svg+xml,%3Csvg viewBox=''0 0 200 200'' xmlns=''http://www.w3.org/2000/svg''%3E%3Cfilter id=''noiseFilter''%3E%3CfeTurbulence type=''fractalNoise'' baseFrequency=''0.65'' numOctaves=''3'' stitchTiles=''stitch''/%3E%3C/filter%3E%3Crect width=''100%25'' height=''100%25'' filter=''url(%23noiseFilter)''/%3E%3C/svg%3E");
}
';

New-Item -Path "apps/web/src/app/layout.tsx" -ItemType File -Force -Value '
import "./globals.css";
import type { Metadata } from "next";
import { Playfair_Display, Inter } from "next/font/google";
import { Navbar } from "@/components/layout/Navbar";
import { Footer } from "@/components/layout/Footer";

const playfair = Playfair_Display({ 
  subsets: ["latin"],
  variable: "--font-serif",
});

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-sans",
});

export const metadata: Metadata = {
  title: "Lekhva | The Modern ERP",
  description: "Financial software that actually works for you.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${playfair.variable} ${inter.variable}`}>
      <body className="antialiased font-sans min-h-screen flex flex-col selection:bg-amber-900/40">
        <div className="noise-overlay" />
        <Navbar />
        <main className="flex-1 relative z-10">
          {children}
        </main>
        <Footer />
      </body>
    </html>
  );
}
';


New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion } from "framer-motion";
import Link from "next/link";
import { ArrowRight } from "lucide-react";

const fadeUp = {
  hidden: { opacity: 0, y: 40 },
  visible: { 
    opacity: 1, 
    y: 0, 
    transition: { duration: 1.2, ease: [0.16, 1, 0.3, 1] } 
  }
};

const staggerContainer = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: { staggerChildren: 0.2 }
  }
};

const StarDecoration = () => (
  <svg viewBox="0 0 24 24" className="w-8 h-8 fill-amber-700/80 mx-auto mb-8">
    <path d="M12 0Q13.1 10.9 24 12Q13.1 13.1 12 24Q10.9 13.1 0 12Q10.9 10.9 12 0Z"/>
  </svg>
);

export default function Home() {
  return (
    <div className="bg-[#090908] text-[#f4f4f0] overflow-hidden">
      
      {/* HERO SECTION */}
      <section className="min-h-screen flex flex-col items-center justify-center pt-32 pb-20 px-6 relative">
        {/* Subtle grid background for the hero */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff05_1px,transparent_1px),linear-gradient(to_bottom,#ffffff05_1px,transparent_1px)] bg-[size:64px_64px] pointer-events-none" />
        
        <motion.div 
          initial="hidden"
          animate="visible"
          variants={staggerContainer}
          className="text-center max-w-5xl mx-auto relative z-10"
        >
          <motion.div variants={fadeUp}>
            <StarDecoration />
          </motion.div>
          
          <motion.h1 
            variants={fadeUp}
            className="font-serif text-5xl md:text-[7rem] leading-[1.1] tracking-tight text-[#f4f4f0] mb-8"
          >
            Lekhva makes you <br/>
            <span className="italic text-amber-600/90">compliant.</span>
          </motion.h1>

          <motion.p 
            variants={fadeUp}
            className="text-xl md:text-3xl text-neutral-400 font-light tracking-wide max-w-3xl mx-auto mb-16 leading-relaxed"
          >
            Not another ERP on a subscription, <br className="hidden md:block"/> a partner in your growth.
          </motion.p>

          <motion.div variants={fadeUp} className="flex flex-col sm:flex-row gap-6 justify-center items-center">
            <Link href="/pricing" className="bg-[#f4f4f0] text-[#090908] px-10 py-4 rounded-full text-lg font-medium hover:bg-white transition-colors duration-300">
              Explore Pricing
            </Link>
            <Link href="/features" className="text-[#f4f4f0] px-10 py-4 rounded-full text-lg font-medium border border-white/20 hover:bg-white/5 transition-colors duration-300 flex items-center gap-2">
              The Platform <ArrowRight className="w-5 h-5" />
            </Link>
          </motion.div>
        </motion.div>
      </section>

      {/* CHAPTER 1: THE PROBLEM */}
      <section className="py-32 md:py-48 px-6 border-t border-white/5 relative">
        <motion.div 
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true, margin: "-20%" }}
          variants={staggerContainer}
          className="max-w-4xl mx-auto text-center"
        >
          <motion.div variants={fadeUp} className="text-amber-700/80 font-mono text-sm tracking-widest uppercase mb-8">
            Ch. 1 — The Problem
          </motion.div>
          <motion.h2 
            variants={fadeUp}
            className="font-serif text-4xl md:text-6xl leading-tight mb-10 text-[#f4f4f0]"
          >
            Indian SMBs pay ₹50,000 a year for software they barely use.
          </motion.h2>
          <motion.p 
            variants={fadeUp}
            className="text-xl md:text-2xl text-neutral-400 font-light leading-relaxed max-w-3xl mx-auto"
          >
            Tally costs ₹54,000. Zoho Books costs ₹30,000. Most businesses use less than 10% of the features they are paying for. We believe there is a more elegant solution.
          </motion.p>
        </motion.div>
      </section>

      {/* CHAPTER 2: THE ENGINE */}
      <section className="py-32 md:py-48 px-6 bg-[#0c0c0b] relative overflow-hidden">
        <motion.div 
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true, margin: "-20%" }}
          variants={staggerContainer}
          className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-16 items-center"
        >
          <div className="order-2 md:order-1">
             <div className="aspect-square rounded-full border border-white/5 relative flex items-center justify-center p-8">
               <div className="absolute inset-0 bg-gradient-to-tr from-amber-900/10 to-transparent rounded-full" />
               <div className="text-center font-serif text-3xl text-neutral-300 italic">
                 "Zero manual tax calculation. Zero errors."
               </div>
             </div>
          </div>
          <div className="order-1 md:order-2">
            <motion.div variants={fadeUp} className="text-amber-700/80 font-mono text-sm tracking-widest uppercase mb-8">
              Ch. 2 — The Engine
            </motion.div>
            <motion.h2 
              variants={fadeUp}
              className="font-serif text-5xl md:text-7xl leading-tight mb-10 text-[#f4f4f0]"
            >
              We calculate it.
            </motion.h2>
            <motion.p 
              variants={fadeUp}
              className="text-xl text-neutral-400 font-light leading-relaxed"
            >
              Built-in logic for 38 state codes. Automatic Place of Supply detection. Intra-state gets CGST + SGST. Inter-state gets IGST. The ultimate GST compliance engine, working silently in the background.
            </motion.p>
          </div>
        </motion.div>
      </section>

      {/* CHAPTER 3: THE LEDGER */}
      <section className="py-32 md:py-48 px-6 relative">
        <motion.div 
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true, margin: "-20%" }}
          variants={staggerContainer}
          className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-16 items-center"
        >
          <div>
            <motion.div variants={fadeUp} className="text-amber-700/80 font-mono text-sm tracking-widest uppercase mb-8">
              Ch. 3 — The Ledger
            </motion.div>
            <motion.h2 
              variants={fadeUp}
              className="font-serif text-5xl md:text-7xl leading-tight mb-10 text-[#f4f4f0]"
            >
              We balance it.
            </motion.h2>
            <motion.p 
              variants={fadeUp}
              className="text-xl text-neutral-400 font-light leading-relaxed mb-12"
            >
              Every invoice auto-posts a balanced journal entry. Debit Accounts Receivable. Credit Sales Revenue. Credit Output Tax. Always balanced. Always accurate.
            </motion.p>
          </div>
          
          <motion.div variants={fadeUp} className="bg-[#0c0c0b] rounded-[2rem] p-10 border border-white/5 shadow-2xl">
            <div className="flex justify-between text-neutral-500 font-mono text-sm border-b border-white/5 pb-4 mb-6">
                <span>ACCOUNT</span>
                <div className="flex gap-8 md:gap-16">
                  <span>DEBIT</span>
                  <span>CREDIT</span>
                </div>
            </div>
            <div className="space-y-6 font-mono text-sm md:text-base">
                <div className="flex justify-between items-center">
                  <span className="text-neutral-200">Accounts Receivable</span>
                  <div className="flex gap-8 md:gap-16">
                    <span className="text-[#f4f4f0]">₹11,800</span>
                    <span className="text-neutral-600">--</span>
                  </div>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-neutral-400 ml-4">Sales Revenue</span>
                  <div className="flex gap-8 md:gap-16">
                    <span className="text-neutral-600">--</span>
                    <span className="text-[#f4f4f0]">₹10,000</span>
                  </div>
                </div>
                <div className="flex justify-between items-center">
                  <span className="text-neutral-400 ml-4">Output IGST</span>
                  <div className="flex gap-8 md:gap-16">
                    <span className="text-neutral-600">--</span>
                    <span className="text-amber-600/90">₹1,800</span>
                  </div>
                </div>
            </div>
          </motion.div>
        </motion.div>
      </section>

      {/* CHAPTER 4: THE TERMS */}
      <section className="py-32 md:py-48 px-6 bg-[#0c0c0b] border-t border-white/5 relative">
        <motion.div 
          initial="hidden"
          whileInView="visible"
          viewport={{ once: true, margin: "-20%" }}
          variants={staggerContainer}
          className="max-w-4xl mx-auto text-center"
        >
          <motion.div variants={fadeUp}>
            <StarDecoration />
          </motion.div>
          
          <motion.h2 
            variants={fadeUp}
            className="font-serif text-5xl md:text-7xl leading-tight mb-10 text-[#f4f4f0]"
          >
            Scale on your terms.
          </motion.h2>
          <motion.p 
            variants={fadeUp}
            className="text-xl md:text-2xl text-neutral-400 font-light leading-relaxed max-w-3xl mx-auto mb-16"
          >
            Host it yourself for free, forever. Or let us manage the infrastructure on our scalable cloud. No vendor lock-in. You keep everything.
          </motion.p>
          <motion.div variants={fadeUp}>
            <Link href="/pricing" className="bg-[#f4f4f0] text-[#090908] px-12 py-5 rounded-full text-lg font-medium hover:bg-white transition-colors duration-300 inline-block">
              View Pricing
            </Link>
          </motion.div>
        </motion.div>
      </section>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/globals.css" -ItemType File -Force -Value '
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: #000000;
    --foreground: #ffffff;
  }
  
  body {
    background-color: var(--background);
    color: var(--foreground);
  }
}
';

New-Item -Path "apps/web/src/app/layout.tsx" -ItemType File -Force -Value '
import "./globals.css";
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { Navbar } from "@/components/layout/Navbar";
import { Footer } from "@/components/layout/Footer";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-sans",
});

export const metadata: Metadata = {
  title: "Lekhva | The Modern ERP",
  description: "Financial software that actually works for you.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${inter.variable}`}>
      <body className="antialiased font-sans min-h-screen flex flex-col bg-black text-white selection:bg-blue-500/30">
        <Navbar />
        <main className="flex-1 relative z-10 pt-20">
          {children}
        </main>
        <Footer />
      </body>
    </html>
  );
}
';


New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion, useScroll, useTransform, useMotionTemplate, useMotionValue } from "framer-motion";
import Link from "next/link";
import { ArrowRight, LayoutGrid, Zap, Shield, Globe, Cpu } from "lucide-react";
import { MouseEvent } from "react";

// 21st.dev style Hover Card with glowing mouse follow effect
function SpotlightCard({ children, className = "" }: { children: React.ReactNode, className?: string }) {
  const mouseX = useMotionValue(0);
  const mouseY = useMotionValue(0);

  function handleMouseMove({ currentTarget, clientX, clientY }: MouseEvent) {
    const { left, top } = currentTarget.getBoundingClientRect();
    mouseX.set(clientX - left);
    mouseY.set(clientY - top);
  }

  return (
    <div
      className={`group relative overflow-hidden rounded-3xl bg-neutral-950 border border-white/10 ${className}`}
      onMouseMove={handleMouseMove}
    >
      <motion.div
        className="pointer-events-none absolute -inset-px rounded-3xl opacity-0 transition duration-300 group-hover:opacity-100"
        style={{
          background: useMotionTemplate`
            radial-gradient(
              600px circle at ${mouseX}px ${mouseY}px,
              rgba(59, 130, 246, 0.15),
              transparent 80%
            )
          `,
        }}
      />
      <div className="relative h-full p-8 z-10">
        {children}
      </div>
    </div>
  );
}

// 21st.dev style Word Reveal Animation
function AnimatedText({ text, className }: { text: string, className?: string }) {
  const words = text.split(" ");
  return (
    <motion.h1 
      className={`flex flex-wrap justify-center gap-x-4 gap-y-2 ${className}`}
      initial="hidden"
      animate="visible"
      variants={{
        visible: { transition: { staggerChildren: 0.08 } },
        hidden: {},
      }}
    >
      {words.map((word, i) => (
        <motion.span
          key={i}
          variants={{
            hidden: { opacity: 0, y: 40, filter: "blur(10px)" },
            visible: { 
              opacity: 1, 
              y: 0, 
              filter: "blur(0px)",
              transition: { duration: 0.8, ease: [0.2, 0.65, 0.3, 0.9] } 
            }
          }}
          className="inline-block"
        >
          {word}
        </motion.span>
      ))}
    </motion.h1>
  );
}

export default function Home() {
  return (
    <div className="bg-black text-white min-h-screen font-sans overflow-hidden">
      
      {/* ANIMATED BACKGROUND GRADIANT */}
      <div className="fixed inset-0 z-0 pointer-events-none overflow-hidden flex items-center justify-center">
        <motion.div
          animate={{ 
            rotate: [0, 360], 
            scale: [1, 1.2, 1] 
          }}
          transition={{ duration: 20, repeat: Infinity, ease: "linear" }}
          className="w-[80vw] h-[80vw] max-w-[800px] max-h-[800px] rounded-full bg-blue-600/20 blur-[120px] absolute"
        />
        <motion.div
          animate={{ 
            rotate: [360, 0],
            scale: [1, 1.5, 1] 
          }}
          transition={{ duration: 25, repeat: Infinity, ease: "linear" }}
          className="w-[60vw] h-[60vw] max-w-[600px] max-h-[600px] rounded-full bg-purple-600/20 blur-[120px] absolute mix-blend-screen"
        />
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#4f4f4f12_1px,transparent_1px),linear-gradient(to_bottom,#4f4f4f12_1px,transparent_1px)] bg-[size:24px_24px]" />
      </div>

      {/* HERO SECTION */}
      <section className="relative z-10 min-h-[90vh] flex flex-col items-center justify-center px-6 pt-20 text-center">
        <motion.div
          initial={{ opacity: 0, scale: 0.8 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 1, ease: "easeOut" }}
          className="mb-8 px-6 py-2 rounded-full border border-blue-500/30 bg-blue-500/10 backdrop-blur-md text-blue-400 text-sm font-semibold tracking-wide flex items-center gap-2 shadow-[0_0_30px_rgba(59,130,246,0.3)]"
        >
          <Zap className="w-4 h-4" /> LEKHVA ERP v5 IS LIVE
        </motion.div>

        <AnimatedText 
          text="The ultimate operating system for Indian business." 
          className="text-5xl md:text-8xl font-bold tracking-tighter max-w-6xl mb-8 leading-[1.1]" 
        />

        <motion.p 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.8, duration: 0.8 }}
          className="text-xl md:text-2xl text-neutral-400 max-w-3xl mb-12"
        >
          An all-in-one cloud platform combining Core ERP, HRMS, Tax Filing, and Financial AI into one seamless interface.
        </motion.p>

        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 1, duration: 0.8 }}
          className="flex flex-col sm:flex-row gap-4"
        >
          <Link href="/pricing" className="bg-white text-black px-10 py-4 rounded-full text-lg font-bold hover:scale-105 transition-transform duration-300 shadow-[0_0_40px_rgba(255,255,255,0.3)]">
            Start Free Trial
          </Link>
          <Link href="/contact" className="bg-neutral-900 border border-white/10 text-white px-10 py-4 rounded-full text-lg font-bold hover:bg-neutral-800 transition-colors duration-300">
            Book Demo
          </Link>
        </motion.div>
      </section>

      {/* DASHBOARD REVEAL ANIMATION */}
      <section className="relative z-10 px-4 md:px-12 pb-32 max-w-7xl mx-auto">
        <motion.div 
          initial={{ opacity: 0, y: 100, rotateX: 20 }}
          whileInView={{ opacity: 1, y: 0, rotateX: 0 }}
          viewport={{ once: true, margin: "-10%" }}
          transition={{ duration: 1.2, ease: [0.2, 0.65, 0.3, 0.9] }}
          className="relative rounded-2xl md:rounded-[2.5rem] bg-neutral-900 border border-white/10 p-2 overflow-hidden shadow-2xl"
          style={{ perspective: "1000px" }}
        >
          <img 
            src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=2500" 
            alt="Dashboard visualization" 
            className="w-full h-[300px] md:h-[600px] object-cover rounded-xl md:rounded-[2rem] opacity-70 mix-blend-screen"
          />
          <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-transparent" />
        </motion.div>
      </section>

      {/* FEATURES GRID WITH SPOTLIGHT */}
      <section className="relative z-10 px-4 md:px-12 pb-48 max-w-7xl mx-auto">
        <motion.div 
          initial={{ opacity: 0, y: 40 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center mb-20"
        >
          <h2 className="text-4xl md:text-6xl font-bold tracking-tight mb-6">Everything connects.</h2>
          <p className="text-xl text-neutral-400">One database powers every module.</p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <SpotlightCard className="md:col-span-2 lg:col-span-2 min-h-[300px]">
            <LayoutGrid className="w-10 h-10 text-blue-500 mb-6" />
            <h3 className="text-2xl font-bold text-white mb-4">Core ERP & Ledger</h3>
            <p className="text-neutral-400 text-lg leading-relaxed">
              Double-entry bookkeeping, multi-warehouse inventory, and automated GST-compliant invoicing with premium templates.
            </p>
          </SpotlightCard>
          
          <SpotlightCard className="min-h-[300px]">
            <Shield className="w-10 h-10 text-purple-500 mb-6" />
            <h3 className="text-2xl font-bold text-white mb-4">Tax Filing</h3>
            <p className="text-neutral-400 text-lg leading-relaxed">
              Auto-compute GSTR-3B, extract GSTR-1, and file ITR 1-7 directly via ERI.
            </p>
          </SpotlightCard>

          <SpotlightCard className="min-h-[300px]">
            <Globe className="w-10 h-10 text-emerald-500 mb-6" />
            <h3 className="text-2xl font-bold text-white mb-4">E-Commerce Sync</h3>
            <p className="text-neutral-400 text-lg leading-relaxed">
              Connect Amazon, Shopify, and WooCommerce. Centralized inventory and automated Shiprocket labels.
            </p>
          </SpotlightCard>

          <SpotlightCard className="md:col-span-2 lg:col-span-2 min-h-[300px]">
            <Cpu className="w-10 h-10 text-rose-500 mb-6" />
            <h3 className="text-2xl font-bold text-white mb-4">M-Class AI Engine</h3>
            <p className="text-neutral-400 text-lg leading-relaxed">
              Drop an invoice photo and watch Google Vision + Gemini extract vendors, amounts, and GST details instantly. 
            </p>
          </SpotlightCard>
        </div>
      </section>
      
    </div>
  );
}
'

New-Item -Path "apps/web/src/components/layout/Navbar.tsx" -ItemType File -Force -Value '
"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

export function Navbar() {
  const pathname = usePathname();

  const links = [
    { name: "Features", href: "/features" },
    { name: "Pricing", href: "/pricing" },
    { name: "About", href: "/about" },
  ];

  return (
    <nav className="fixed top-0 w-full px-6 py-4 flex justify-between items-center z-50 bg-black/80 backdrop-blur-xl border-b border-white/10">
      <Link href="/" className="flex items-center gap-3 group">
        <div className="w-10 h-10 rounded-xl overflow-hidden border border-amber-500/30 group-hover:border-amber-500 transition-colors shadow-[0_0_15px_rgba(245,158,11,0.2)]">
          <img src="/logo.jpg" alt="Lekhva Logo" className="w-full h-full object-cover scale-110" />
        </div>
        <span className="font-bold text-2xl tracking-tighter text-white">LEKHVA</span>
      </Link>
      
      <div className="hidden md:flex items-center gap-8">
        {links.map((link) => (
          <Link 
            key={link.name} 
            href={link.href}
            className={`text-sm font-semibold tracking-wide uppercase transition-colors hover:text-white ${
              pathname === link.href ? "text-amber-500" : "text-neutral-400"
            }`}
          >
            {link.name}
          </Link>
        ))}
      </div>

      <div className="flex items-center gap-4">
        <Link 
          href="/contact" 
          className="text-sm font-bold text-black bg-amber-500 px-6 py-2.5 rounded-full hover:bg-amber-400 hover:scale-105 transition-all shadow-[0_0_20px_rgba(245,158,11,0.4)]"
        >
          Book Demo
        </Link>
      </div>
    </nav>
  );
}
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion, useMotionTemplate, useMotionValue } from "framer-motion";
import Link from "next/link";
import { ArrowRight, LayoutGrid, Shield, Globe, Cpu } from "lucide-react";
import { MouseEvent } from "react";

function SpotlightCard({ children, className = "" }: { children: React.ReactNode, className?: string }) {
  const mouseX = useMotionValue(0);
  const mouseY = useMotionValue(0);

  function handleMouseMove({ currentTarget, clientX, clientY }: MouseEvent) {
    const { left, top } = currentTarget.getBoundingClientRect();
    mouseX.set(clientX - left);
    mouseY.set(clientY - top);
  }

  return (
    <div
      className={`group relative overflow-hidden rounded-[2rem] bg-[#050505] border border-white/10 ${className}`}
      onMouseMove={handleMouseMove}
    >
      <motion.div
        className="pointer-events-none absolute -inset-px rounded-[2rem] opacity-0 transition duration-300 group-hover:opacity-100 z-10"
        style={{
          background: useMotionTemplate`
            radial-gradient(
              600px circle at ${mouseX}px ${mouseY}px,
              rgba(245, 158, 11, 0.15),
              transparent 80%
            )
          `,
        }}
      />
      <div className="relative h-full p-10 z-20">
        {children}
      </div>
    </div>
  );
}

function AnimatedText({ text, className }: { text: string, className?: string }) {
  const words = text.split(" ");
  return (
    <motion.h1 
      className={`flex flex-wrap justify-center gap-x-4 gap-y-2 ${className}`}
      initial="hidden"
      animate="visible"
      variants={{
        visible: { transition: { staggerChildren: 0.08 } },
        hidden: {},
      }}
    >
      {words.map((word, i) => (
        <motion.span
          key={i}
          variants={{
            hidden: { opacity: 0, y: 40, filter: "blur(10px)" },
            visible: { 
              opacity: 1, 
              y: 0, 
              filter: "blur(0px)",
              transition: { duration: 0.8, ease: [0.2, 0.65, 0.3, 0.9] } 
            }
          }}
          className="inline-block"
        >
          {word}
        </motion.span>
      ))}
    </motion.h1>
  );
}

export default function Home() {
  return (
    <div className="bg-black text-white min-h-screen font-sans overflow-hidden">
      
      {/* ANIMATED BACKGROUND */}
      <div className="fixed inset-0 z-0 pointer-events-none overflow-hidden flex items-center justify-center">
        <motion.div
          animate={{ rotate: [0, 360], scale: [1, 1.1, 1] }}
          transition={{ duration: 25, repeat: Infinity, ease: "linear" }}
          className="w-[80vw] h-[80vw] max-w-[800px] max-h-[800px] rounded-full bg-amber-600/10 blur-[150px] absolute"
        />
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#4f4f4f1a_1px,transparent_1px),linear-gradient(to_bottom,#4f4f4f1a_1px,transparent_1px)] bg-[size:32px_32px]" />
      </div>

      {/* HERO SECTION */}
      <section className="relative z-10 min-h-screen flex flex-col items-center justify-center px-6 pt-32 pb-20 text-center">
        <motion.div
          initial={{ opacity: 0, scale: 0.8 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 1, ease: "easeOut" }}
          className="mb-10 px-6 py-2 rounded-full border border-amber-500/30 bg-amber-500/10 backdrop-blur-md text-amber-500 text-sm font-bold tracking-widest uppercase flex items-center gap-3 shadow-[0_0_40px_rgba(245,158,11,0.2)]"
        >
          <div className="w-2 h-2 rounded-full bg-amber-500 animate-pulse" /> The New Standard
        </motion.div>

        <AnimatedText 
          text="The ultimate operating system for your business." 
          className="text-5xl md:text-[6rem] font-bold tracking-tighter max-w-6xl mb-8 leading-[1.05]" 
        />

        <motion.p 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.8, duration: 0.8 }}
          className="text-xl md:text-3xl text-neutral-400 font-light max-w-4xl mb-12"
        >
          Lekhva combines Core ERP, HRMS, Tax Filing, and Financial AI into one magnificent platform. Built specifically for India.
        </motion.p>

        <motion.div 
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 1, duration: 0.8 }}
          className="flex flex-col sm:flex-row gap-6 mb-24"
        >
          <Link href="/pricing" className="bg-amber-500 text-black px-12 py-5 rounded-full text-xl font-bold hover:scale-105 hover:bg-amber-400 transition-all duration-300 shadow-[0_0_40px_rgba(245,158,11,0.4)]">
            Start Free Trial
          </Link>
          <Link href="/features" className="bg-white/5 border border-white/10 text-white px-12 py-5 rounded-full text-xl font-bold hover:bg-white/10 transition-colors duration-300 flex items-center justify-center gap-2">
            Explore Platform <ArrowRight className="w-5 h-5" />
          </Link>
        </motion.div>

        {/* HIGH-END 3D DASHBOARD MOCKUP */}
        <motion.div 
          initial={{ opacity: 0, y: 150, rotateX: 25 }}
          animate={{ opacity: 1, y: 0, rotateX: 0 }}
          transition={{ delay: 1.2, duration: 1.5, ease: [0.16, 1, 0.3, 1] }}
          className="relative w-full max-w-7xl mx-auto rounded-3xl md:rounded-[3rem] p-3 md:p-6 bg-white/5 border border-white/10 shadow-[0_0_150px_rgba(245,158,11,0.15)] backdrop-blur-3xl"
          style={{ perspective: "1500px" }}
        >
          <div className="w-full aspect-[16/9] md:aspect-[21/9] rounded-2xl md:rounded-[2rem] overflow-hidden relative border border-white/10">
            <img 
              src="/dashboard.jpg" 
              alt="Lekhva Dashboard UI" 
              className="w-full h-full object-cover"
            />
            {/* Subtle overlay gradient to blend bottom edge */}
            <div className="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-60 pointer-events-none" />
          </div>
        </motion.div>
      </section>

      {/* FEATURES GRID WITH SPOTLIGHT */}
      <section className="relative z-10 px-6 md:px-12 py-32 max-w-7xl mx-auto">
        <motion.div 
          initial={{ opacity: 0, y: 40 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center mb-24"
        >
          <h2 className="text-5xl md:text-7xl font-bold tracking-tight mb-8">Everything connects.</h2>
          <p className="text-2xl text-neutral-400 font-light max-w-3xl mx-auto">One database powers every module, giving you absolute control over your entire operation.</p>
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <SpotlightCard className="md:col-span-2 lg:col-span-2 min-h-[350px]">
            <LayoutGrid className="w-12 h-12 text-amber-500 mb-8" />
            <h3 className="text-3xl font-bold text-white mb-6">Core ERP & Ledger</h3>
            <p className="text-neutral-400 text-xl leading-relaxed">
              Double-entry bookkeeping, multi-warehouse inventory, and automated GST-compliant invoicing with premium templates.
            </p>
          </SpotlightCard>
          
          <SpotlightCard className="min-h-[350px]">
            <Shield className="w-12 h-12 text-emerald-500 mb-8" />
            <h3 className="text-3xl font-bold text-white mb-6">Tax Filing</h3>
            <p className="text-neutral-400 text-xl leading-relaxed">
              Auto-compute GSTR-3B, extract GSTR-1, and file ITR 1-7 directly via ERI.
            </p>
          </SpotlightCard>

          <SpotlightCard className="min-h-[350px]">
            <Globe className="w-12 h-12 text-blue-500 mb-8" />
            <h3 className="text-3xl font-bold text-white mb-6">E-Commerce Sync</h3>
            <p className="text-neutral-400 text-xl leading-relaxed">
              Connect Amazon, Shopify, and WooCommerce. Centralized inventory and automated labels.
            </p>
          </SpotlightCard>

          <SpotlightCard className="md:col-span-2 lg:col-span-2 min-h-[350px]">
            <Cpu className="w-12 h-12 text-rose-500 mb-8" />
            <h3 className="text-3xl font-bold text-white mb-6">M-Class AI Engine</h3>
            <p className="text-neutral-400 text-xl leading-relaxed">
              Drop an invoice photo and watch Google Vision + Gemini extract vendors, amounts, and GST details instantly. 
            </p>
          </SpotlightCard>
        </div>
      </section>

      {/* FINAL CTA */}
      <section className="relative z-10 py-32 border-t border-white/10 bg-[#050505]">
        <div className="max-w-4xl mx-auto text-center px-6">
          <h2 className="text-5xl md:text-7xl font-bold mb-10">Stop compromising.</h2>
          <p className="text-2xl text-neutral-400 mb-12">Upgrade to the software your business actually deserves.</p>
          <Link href="/pricing" className="bg-white text-black px-12 py-5 rounded-full text-xl font-bold hover:scale-105 transition-transform duration-300 inline-block shadow-[0_0_40px_rgba(255,255,255,0.2)]">
            View Pricing
          </Link>
        </div>
      </section>
      
    </div>
  );
}
'

New-Item -Path "apps/web/src/app/layout.tsx" -ItemType File -Force -Value '
import "./globals.css";
import type { Metadata } from "next";
import { Inter, Playfair_Display } from "next/font/google";
import { Navbar } from "@/components/layout/Navbar";
import { Footer } from "@/components/layout/Footer";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-sans",
});

const playfair = Playfair_Display({
  subsets: ["latin"],
  style: ["normal", "italic"],
  variable: "--font-serif",
});

export const metadata: Metadata = {
  title: "Lekhva | The Modern ERP",
  description: "Financial software that actually works for you.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className={`${inter.variable} ${playfair.variable}`}>
      <body className="antialiased font-sans min-h-screen flex flex-col bg-[#050505] text-white selection:bg-amber-500/30">
        <Navbar />
        <main className="flex-1 relative z-10 overflow-hidden">
          {children}
        </main>
        <Footer />
      </body>
    </html>
  );
}
';


New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion, useScroll, useTransform, AnimatePresence } from "framer-motion";
import { useRef, useState, useEffect } from "react";
import Link from "next/link";
import { ArrowRight, MoveRight } from "lucide-react";

// --- ANIMATION VARIANTS ---
const textReveal = {
  hidden: { y: "100%", opacity: 0 },
  visible: { y: "0%", opacity: 1, transition: { duration: 1.2, ease: [0.16, 1, 0.3, 1] } }
};

const staggerContainer = {
  hidden: {},
  visible: { transition: { staggerChildren: 0.1 } }
};

// --- COMPONENTS ---

// 1. Masked Word Reveal for Premium Typography
function MaskedText({ text, className = "" }: { text: string, className?: string }) {
  return (
    <div className={`overflow-hidden ${className}`}>
      <motion.div variants={textReveal} className="origin-bottom">
        {text}
      </motion.div>
    </div>
  );
}

// 2. Horizontal Scroll Section for Core Features
function HorizontalScrollFeatures() {
  const targetRef = useRef<HTMLDivElement>(null);
  const { scrollYProgress } = useScroll({ target: targetRef });
  
  const x = useTransform(scrollYProgress, [0, 1], ["0%", "-66.66%"]);

  return (
    <section ref={targetRef} className="relative h-[300vh] bg-[#050505]">
      <div className="sticky top-0 h-screen flex items-center overflow-hidden">
        
        {/* Intro text on the left */}
        <div className="absolute left-10 md:left-24 top-24 z-10">
          <h2 className="text-2xl md:text-4xl font-light text-neutral-400">The Core.</h2>
        </div>

        <motion.div style={{ x }} className="flex gap-16 px-10 md:px-24">
          
          {/* Panel 1 */}
          <div className="w-[85vw] md:w-[60vw] h-[60vh] shrink-0 flex flex-col justify-end p-12 md:p-20 bg-neutral-900/50 rounded-[3rem] border border-white/5 relative overflow-hidden group">
            <div className="absolute inset-0 bg-gradient-to-br from-amber-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-700" />
            <div className="relative z-10">
              <h3 className="text-5xl md:text-7xl font-serif mb-6"><span className="italic text-amber-500">Double-Entry</span> Ledger.</h3>
              <p className="text-xl md:text-2xl text-neutral-400 font-light max-w-2xl">
                Hierarchical COA, immutable journal entries, and real-time consolidated P&L across multiple companies. Uncompromising accuracy.
              </p>
            </div>
          </div>

          {/* Panel 2 */}
          <div className="w-[85vw] md:w-[60vw] h-[60vh] shrink-0 flex flex-col justify-end p-12 md:p-20 bg-neutral-900/50 rounded-[3rem] border border-white/5 relative overflow-hidden group">
            <div className="absolute inset-0 bg-gradient-to-br from-blue-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-700" />
            <div className="relative z-10">
              <h3 className="text-5xl md:text-7xl font-serif mb-6"><span className="italic text-blue-500">Premium</span> Invoicing.</h3>
              <p className="text-xl md:text-2xl text-neutral-400 font-light max-w-2xl">
                Visual drag-and-drop template designer. Auto GST computation, IRN/QR generation, and recurring invoice schedulers.
              </p>
            </div>
          </div>

          {/* Panel 3 */}
          <div className="w-[85vw] md:w-[60vw] h-[60vh] shrink-0 flex flex-col justify-end p-12 md:p-20 bg-neutral-900/50 rounded-[3rem] border border-white/5 relative overflow-hidden group">
            <div className="absolute inset-0 bg-gradient-to-br from-emerald-500/10 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-700" />
            <div className="relative z-10">
              <h3 className="text-5xl md:text-7xl font-serif mb-6"><span className="italic text-emerald-500">Intelligent</span> Inventory.</h3>
              <p className="text-xl md:text-2xl text-neutral-400 font-light max-w-2xl">
                Multi-warehouse zone hierarchy. FIFO and Weighted Average valuation. Automated landed cost calculation across imports.
              </p>
            </div>
          </div>

        </motion.div>
      </div>
    </section>
  );
}

// 3. Parallax Image Reveal Section
function ParallaxShowcase() {
  const ref = useRef(null);
  const { scrollYProgress } = useScroll({
    target: ref,
    offset: ["start end", "end start"]
  });
  
  const y = useTransform(scrollYProgress, [0, 1], ["-20%", "20%"]);

  return (
    <section ref={ref} className="relative h-[150vh] bg-[#050505] flex items-center justify-center overflow-hidden">
      {/* Fixed Parallax Background Image */}
      <div className="absolute inset-0 w-full h-full overflow-hidden">
        <motion.img 
          style={{ y }}
          src="/dashboard.jpg" 
          alt="Dashboard Mockup" 
          className="w-full h-[140%] object-cover opacity-30"
        />
        <div className="absolute inset-0 bg-gradient-to-b from-[#050505] via-transparent to-[#050505]" />
      </div>

      <div className="relative z-10 text-center px-6">
        <motion.div 
          initial="hidden" whileInView="visible" viewport={{ once: true, margin: "-20%" }} variants={staggerContainer}
        >
          <MaskedText text="M-Class AI Engine" className="text-amber-500 font-mono tracking-widest text-sm uppercase mb-8 mx-auto" />
          <MaskedText text="Meet your new" className="text-5xl md:text-[8rem] font-medium tracking-tighter leading-none" />
          <MaskedText text="financial analyst." className="text-5xl md:text-[8rem] font-serif italic leading-none mb-12 text-neutral-300" />
          
          <motion.p variants={textReveal} className="text-xl md:text-3xl text-neutral-300 max-w-3xl mx-auto font-light leading-relaxed">
            Drop an invoice photo and watch Google Vision + Gemini extract vendors, amounts, and GST details instantly. 
            Ask questions in plain English. Get answers in charts.
          </motion.p>
        </motion.div>
      </div>
    </section>
  );
}

// --- MAIN PAGE ---

export default function Home() {
  return (
    <div className="bg-[#050505] text-white">
      
      {/* 1. HERO REVEAL */}
      <section className="min-h-screen flex flex-col justify-center px-6 md:px-24 pt-32 pb-20">
        <motion.div 
          initial="hidden"
          animate="visible"
          variants={staggerContainer}
          className="max-w-7xl"
        >
          <MaskedText 
            text="Enterprise software." 
            className="text-5xl md:text-[8rem] font-medium tracking-tighter leading-[0.9] text-white" 
          />
          <MaskedText 
            text="Redefined." 
            className="text-5xl md:text-[8rem] font-serif italic leading-[0.9] text-amber-500 mb-12" 
          />
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12 mt-20">
            <motion.p variants={textReveal} className="text-xl md:text-3xl text-neutral-400 font-light leading-relaxed">
              Lekhva replaces Tally, Zoho People, ClearTax, and Excel. 
              One unified database. Zero compromises. 
              Built specifically for the modern Indian business.
            </motion.p>
            
            <motion.div variants={textReveal} className="flex flex-col items-start md:items-end justify-center gap-6">
              <Link href="/pricing" className="group flex items-center gap-4 bg-white text-black px-10 py-5 rounded-full text-xl font-medium hover:bg-neutral-200 transition-colors">
                Start Free Trial <span className="bg-black text-white rounded-full p-2 group-hover:rotate-[-45deg] transition-transform"><MoveRight className="w-5 h-5"/></span>
              </Link>
            </motion.div>
          </div>
        </motion.div>
      </section>

      {/* 2. HORIZONTAL SCROLL (ERP) */}
      <HorizontalScrollFeatures />

      {/* 3. FULL SCREEN IMAGE REVEAL (HRMS) */}
      <section className="py-32 px-6 md:px-24">
        <motion.div 
          initial="hidden" whileInView="visible" viewport={{ once: true, margin: "-20%" }} variants={staggerContainer}
          className="mb-20"
        >
          <MaskedText text="HRMS & Payroll." className="text-4xl md:text-7xl font-medium tracking-tighter" />
          <MaskedText text="Your people, managed perfectly." className="text-4xl md:text-7xl font-serif italic text-neutral-400" />
        </motion.div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <motion.div 
            initial={{ opacity: 0, y: 50 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.8 }}
            className="bg-neutral-900/30 p-12 rounded-[2rem] border border-white/5 hover:bg-neutral-900/80 transition-colors"
          >
            <h4 className="text-2xl font-bold mb-4">Statutory Computations</h4>
            <p className="text-neutral-400 leading-relaxed">Automated EPF, ESI, Professional Tax, and LWF computations. One-click ECR file generation.</p>
          </motion.div>
          <motion.div 
            initial={{ opacity: 0, y: 50 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.8, delay: 0.1 }}
            className="bg-neutral-900/30 p-12 rounded-[2rem] border border-white/5 hover:bg-neutral-900/80 transition-colors"
          >
            <h4 className="text-2xl font-bold mb-4">Attendance & Leave</h4>
            <p className="text-neutral-400 leading-relaxed">Web and Mobile GPS clock-in. Roster planning, OT calculations, and multi-level leave approvals.</p>
          </motion.div>
          <motion.div 
            initial={{ opacity: 0, y: 50 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.8, delay: 0.2 }}
            className="bg-neutral-900/30 p-12 rounded-[2rem] border border-white/5 hover:bg-neutral-900/80 transition-colors"
          >
            <h4 className="text-2xl font-bold mb-4">Employee Self-Service</h4>
            <p className="text-neutral-400 leading-relaxed">A dedicated portal for tax declarations (Form 12BB), expense claims, and downloading payslips.</p>
          </motion.div>
        </div>
      </section>

      {/* 4. INVERTED COLOR SECTION (Tax) */}
      <section className="bg-white text-black py-32 md:py-48 px-6 md:px-24 rounded-t-[4rem] md:rounded-t-[8rem] mt-32 relative z-20">
        <motion.div 
          initial="hidden" whileInView="visible" viewport={{ once: true, margin: "-20%" }} variants={staggerContainer}
          className="max-w-5xl"
        >
          <MaskedText text="GSTR-1 to ITR-7." className="text-5xl md:text-[7rem] font-bold tracking-tighter leading-[0.9]" />
          <MaskedText text="Filed effortlessly." className="text-5xl md:text-[7rem] font-serif italic text-black/40 mb-16 leading-[0.9]" />
          
          <motion.p variants={textReveal} className="text-2xl md:text-4xl text-neutral-600 font-light leading-relaxed max-w-3xl mb-20">
            Direct integration with GSTN and CBDT. We auto-extract data from your ledger, reconcile 26AS/AIS, and e-file your returns without ever leaving Lekhva.
          </motion.p>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12 border-t border-black/10 pt-16">
             <div>
               <h4 className="text-3xl font-bold mb-4">GST Filing Engine</h4>
               <p className="text-neutral-600 text-lg">Auto-compute GSTR-3B liability, match GSTR-2B purchase registers, and sync IMS.</p>
             </div>
             <div>
               <h4 className="text-3xl font-bold mb-4">Advance Tax Planning</h4>
               <p className="text-neutral-600 text-lg">Old vs New regime comparators, 80C/80D optimizers, and quarterly liability projections.</p>
             </div>
          </div>
        </motion.div>
      </section>

      {/* 5. PARALLAX AI SHOWCASE */}
      <ParallaxShowcase />

      {/* 6. FINAL CTA */}
      <section className="py-48 px-6 md:px-24 text-center bg-[#050505]">
        <motion.div initial="hidden" whileInView="visible" viewport={{ once: true }} variants={staggerContainer}>
          <MaskedText text="Stop compromising." className="text-5xl md:text-[8rem] font-bold tracking-tighter leading-[0.9] text-white" />
          <MaskedText text="Upgrade today." className="text-5xl md:text-[8rem] font-serif italic leading-[0.9] text-amber-500 mb-16" />
          
          <motion.div variants={textReveal}>
            <Link href="/pricing" className="inline-flex items-center gap-4 bg-amber-500 text-black px-12 py-6 rounded-full text-2xl font-medium hover:scale-105 transition-transform duration-300">
              Start Free Trial <MoveRight className="w-6 h-6"/>
            </Link>
          </motion.div>
        </motion.div>
      </section>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/globals.css" -ItemType File -Force -Value '
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: #ffffff;
    --foreground: #0f172a; /* slate-900 */
  }
  
  body {
    background-color: var(--background);
    color: var(--foreground);
    -webkit-font-smoothing: antialiased;
  }
}
';

New-Item -Path "apps/web/src/app/layout.tsx" -ItemType File -Force -Value '
import "./globals.css";
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { Navbar } from "@/components/layout/Navbar";
import { Footer } from "@/components/layout/Footer";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Lekhva ERP | Accounting, HR & Tax for Indian Businesses",
  description: "The complete cloud ERP replacing Tally, Zoho, and ClearTax.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={`${inter.className} min-h-screen flex flex-col bg-white text-slate-900 selection:bg-blue-100`}>
        <Navbar />
        <main className="flex-1 pt-20">
          {children}
        </main>
        <Footer />
      </body>
    </html>
  );
}
';

New-Item -Path "apps/web/src/components/layout/Navbar.tsx" -ItemType File -Force -Value '
"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

export function Navbar() {
  const pathname = usePathname();

  const links = [
    { name: "Features", href: "/features" },
    { name: "Pricing", href: "/pricing" },
    { name: "About Us", href: "/about" },
  ];

  return (
    <nav className="fixed top-0 w-full px-6 md:px-12 py-4 flex justify-between items-center z-50 bg-white/90 backdrop-blur-md border-b border-slate-200">
      <Link href="/" className="flex items-center gap-3 group">
        <div className="w-10 h-10 rounded-xl overflow-hidden bg-blue-600 flex items-center justify-center">
          <span className="text-white font-bold text-xl">L</span>
        </div>
        <span className="font-bold text-2xl tracking-tight text-slate-900">Lekhva</span>
      </Link>
      
      <div className="hidden md:flex items-center gap-8">
        {links.map((link) => (
          <Link 
            key={link.name} 
            href={link.href}
            className={`text-sm font-medium transition-colors hover:text-blue-600 ${
              pathname === link.href ? "text-blue-600" : "text-slate-600"
            }`}
          >
            {link.name}
          </Link>
        ))}
      </div>

      <div className="flex items-center gap-4">
        <Link href="/login" className="hidden md:block text-sm font-medium text-slate-600 hover:text-slate-900">
          Login
        </Link>
        <Link 
          href="/contact" 
          className="text-sm font-semibold text-white bg-blue-600 px-6 py-2.5 rounded-lg hover:bg-blue-700 transition-colors shadow-sm"
        >
          Book a Demo
        </Link>
      </div>
    </nav>
  );
}
';

New-Item -Path "apps/web/src/components/layout/Footer.tsx" -ItemType File -Force -Value '
import Link from "next/link";

export function Footer() {
  return (
    <footer className="bg-slate-50 border-t border-slate-200 py-16 px-6 md:px-12 mt-20">
      <div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-4 gap-12">
        <div>
          <div className="flex items-center gap-3 mb-6">
            <div className="w-8 h-8 rounded-lg bg-blue-600 flex items-center justify-center">
              <span className="text-white font-bold text-lg">L</span>
            </div>
            <span className="font-bold text-xl tracking-tight text-slate-900">Lekhva</span>
          </div>
          <p className="text-slate-500 text-sm">
            India&apos;s most comprehensive cloud ERP. Replacing Tally, Zoho, and ClearTax with one unified platform.
          </p>
        </div>
        
        <div>
          <h4 className="font-semibold text-slate-900 mb-4">Product</h4>
          <div className="flex flex-col gap-3 text-sm text-slate-600">
            <Link href="/features" className="hover:text-blue-600">Core ERP</Link>
            <Link href="/features" className="hover:text-blue-600">HRMS & Payroll</Link>
            <Link href="/features" className="hover:text-blue-600">GST Filing</Link>
            <Link href="/pricing" className="hover:text-blue-600">Pricing</Link>
          </div>
        </div>

        <div>
          <h4 className="font-semibold text-slate-900 mb-4">Company</h4>
          <div className="flex flex-col gap-3 text-sm text-slate-600">
            <Link href="/about" className="hover:text-blue-600">About Us</Link>
            <Link href="/contact" className="hover:text-blue-600">Contact</Link>
            <Link href="#" className="hover:text-blue-600">Careers</Link>
          </div>
        </div>

        <div>
          <h4 className="font-semibold text-slate-900 mb-4">Legal</h4>
          <div className="flex flex-col gap-3 text-sm text-slate-600">
            <Link href="#" className="hover:text-blue-600">Privacy Policy</Link>
            <Link href="#" className="hover:text-blue-600">Terms of Service</Link>
          </div>
        </div>
      </div>
      <div className="max-w-7xl mx-auto mt-16 pt-8 border-t border-slate-200 text-sm text-slate-400 flex flex-col md:flex-row justify-between items-center">
        <p>© 2026 Lekhva Technologies. All rights reserved.</p>
        <p>Made with ❤️ in India.</p>
      </div>
    </footer>
  );
}
';


New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
import Link from "next/link";
import { ArrowRight, CheckCircle2, Building2, Receipt, Users, ShieldCheck, Globe, Cpu } from "lucide-react";

export default function Home() {
  return (
    <div className="bg-white text-slate-900 font-sans">
      
      {/* HERO SECTION */}
      <section className="pt-20 lg:pt-32 pb-16 px-6 max-w-7xl mx-auto flex flex-col items-center text-center">
        <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-50 text-blue-700 text-sm font-semibold mb-8">
          <span className="flex h-2 w-2 rounded-full bg-blue-600 animate-pulse"></span>
          Lekhva v5 is now available
        </div>
        
        <h1 className="text-4xl md:text-6xl lg:text-7xl font-bold tracking-tight text-slate-900 max-w-4xl mb-6">
          The complete platform for your business.
        </h1>
        
        <p className="text-lg md:text-xl text-slate-600 max-w-2xl mb-10">
          Replace Tally, Zoho People, and ClearTax with one unified cloud ERP. Built specifically for Indian SMBs to handle accounting, HR, and GST compliance flawlessly.
        </p>
        
        <div className="flex flex-col sm:flex-row gap-4 mb-16">
          <Link href="/pricing" className="bg-blue-600 text-white px-8 py-4 rounded-lg text-lg font-semibold hover:bg-blue-700 transition-colors shadow-lg shadow-blue-600/20 flex items-center justify-center gap-2">
            Start Free Trial <ArrowRight className="w-5 h-5" />
          </Link>
          <Link href="/contact" className="bg-white text-slate-700 border border-slate-300 px-8 py-4 rounded-lg text-lg font-semibold hover:bg-slate-50 transition-colors flex items-center justify-center">
            Book a Demo
          </Link>
        </div>

        {/* Hero Image */}
        <div className="w-full bg-slate-100 rounded-2xl md:rounded-[2rem] border border-slate-200 p-2 md:p-4 shadow-2xl">
          <img 
            src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=2500" 
            alt="Lekhva Dashboard" 
            className="w-full rounded-xl md:rounded-[1.5rem] object-cover"
          />
        </div>
      </section>

      {/* TRUST LOGOS */}
      <section className="py-12 border-b border-slate-100 bg-slate-50">
        <div className="max-w-7xl mx-auto px-6 text-center">
          <p className="text-sm font-semibold text-slate-500 uppercase tracking-wider mb-8">Trusted by over 10,000 forward-thinking Indian businesses</p>
          <div className="flex flex-wrap justify-center gap-12 md:gap-24 opacity-60 grayscale">
            {/* Placeholder Logos */}
            <div className="text-xl font-bold text-slate-800">Acme Corp</div>
            <div className="text-xl font-bold text-slate-800">GlobalTech</div>
            <div className="text-xl font-bold text-slate-800">RetailPro</div>
            <div className="text-xl font-bold text-slate-800">MediCare</div>
            <div className="text-xl font-bold text-slate-800">LogisticsIn</div>
          </div>
        </div>
      </section>

      {/* VALUE PROPOSITION GRID */}
      <section className="py-24 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <h2 className="text-3xl md:text-5xl font-bold text-slate-900 mb-6">Everything you need, in one place.</h2>
          <p className="text-lg text-slate-600 max-w-2xl mx-auto">
            Stop paying for fragmented software. Lekhva unifies your ledger, people, and compliance into a single source of truth.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div className="bg-white border border-slate-200 rounded-2xl p-8 hover:shadow-lg transition-shadow">
            <div className="w-12 h-12 bg-blue-100 rounded-xl flex items-center justify-center mb-6">
              <Building2 className="w-6 h-6 text-blue-600" />
            </div>
            <h3 className="text-xl font-bold text-slate-900 mb-3">Core ERP & Ledger</h3>
            <p className="text-slate-600 mb-6">Double-entry bookkeeping, multi-warehouse inventory, and 30+ premium invoice templates.</p>
            <Link href="/features" className="text-blue-600 font-semibold hover:text-blue-700 flex items-center gap-1">Learn more <ArrowRight className="w-4 h-4"/></Link>
          </div>

          <div className="bg-white border border-slate-200 rounded-2xl p-8 hover:shadow-lg transition-shadow">
            <div className="w-12 h-12 bg-emerald-100 rounded-xl flex items-center justify-center mb-6">
              <Users className="w-6 h-6 text-emerald-600" />
            </div>
            <h3 className="text-xl font-bold text-slate-900 mb-3">HRMS & Payroll</h3>
            <p className="text-slate-600 mb-6">Automated EPF/ESI computations, GPS attendance, and a complete employee self-service portal.</p>
            <Link href="/features" className="text-blue-600 font-semibold hover:text-blue-700 flex items-center gap-1">Learn more <ArrowRight className="w-4 h-4"/></Link>
          </div>

          <div className="bg-white border border-slate-200 rounded-2xl p-8 hover:shadow-lg transition-shadow">
            <div className="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center mb-6">
              <ShieldCheck className="w-6 h-6 text-purple-600" />
            </div>
            <h3 className="text-xl font-bold text-slate-900 mb-3">Tax Filing & Compliance</h3>
            <p className="text-slate-600 mb-6">Direct integration with GSTN and CBDT. Auto-extract GSTR-1 and file ITR 1-7 effortlessly.</p>
            <Link href="/features" className="text-blue-600 font-semibold hover:text-blue-700 flex items-center gap-1">Learn more <ArrowRight className="w-4 h-4"/></Link>
          </div>
        </div>
      </section>

      {/* DEEP DIVE SECTION: INVOICING & GST */}
      <section className="py-24 bg-slate-50 border-y border-slate-200">
        <div className="max-w-7xl mx-auto px-6 grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
          <div>
            <h2 className="text-3xl md:text-5xl font-bold text-slate-900 mb-6">GST Compliance,<br/>on autopilot.</h2>
            <p className="text-lg text-slate-600 mb-8">
              Lekhva is built specifically for Indian businesses. We handle the complex logic so you don&apos;t have to.
            </p>
            <ul className="space-y-4 mb-8">
              <li className="flex items-center gap-3 text-slate-700">
                <CheckCircle2 className="w-5 h-5 text-emerald-500" /> Auto Place of Supply detection (CGST/SGST vs IGST)
              </li>
              <li className="flex items-center gap-3 text-slate-700">
                <CheckCircle2 className="w-5 h-5 text-emerald-500" /> E-Invoicing (v1.04) and E-Way Bill generation
              </li>
              <li className="flex items-center gap-3 text-slate-700">
                <CheckCircle2 className="w-5 h-5 text-emerald-500" /> GSTR-2B reconciliation and IMS Sync
              </li>
            </ul>
            <Link href="/contact" className="bg-blue-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors inline-block">
              See it in action
            </Link>
          </div>
          <div className="bg-white rounded-2xl p-8 border border-slate-200 shadow-xl relative">
             <div className="bg-slate-50 rounded-xl p-6 border border-slate-100">
               <div className="flex justify-between items-center border-b border-slate-200 pb-4 mb-4">
                 <span className="font-bold text-slate-800">Tax Invoice #INV-2026-042</span>
                 <span className="text-blue-600 font-bold">₹11,800.00</span>
               </div>
               <div className="space-y-3 text-sm text-slate-600">
                 <div className="flex justify-between"><span>Taxable Amount</span><span>₹10,000.00</span></div>
                 <div className="flex justify-between"><span>Output IGST (18%)</span><span className="text-slate-900">₹1,800.00</span></div>
                 <div className="flex justify-between font-bold text-emerald-600 pt-2 border-t border-slate-200"><span>Status</span><span>E-Invoice Generated</span></div>
               </div>
             </div>
          </div>
        </div>
      </section>

      {/* CTA SECTION */}
      <section className="py-32 px-6 text-center max-w-4xl mx-auto">
        <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6">Ready to upgrade your business?</h2>
        <p className="text-lg text-slate-600 mb-10">
          Join thousands of businesses who have moved away from legacy software. Start your 14-day free trial today.
        </p>
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link href="/pricing" className="bg-blue-600 text-white px-8 py-4 rounded-lg text-lg font-semibold hover:bg-blue-700 transition-colors shadow-lg">
            View Pricing & Plans
          </Link>
        </div>
      </section>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/globals.css" -ItemType File -Force -Value '
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: #f8fafc; /* slate-50 */
    --foreground: #0f172a; /* slate-900 */
  }
  
  body {
    background-color: var(--background);
    color: var(--foreground);
    -webkit-font-smoothing: antialiased;
  }
}
';

New-Item -Path "apps/web/src/app/layout.tsx" -ItemType File -Force -Value '
import "./globals.css";
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { Navbar } from "@/components/layout/Navbar";
import { Footer } from "@/components/layout/Footer";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Lekhva ERP | For Modern & Traditional Indian Businesses",
  description: "The complete cloud ERP replacing Tally, Zoho, and ClearTax.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={`${inter.className} min-h-screen flex flex-col bg-slate-50 text-slate-900 selection:bg-indigo-500/30`}>
        <Navbar />
        <main className="flex-1">
          {children}
        </main>
        <Footer />
      </body>
    </html>
  );
}
';

New-Item -Path "apps/web/src/components/layout/Navbar.tsx" -ItemType File -Force -Value '
"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useState, useEffect } from "react";

export function Navbar() {
  const pathname = usePathname();
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => setScrolled(window.scrollY > 20);
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

  // For the homepage hero (which is dark), make nav text white until scrolled
  const isDarkHero = pathname === "/" && !scrolled;

  return (
    <nav className={`fixed top-0 w-full px-6 md:px-12 py-4 flex justify-between items-center z-50 transition-all duration-300 ${
      scrolled ? "bg-white/90 backdrop-blur-md border-b border-slate-200 shadow-sm" : "bg-transparent"
    }`}>
      <Link href="/" className="flex items-center gap-3 group">
        <div className="w-10 h-10 rounded-xl overflow-hidden bg-indigo-600 flex items-center justify-center shadow-lg shadow-indigo-600/20">
          <span className="text-white font-bold text-xl">L</span>
        </div>
        <span className={`font-bold text-2xl tracking-tight transition-colors ${isDarkHero ? "text-white" : "text-slate-900"}`}>Lekhva</span>
      </Link>
      
      <div className="hidden md:flex items-center gap-8">
        {["Features", "Pricing", "About Us"].map((name) => {
          const href = `/${name.toLowerCase().replace(" ", "-")}`;
          return (
            <Link 
              key={name} 
              href={href}
              className={`text-sm font-medium transition-colors hover:text-indigo-500 ${
                isDarkHero ? "text-slate-300 hover:text-white" : "text-slate-600 hover:text-indigo-600"
              }`}
            >
              {name}
            </Link>
          );
        })}
      </div>

      <div className="flex items-center gap-4">
        <Link href="/login" className={`hidden md:block text-sm font-medium transition-colors ${isDarkHero ? "text-slate-300 hover:text-white" : "text-slate-600 hover:text-slate-900"}`}>
          Login
        </Link>
        <Link 
          href="/contact" 
          className="text-sm font-semibold text-white bg-indigo-600 px-6 py-2.5 rounded-lg hover:bg-indigo-700 transition-all shadow-md shadow-indigo-600/20 hover:shadow-lg hover:shadow-indigo-600/30 hover:-translate-y-0.5"
        >
          Book a Demo
        </Link>
      </div>
    </nav>
  );
}
';


New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion } from "framer-motion";
import Link from "next/link";
import { ArrowRight, CheckCircle2, ShieldCheck, Zap, Globe, Cpu, Import, Calculator, FileCheck2, ShoppingCart } from "lucide-react";

export default function Home() {
  return (
    <div className="bg-slate-50 text-slate-900 font-sans">
      
      {/* 1. DARK, TRUST-BUILDING HERO (Razorpay/Cred Vibe) */}
      <section className="relative pt-32 pb-48 px-6 bg-[#0B1120] overflow-hidden">
        {/* Subtle modern background grid & glows for Millennials/Gen Z */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff05_1px,transparent_1px),linear-gradient(to_bottom,#ffffff05_1px,transparent_1px)] bg-[size:32px_32px]" />
        <div className="absolute top-[-10%] left-[-10%] w-[40%] h-[40%] rounded-full bg-indigo-600/20 blur-[120px]" />
        <div className="absolute bottom-[-10%] right-[-10%] w-[40%] h-[40%] rounded-full bg-emerald-600/20 blur-[120px]" />

        <div className="max-w-7xl mx-auto relative z-10 flex flex-col items-center text-center">
          <motion.div 
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-indigo-500/10 border border-indigo-500/20 text-indigo-300 text-sm font-semibold mb-8 backdrop-blur-md"
          >
            <Zap className="w-4 h-4 text-emerald-400" /> Version 5: The Ultimate Indian ERP
          </motion.div>
          
          <motion.h1 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-5xl md:text-7xl lg:text-8xl font-bold tracking-tight text-white max-w-5xl mb-6 leading-[1.1]"
          >
            Familiar for CAs.<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-indigo-400 to-emerald-400">
              Built for Founders.
            </span>
          </motion.h1>
          
          <motion.p 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="text-xl text-slate-400 max-w-2xl mb-10 leading-relaxed"
          >
            Stop fighting with legacy software. Lekhva unifies Tally-grade accounting, modern HRMS, automated GST filing, and E-commerce sync into one secure cloud platform.
          </motion.p>
          
          <motion.div 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.3 }}
            className="flex flex-col sm:flex-row gap-4 w-full sm:w-auto"
          >
            <Link href="/pricing" className="bg-indigo-600 text-white px-8 py-4 rounded-xl text-lg font-bold hover:bg-indigo-500 hover:-translate-y-1 transition-all shadow-lg shadow-indigo-600/25 flex items-center justify-center gap-2">
              Start Free Trial <ArrowRight className="w-5 h-5" />
            </Link>
            <Link href="/contact" className="bg-white/5 text-white border border-white/10 backdrop-blur-md px-8 py-4 rounded-xl text-lg font-bold hover:bg-white/10 transition-colors flex items-center justify-center">
              Book a Demo
            </Link>
          </motion.div>
        </div>
      </section>

      {/* DASHBOARD MOCKUP PULL-UP */}
      <section className="relative z-20 px-6 max-w-7xl mx-auto -mt-32 mb-24">
        <motion.div 
          initial={{ opacity: 0, y: 40 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, duration: 0.8 }}
          className="w-full bg-[#1e293b] rounded-2xl md:rounded-[2rem] border border-slate-700/50 p-2 md:p-3 shadow-2xl overflow-hidden"
        >
          <img 
            src="/dashboard.jpg" 
            alt="Lekhva Dashboard" 
            className="w-full h-auto rounded-xl md:rounded-[1.5rem] object-cover"
          />
        </motion.div>
        
        {/* Trust Badges for Boomers/Traditional Biz */}
        <div className="mt-12 text-center flex flex-wrap justify-center gap-8 md:gap-16 items-center opacity-60 grayscale font-semibold text-slate-800">
          <div className="flex items-center gap-2"><ShieldCheck className="w-6 h-6"/> Bank-Grade 256-bit AES</div>
          <div className="flex items-center gap-2"><FileCheck2 className="w-6 h-6"/> 100% GSTN Compliant</div>
          <div className="flex items-center gap-2"><Calculator className="w-6 h-6"/> CA Approved Double-Entry</div>
        </div>
      </section>

      {/* 2. THE BRIDGE: APPEALING TO ALL GENERATIONS */}
      <section className="py-24 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">One platform. Every generation of business.</h2>
          <p className="text-xl text-slate-600 max-w-2xl mx-auto">Whether you run a 30-year-old manufacturing plant or a day-old D2C brand, Lekhva adapts to your workflow.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          
          {/* For the Boomer/Traditional Owner */}
          <motion.div 
            initial={{ opacity: 0, x: -20 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }}
            className="bg-white rounded-3xl p-10 border border-slate-200 shadow-xl shadow-slate-200/50 relative overflow-hidden"
          >
            <div className="absolute top-0 right-0 w-32 h-32 bg-blue-50 rounded-bl-[100px] -z-10" />
            <Import className="w-12 h-12 text-blue-600 mb-6" />
            <h3 className="text-2xl font-bold text-slate-900 mb-4">Migrate from Tally in 1-Click</h3>
            <p className="text-slate-600 text-lg mb-6 leading-relaxed">
              We know you trust your old systems. Our built-in XML/JSON parser imports 1-3 years of your Tally history perfectly, maintaining your exact General Ledger groupings.
            </p>
            <ul className="space-y-3">
              <li className="flex items-center gap-3 text-slate-700 font-medium"><CheckCircle2 className="w-5 h-5 text-blue-600" /> Zero data loss guarantee</li>
              <li className="flex items-center gap-3 text-slate-700 font-medium"><CheckCircle2 className="w-5 h-5 text-blue-600" /> Familiar voucher entry screens</li>
            </ul>
          </motion.div>

          {/* For the Millennial/Gen Z Founder */}
          <motion.div 
            initial={{ opacity: 0, x: 20 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }}
            className="bg-slate-900 rounded-3xl p-10 border border-slate-800 shadow-xl relative overflow-hidden text-white"
          >
            <div className="absolute top-0 right-0 w-32 h-32 bg-indigo-500/20 rounded-bl-[100px] -z-10 blur-xl" />
            <Cpu className="w-12 h-12 text-indigo-400 mb-6" />
            <h3 className="text-2xl font-bold mb-4">M-Class Financial AI</h3>
            <p className="text-slate-400 text-lg mb-6 leading-relaxed">
              Don&apos;t just record data, predict it. Drop an invoice photo and our AI extracts the GSTIN and line items. Ask your dashboard questions in plain English.
            </p>
            <ul className="space-y-3">
              <li className="flex items-center gap-3 text-slate-300 font-medium"><CheckCircle2 className="w-5 h-5 text-indigo-400" /> Google Vision + Gemini OCR</li>
              <li className="flex items-center gap-3 text-slate-300 font-medium"><CheckCircle2 className="w-5 h-5 text-indigo-400" /> Predictive cash flow modeling</li>
            </ul>
          </motion.div>
          
        </div>
      </section>

      {/* 3. CORE FEATURES GRID */}
      <section className="py-24 px-6 bg-white border-y border-slate-200">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-12">
            
            <div>
              <div className="w-14 h-14 bg-emerald-100 rounded-2xl flex items-center justify-center mb-6">
                <FileCheck2 className="w-7 h-7 text-emerald-600" />
              </div>
              <h3 className="text-2xl font-bold text-slate-900 mb-4">Absolute Compliance</h3>
              <p className="text-slate-600 text-lg leading-relaxed">
                Auto-compute GSTR-3B liability, generate E-Way Bills, and file ITR 1-7 directly. We track the latest CBDT rules so you are never caught off guard.
              </p>
            </div>

            <div>
              <div className="w-14 h-14 bg-amber-100 rounded-2xl flex items-center justify-center mb-6">
                <Globe className="w-7 h-7 text-amber-600" />
              </div>
              <h3 className="text-2xl font-bold text-slate-900 mb-4">HR & Payroll Suite</h3>
              <p className="text-slate-600 text-lg leading-relaxed">
                Automated EPF, ESI, and Professional Tax computations. GPS-enabled biometric attendance and a beautiful Employee Self-Service portal.
              </p>
            </div>

            <div>
              <div className="w-14 h-14 bg-rose-100 rounded-2xl flex items-center justify-center mb-6">
                <ShoppingCart className="w-7 h-7 text-rose-600" />
              </div>
              <h3 className="text-2xl font-bold text-slate-900 mb-4">E-Commerce Ready</h3>
              <p className="text-slate-600 text-lg leading-relaxed">
                Native integrations with Amazon, Flipkart, Shopify, and WooCommerce. Centralized inventory and automated Shiprocket labels.
              </p>
            </div>

          </div>
        </div>
      </section>

      {/* 4. FINAL CTA */}
      <section className="py-32 px-6 text-center max-w-4xl mx-auto">
        <h2 className="text-4xl md:text-6xl font-bold text-slate-900 mb-6 tracking-tight">Stop compromising.</h2>
        <p className="text-xl text-slate-600 mb-10">
          The software your business actually deserves is here.
        </p>
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link href="/pricing" className="bg-indigo-600 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-indigo-700 hover:-translate-y-1 transition-all shadow-lg shadow-indigo-600/25">
            View Pricing & Plans
          </Link>
        </div>
      </section>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion } from "framer-motion";
import Link from "next/link";
import { ArrowRight, CheckCircle2, ShieldCheck, Zap, Store, Building, Building2, Calculator, FileCheck2, Server } from "lucide-react";

export default function Home() {
  return (
    <div className="bg-slate-50 text-slate-900 font-sans">
      
      {/* 1. HERO SECTION */}
      <section className="relative pt-32 pb-48 px-6 bg-[#0B1120] overflow-hidden">
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff05_1px,transparent_1px),linear-gradient(to_bottom,#ffffff05_1px,transparent_1px)] bg-[size:32px_32px]" />
        <div className="absolute top-[-10%] left-[-10%] w-[40%] h-[40%] rounded-full bg-blue-600/20 blur-[120px]" />
        <div className="absolute bottom-[-10%] right-[-10%] w-[40%] h-[40%] rounded-full bg-indigo-600/20 blur-[120px]" />

        <div className="max-w-7xl mx-auto relative z-10 flex flex-col items-center text-center">
          <motion.div 
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-500/10 border border-blue-500/20 text-blue-300 text-sm font-semibold mb-8 backdrop-blur-md"
          >
            <Zap className="w-4 h-4 text-emerald-400" /> One Unified Platform
          </motion.div>
          
          <motion.h1 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 }}
            className="text-5xl md:text-7xl lg:text-8xl font-bold tracking-tight text-white max-w-6xl mb-6 leading-[1.1]"
          >
            From a small retail shop.<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-indigo-400">
              To a big MNC.
            </span>
          </motion.h1>
          
          <motion.p 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2 }}
            className="text-xl text-slate-400 max-w-3xl mb-10 leading-relaxed"
          >
            We&apos;ve got it all covered. Lekhva scales instantly from a simple barcode POS to a multi-company enterprise ERP with complex approval workflows and consolidated financials.
          </motion.p>
          
          <motion.div 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.3 }}
            className="flex flex-col sm:flex-row gap-4 w-full sm:w-auto"
          >
            <Link href="/pricing" className="bg-blue-600 text-white px-8 py-4 rounded-xl text-lg font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25 flex items-center justify-center gap-2">
              Start Free Trial <ArrowRight className="w-5 h-5" />
            </Link>
            <Link href="/contact" className="bg-white/5 text-white border border-white/10 backdrop-blur-md px-8 py-4 rounded-xl text-lg font-bold hover:bg-white/10 transition-colors flex items-center justify-center">
              Book a Demo
            </Link>
          </motion.div>
        </div>
      </section>

      {/* DASHBOARD MOCKUP */}
      <section className="relative z-20 px-6 max-w-7xl mx-auto -mt-32 mb-24">
        <motion.div 
          initial={{ opacity: 0, y: 40 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, duration: 0.8 }}
          className="w-full bg-[#1e293b] rounded-2xl md:rounded-[2rem] border border-slate-700/50 p-2 md:p-3 shadow-2xl overflow-hidden"
        >
          <img 
            src="/dashboard.jpg" 
            alt="Lekhva Dashboard" 
            className="w-full h-auto rounded-xl md:rounded-[1.5rem] object-cover"
          />
        </motion.div>
        
        <div className="mt-12 text-center flex flex-wrap justify-center gap-8 md:gap-16 items-center opacity-60 grayscale font-semibold text-slate-800">
          <div className="flex items-center gap-2"><ShieldCheck className="w-6 h-6"/> SOC2 & DPDP Compliant</div>
          <div className="flex items-center gap-2"><FileCheck2 className="w-6 h-6"/> Automated GST & ITR</div>
          <div className="flex items-center gap-2"><Calculator className="w-6 h-6"/> Tally XML Import</div>
        </div>
      </section>

      {/* 2. THE SCALE SECTION: SHOP TO MNC */}
      <section className="py-24 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">Built to scale with you.</h2>
          <p className="text-xl text-slate-600 max-w-2xl mx-auto">Never migrate software again. Turn features on and off as your business grows.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          
          {/* Small Retail */}
          <motion.div 
            initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }}
            className="bg-white rounded-3xl p-8 border border-slate-200 shadow-lg hover:shadow-xl transition-shadow relative overflow-hidden"
          >
            <div className="absolute top-0 right-0 w-24 h-24 bg-emerald-50 rounded-bl-full -z-10" />
            <Store className="w-10 h-10 text-emerald-600 mb-6" />
            <h3 className="text-2xl font-bold text-slate-900 mb-2">Small Retail Shop</h3>
            <p className="text-slate-500 font-medium mb-6">Day 1 Operations</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> 58mm & 80mm thermal receipt printing with UPI QRs</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Barcode scanning & basic inventory</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Simple POS interface (Desktop & Mobile)</li>
            </ul>
          </motion.div>

          {/* Growing SME */}
          <motion.div 
            initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }}
            className="bg-blue-600 rounded-3xl p-8 border border-blue-500 shadow-xl shadow-blue-600/20 relative overflow-hidden text-white transform md:-translate-y-4"
          >
            <div className="absolute top-0 right-0 w-32 h-32 bg-blue-500/50 rounded-bl-full -z-10 blur-xl" />
            <Building className="w-10 h-10 text-blue-200 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Growing SME</h3>
            <p className="text-blue-200 font-medium mb-6">Expanding the Team</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Multi-warehouse inventory with Landed Costs</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Full HRMS, Payroll, and GPS Attendance</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Automated GSTR-1/3B filing & E-Way Bills</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> E-commerce sync (Amazon, Shopify, WooCommerce)</li>
            </ul>
          </motion.div>

          {/* Big MNC */}
          <motion.div 
            initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.2 }}
            className="bg-slate-900 rounded-3xl p-8 border border-slate-800 shadow-xl relative overflow-hidden text-white"
          >
            <div className="absolute top-0 right-0 w-24 h-24 bg-indigo-500/20 rounded-bl-full -z-10 blur-xl" />
            <Building2 className="w-10 h-10 text-indigo-400 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Big MNC</h3>
            <p className="text-slate-400 font-medium mb-6">Enterprise Scale</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Multi-company consolidation (Group P&L)</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Drag-and-drop Workflow & Approval Engine</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Granular Role-Based Access Control (RBAC)</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> REST API & Webhooks for custom integrations</li>
            </ul>
          </motion.div>
          
        </div>
      </section>

      {/* 3. CORE FEATURES HIGHLIGHTS */}
      <section className="py-24 px-6 bg-slate-100 border-y border-slate-200">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-16 items-center">
             <div>
                <h2 className="text-3xl md:text-5xl font-bold text-slate-900 mb-6">M-Class Financial AI</h2>
                <p className="text-lg text-slate-600 mb-8 leading-relaxed">
                  Enterprise power doesn&apos;t mean complex interfaces. Drop an invoice photo into Lekhva and our AI extracts the vendor, amounts, and GST details instantly. Ask questions about your business in plain English and get beautiful charts in return.
                </p>
                <Link href="/features" className="text-blue-600 font-bold hover:text-blue-700 flex items-center gap-2">
                  Explore AI Features <ArrowRight className="w-4 h-4"/>
                </Link>
             </div>
             <div className="bg-white p-8 rounded-3xl border border-slate-200 shadow-lg relative">
                <div className="absolute -top-4 -right-4 bg-indigo-600 text-white text-xs font-bold px-3 py-1 rounded-full">Powered by Gemini</div>
                <div className="space-y-4">
                  <div className="bg-slate-50 p-4 rounded-xl border border-slate-100 rounded-tr-none max-w-[80%] ml-auto text-sm text-slate-700">
                    What was our revenue from Retail POS vs E-Commerce last month?
                  </div>
                  <div className="bg-blue-50 p-4 rounded-xl border border-blue-100 rounded-tl-none max-w-[90%] text-sm text-blue-900">
                    <p className="mb-4">Here is the breakdown for last month:</p>
                    <div className="flex justify-between items-center mb-2"><span>Retail POS</span><span className="font-bold">₹14.2L (65%)</span></div>
                    <div className="w-full bg-blue-200 h-2 rounded-full mb-4"><div className="bg-blue-600 w-[65%] h-full rounded-full"></div></div>
                    
                    <div className="flex justify-between items-center mb-2"><span>E-Commerce (Amazon/Shopify)</span><span className="font-bold">₹7.6L (35%)</span></div>
                    <div className="w-full bg-blue-200 h-2 rounded-full"><div className="bg-blue-400 w-[35%] h-full rounded-full"></div></div>
                  </div>
                </div>
             </div>
          </div>
        </div>
      </section>

      {/* 4. FINAL CTA */}
      <section className="py-32 px-6 text-center max-w-4xl mx-auto">
        <h2 className="text-4xl md:text-6xl font-bold text-slate-900 mb-6 tracking-tight">The last software migration you will ever do.</h2>
        <p className="text-xl text-slate-600 mb-10">
          Start on the Free tier for your retail shop, and seamlessly upgrade to Enterprise as you build your empire.
        </p>
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link href="/pricing" className="bg-blue-600 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-blue-700 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25">
            View Pricing & Plans
          </Link>
        </div>
      </section>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/features/page.tsx" -ItemType File -Force -Value '
import { 
  Building2, Receipt, Users, ShieldCheck, Globe, Cpu, 
  Workflow, Lock, Smartphone, Scale, Link2, BookOpen,
  LineChart, FileText, LayoutDashboard, Truck, Briefcase
} from "lucide-react";

export default function FeaturesPage() {
  return (
    <div className="bg-white text-slate-900 font-sans pt-20">
      
      {/* HEADER */}
      <section className="bg-slate-50 py-24 px-6 border-b border-slate-200 text-center">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-5xl md:text-7xl font-bold tracking-tight text-slate-900 mb-6">
            The Complete Platform.
          </h1>
          <p className="text-xl md:text-2xl text-slate-600 leading-relaxed">
            28 Modules. 75+ Database Tables. One Unified Engine. Discover why Lekhva is the most powerful ERP ever built for the Indian market.
          </p>
        </div>
      </section>

      {/* 1. FOUNDATION & SECURITY */}
      <FeatureSection 
        title="Foundation & Security" 
        subtitle="Enterprise-grade infrastructure securing your financial data."
        icon={Lock}
        features={[
          { title: "DPDP Act 2023 Compliant", desc: "Explicit consent management, data principal rights panel, processing logs, and automated privacy notice generator." },
          { title: "Bank-Grade Encryption", desc: "AES-256-GCM encryption for sensitive columns (Aadhaar, PAN, Bank Accounts) with UI masking (XXXX-1234)." },
          { title: "Granular RBAC", desc: "Preset roles (Admin, HR, Warehouse, POS Cashier) plus a custom role builder with field-level security." },
          { title: "Universal Workflow Engine", desc: "Drag-and-drop approval chains (Sequential, Parallel, Auto-approve) for POs, expenses, and journal entries." }
        ]}
      />

      {/* 2. CORE ERP & LEDGER */}
      <FeatureSection 
        title="Core ERP & Ledger" 
        subtitle="A multi-company accounting engine that handles complex group structures."
        icon={Building2}
        reverse
        features={[
          { title: "Multi-Company Architecture", desc: "Switch between companies instantly (⌘+Shift+C). Run inter-company transactions and generate consolidated group financials." },
          { title: "Double-Entry Bookkeeping", desc: "Hierarchical COA with 5 root types, immutable auto-numbered journal entries, and automated sub-ledgers (AR, AP, Cash)." },
          { title: "Multi-Warehouse Inventory", desc: "Zone and bin hierarchy. FIFO & Weighted Average valuation. Batch, serial, and expiry tracking." },
          { title: "Landed Cost Calculation", desc: "Allocate purchase, freight, duty, and handling costs accurately across inventory by value, weight, or volume." }
        ]}
      />

      {/* 3. INVOICING & COMMERCE */}
      <FeatureSection 
        title="Invoicing & Commerce" 
        subtitle="Premium templates and omni-channel sales syncing."
        icon={Receipt}
        features={[
          { title: "Visual Template Designer", desc: "Drag-and-drop builder with 30+ premium templates (Modern, Classic, Thermal). Dynamic watermarks, digital signatures, and custom fields." },
          { title: "GST-Compliant Invoicing", desc: "Auto tax determination (CGST/SGST vs IGST), E-Invoicing (Schema v1.04), and E-Way Bill generation." },
          { title: "E-Commerce Sync Engine", desc: "Native adapters for Amazon SP-API, Flipkart, Shopify, and WooCommerce with distributed Redis locking for inventory sync." },
          { title: "Shipping & Logistics", desc: "Shiprocket and Delhivery API integration. Auto-generate AWBs, schedule pickups, and track COD remittances." }
        ]}
      />

      {/* 4. HRMS & PAYROLL */}
      <FeatureSection 
        title="People & Payroll" 
        subtitle="From recruitment to full & final settlement."
        icon={Users}
        reverse
        features={[
          { title: "Statutory Payroll", desc: "Configurable salary structures with automated EPF, ESI, Professional Tax, LWF, and TDS (Sec 192) computations." },
          { title: "Attendance & Leave", desc: "Web/Mobile GPS clock-in, biometric API integration, roster planning, and automated leave accruals." },
          { title: "Employee Self-Service", desc: "Dedicated portal for Form 12BB tax declarations, expense claims, payslip downloads, and performance reviews." },
          { title: "Project & Job Costing", desc: "Log hours per project. Allocate employee payroll costs + inventory materials to determine true project margins." }
        ]}
      />

      {/* 5. TAX FILING & COMPLIANCE */}
      <FeatureSection 
        title="Tax Filing & Compliance" 
        subtitle="Direct integration with GSTN and CBDT."
        icon={ShieldCheck}
        features={[
          { title: "GST Filing Engine", desc: "Auto-extract B2B/B2C data for GSTR-1, auto-compute GSTR-3B liability, and run 3-way matching for GSTR-2B reconciliation." },
          { title: "ITR Filing (1-7)", desc: "Auto-populate schedules (BS, P&L, BP, DPM) from the General Ledger, generate CBDT JSON, and e-file via ERI." },
          { title: "TDS Returns", desc: "Generate 24Q, 26Q, 27Q, and 27EQ returns with automated challan mapping and FVU file generation." },
          { title: "Advance Tax Planning", desc: "Old vs New regime comparators, 80C/80D optimizers, and quarterly liability projection with 234B/C interest calculation." }
        ]}
      />

      {/* 6. AI & INTELLIGENCE */}
      <FeatureSection 
        title="Financial AI Engine" 
        subtitle="Machine learning that actually saves you time."
        icon={Cpu}
        reverse
        features={[
          { title: "Invoice OCR Scanning", desc: "Drop an image and let Google Vision + Gemini extract the vendor name, line items, amounts, and GST details." },
          { title: "Smart Bank Reconciliation", desc: "AI-assisted matching (MT940/CSV) that learns from your manual categorization patterns over time." },
          { title: "Predictive Cash Flow", desc: "ML-based payment date prediction analyzing historical customer payment behavior." },
          { title: "NLP Queries", desc: "Ask \"Show top 10 customers by revenue this quarter\" in plain English and instantly receive generated charts." }
        ]}
      />

    </div>
  );
}

function FeatureSection({ title, subtitle, icon: Icon, features, reverse = false }: any) {
  return (
    <section className={`py-24 px-6 ${reverse ? "bg-slate-50 border-y border-slate-200" : "bg-white"}`}>
      <div className="max-w-7xl mx-auto flex flex-col lg:flex-row gap-16 items-start">
        
        {/* Text Area */}
        <div className={`lg:w-1/3 sticky top-32 ${reverse ? "lg:order-2" : ""}`}>
          <div className="w-16 h-16 bg-blue-100 rounded-2xl flex items-center justify-center mb-8">
            <Icon className="w-8 h-8 text-blue-600" />
          </div>
          <h2 className="text-4xl font-bold text-slate-900 mb-4">{title}</h2>
          <p className="text-lg text-slate-600">{subtitle}</p>
        </div>

        {/* Feature Grid */}
        <div className={`lg:w-2/3 grid grid-cols-1 md:grid-cols-2 gap-8 ${reverse ? "lg:order-1" : ""}`}>
          {features.map((f: any, idx: number) => (
            <div key={idx} className="bg-white p-8 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow">
              <h3 className="text-xl font-bold text-slate-900 mb-3">{f.title}</h3>
              <p className="text-slate-600 leading-relaxed">{f.desc}</p>
            </div>
          ))}
        </div>

      </div>
    </section>
  );
}
'

New-Item -Path "apps/web/src/app/about/page.tsx" -ItemType File -Force -Value '
import Link from "next/link";
import { ArrowRight, Code2, Heart, Flag } from "lucide-react";

export default function AboutPage() {
  return (
    <div className="bg-white text-slate-900 font-sans pt-20">
      
      {/* HEADER */}
      <section className="bg-slate-50 py-24 px-6 border-b border-slate-200 text-center">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-5xl md:text-7xl font-bold tracking-tight text-slate-900 mb-6">
            Built for India.<br />Built for the future.
          </h1>
          <p className="text-xl md:text-2xl text-slate-600 leading-relaxed max-w-2xl mx-auto">
            Our mission is to liberate Indian businesses from archaic legacy software and expensive SaaS subscriptions.
          </p>
        </div>
      </section>

      {/* THE STORY */}
      <section className="py-24 px-6 max-w-4xl mx-auto">
        <div className="prose prose-lg prose-slate max-w-none">
          <h2 className="text-3xl font-bold text-slate-900 mb-6">The Legacy Problem</h2>
          <p className="text-slate-600 mb-8 leading-relaxed">
            For decades, Indian businesses have relied on a fragmented stack of legacy desktop software to run their operations. You use one software for accounting, another for HR, and yet another for tax filing. It is expensive, siloed, and frustrating.
          </p>
          <p className="text-slate-600 mb-12 leading-relaxed">
            Tally costs ₹54,000. Zoho Books costs ₹30,000. Most businesses use less than 10% of the features they are paying for, while struggling to keep their data synced across platforms. We believe Indian businesses deserve better.
          </p>

          <h2 className="text-3xl font-bold text-slate-900 mb-6">The Lekhva Philosophy</h2>
          <p className="text-slate-600 mb-8 leading-relaxed">
            Lekhva was built from the ground up as a unified, cloud-native ERP. We didn&apos;t just build an accounting tool—we built a complete operating system that scales from a single retail shop to a multi-company MNC.
          </p>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 my-16">
            <div className="bg-slate-50 p-8 rounded-2xl border border-slate-200 text-center">
              <Flag className="w-10 h-10 text-blue-600 mx-auto mb-4" />
              <h3 className="font-bold text-slate-900 mb-2">India First</h3>
              <p className="text-sm text-slate-600">Built natively for the complex Indian taxation system (GST/TDS/ITR).</p>
            </div>
            <div className="bg-slate-50 p-8 rounded-2xl border border-slate-200 text-center">
              <Code2 className="w-10 h-10 text-blue-600 mx-auto mb-4" />
              <h3 className="font-bold text-slate-900 mb-2">Modern Stack</h3>
              <p className="text-sm text-slate-600">Built on Next.js, Supabase, and Drizzle. Fast, secure, and infinitely scalable.</p>
            </div>
            <div className="bg-slate-50 p-8 rounded-2xl border border-slate-200 text-center">
              <Heart className="w-10 h-10 text-blue-600 mx-auto mb-4" />
              <h3 className="font-bold text-slate-900 mb-2">Customer Obsessed</h3>
              <p className="text-sm text-slate-600">Transparent pricing, open APIs, and absolutely zero vendor lock-in.</p>
            </div>
          </div>

          <h2 className="text-3xl font-bold text-slate-900 mb-6">Our Promise</h2>
          <p className="text-slate-600 mb-8 leading-relaxed">
            We promise to always keep the core platform accessible. We promise to never hold your data hostage (export your data as JSON or CSV at any time). And we promise to keep building the features you actually need, not just the ones that look good on a marketing page.
          </p>
        </div>
      </section>

      {/* CTA */}
      <section className="py-24 px-6 bg-blue-600 text-center">
        <div className="max-w-3xl mx-auto">
          <h2 className="text-4xl font-bold text-white mb-6">Join the revolution.</h2>
          <p className="text-blue-100 text-xl mb-10">Stop paying for software from the 90s. Migrate to Lekhva today.</p>
          <Link href="/pricing" className="bg-white text-blue-900 px-8 py-4 rounded-lg text-lg font-bold hover:bg-slate-100 transition-colors inline-flex items-center gap-2 shadow-xl shadow-blue-900/20">
            View Pricing <ArrowRight className="w-5 h-5" />
          </Link>
        </div>
      </section>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/contact/page.tsx" -ItemType File -Force -Value '
"use client";

import { Building2, Mail, Phone, MapPin } from "lucide-react";
import { useState } from "react";

export default function ContactPage() {
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setSubmitted(true);
  };

  return (
    <div className="bg-white text-slate-900 font-sans pt-20">
      
      {/* HEADER */}
      <section className="bg-slate-50 py-24 px-6 border-b border-slate-200 text-center">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-5xl md:text-6xl font-bold tracking-tight text-slate-900 mb-6">
            Get in touch.
          </h1>
          <p className="text-xl text-slate-600 leading-relaxed">
            Whether you want a personalized demo or need help migrating from Tally, our team is here to help.
          </p>
        </div>
      </section>

      <section className="py-24 px-6 max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-16">
        
        {/* Contact Info */}
        <div>
          <h2 className="text-3xl font-bold text-slate-900 mb-8">Contact Information</h2>
          
          <div className="space-y-8">
            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-blue-100 rounded-xl flex items-center justify-center shrink-0">
                <Mail className="w-6 h-6 text-blue-600" />
              </div>
              <div>
                <h3 className="font-bold text-slate-900 mb-1">Email Sales</h3>
                <p className="text-slate-600 mb-2">Our team usually responds within 2 hours.</p>
                <a href="mailto:sales@lekhva.com" className="text-blue-600 font-semibold hover:underline">sales@lekhva.com</a>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-emerald-100 rounded-xl flex items-center justify-center shrink-0">
                <Phone className="w-6 h-6 text-emerald-600" />
              </div>
              <div>
                <h3 className="font-bold text-slate-900 mb-1">Call Us</h3>
                <p className="text-slate-600 mb-2">Available Mon-Fri, 9am - 6pm IST.</p>
                <a href="tel:+919876543210" className="text-blue-600 font-semibold hover:underline">+91 98765 43210</a>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center shrink-0">
                <MapPin className="w-6 h-6 text-purple-600" />
              </div>
              <div>
                <h3 className="font-bold text-slate-900 mb-1">HQ</h3>
                <p className="text-slate-600">Mumbai, Maharashtra<br/>India</p>
              </div>
            </div>
          </div>
        </div>

        {/* Contact Form */}
        <div className="bg-white p-8 md:p-12 rounded-3xl border border-slate-200 shadow-xl shadow-slate-200/50">
          {submitted ? (
             <div className="h-full flex flex-col items-center justify-center text-center py-12">
               <div className="w-16 h-16 bg-emerald-100 rounded-full flex items-center justify-center mb-6">
                 <Building2 className="w-8 h-8 text-emerald-600" />
               </div>
               <h3 className="text-2xl font-bold text-slate-900 mb-2">Request Received</h3>
               <p className="text-slate-600">Our enterprise sales team will be in touch shortly to schedule your demo.</p>
             </div>
          ) : (
            <>
              <h2 className="text-2xl font-bold text-slate-900 mb-6">Book a Demo</h2>
              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid grid-cols-2 gap-4">
                  <div className="space-y-2">
                    <label className="text-sm font-semibold text-slate-700">First Name</label>
                    <input required type="text" className="w-full px-4 py-3 rounded-lg border border-slate-300 focus:outline-none focus:ring-2 focus:ring-blue-600/50 focus:border-blue-600" />
                  </div>
                  <div className="space-y-2">
                    <label className="text-sm font-semibold text-slate-700">Last Name</label>
                    <input required type="text" className="w-full px-4 py-3 rounded-lg border border-slate-300 focus:outline-none focus:ring-2 focus:ring-blue-600/50 focus:border-blue-600" />
                  </div>
                </div>
                <div className="space-y-2">
                  <label className="text-sm font-semibold text-slate-700">Work Email</label>
                  <input required type="email" className="w-full px-4 py-3 rounded-lg border border-slate-300 focus:outline-none focus:ring-2 focus:ring-blue-600/50 focus:border-blue-600" />
                </div>
                <div className="space-y-2">
                  <label className="text-sm font-semibold text-slate-700">Company Size</label>
                  <select required className="w-full px-4 py-3 rounded-lg border border-slate-300 focus:outline-none focus:ring-2 focus:ring-blue-600/50 focus:border-blue-600 bg-white">
                    <option>1-10 employees</option>
                    <option>11-50 employees</option>
                    <option>51-200 employees</option>
                    <option>201+ employees</option>
                  </select>
                </div>
                <button type="submit" className="w-full bg-blue-600 text-white font-bold py-4 rounded-lg hover:bg-blue-700 transition-colors shadow-lg shadow-blue-600/20">
                  Request Demo
                </button>
              </form>
            </>
          )}
        </div>

      </section>
    </div>
  );
}
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion, AnimatePresence } from "framer-motion";
import Link from "next/link";
import { useState } from "react";
import { 
  ArrowRight, CheckCircle2, ShieldCheck, Zap, Store, Building, Building2, 
  Calculator, FileCheck2, Server, Pill, Gem, Factory, Utensils, ScanSearch, LineChart
} from "lucide-react";

const industries = [
  { id: "pharma", name: "Medical / Pharma", icon: Pill, desc: "Schedule H/H1 warnings, FEFO batch expiry tracking, and DPCO compliance built-in." },
  { id: "jewelry", name: "Jewelry / Bullion", icon: Gem, desc: "HUID per piece, Karat tracking, live making charges, wastage calculation, and AML mandate." },
  { id: "manufacturing", name: "Manufacturing", icon: Factory, desc: "Multi-level BOM, inventory mixing, job work (Rule 55), and automated ITC-04 filing." },
  { id: "restaurant", name: "Restaurant / POS", icon: Utensils, desc: "Table management, KOT/KDS routing, split billing, Zomato/Swiggy sync, and recipe costing." }
];

export default function Home() {
  const [activeIndustry, setActiveIndustry] = useState(industries[0]);

  return (
    <div className="bg-slate-50 text-slate-900 font-sans overflow-hidden">
      
      {/* 1. HERO SECTION */}
      <section className="relative pt-32 pb-48 px-6 bg-[#0B1120] overflow-hidden">
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff05_1px,transparent_1px),linear-gradient(to_bottom,#ffffff05_1px,transparent_1px)] bg-[size:32px_32px]" />
        <div className="absolute top-[-20%] left-[-10%] w-[50%] h-[50%] rounded-full bg-blue-600/20 blur-[120px]" />
        <div className="absolute bottom-[-10%] right-[-10%] w-[40%] h-[40%] rounded-full bg-indigo-600/20 blur-[120px]" />

        <div className="max-w-7xl mx-auto relative z-10 flex flex-col items-center text-center">
          <motion.div 
            initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-500/10 border border-blue-500/20 text-blue-300 text-sm font-semibold mb-8 backdrop-blur-md"
          >
            <Zap className="w-4 h-4 text-emerald-400" /> Lekhva v5 is now live
          </motion.div>
          
          <motion.h1 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }}
            className="text-5xl md:text-7xl lg:text-[5.5rem] font-bold tracking-tight text-white max-w-6xl mb-6 leading-[1.1]"
          >
            From a small retail shop.<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-indigo-400">
              To a big MNC.
            </span>
          </motion.h1>
          
          <motion.p 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }}
            className="text-xl md:text-2xl text-slate-400 max-w-3xl mb-12 leading-relaxed"
          >
            We&apos;ve got it all covered. Lekhva unifies Tally-grade accounting, modern HRMS, automated GST filing, and E-commerce sync into one highly scalable cloud platform.
          </motion.p>
          
          <motion.div 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }}
            className="flex flex-col sm:flex-row gap-4 w-full sm:w-auto"
          >
            <Link href="/pricing" className="bg-blue-600 text-white px-8 py-4 rounded-xl text-lg font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25 flex items-center justify-center gap-2">
              Start Free Trial <ArrowRight className="w-5 h-5" />
            </Link>
            <Link href="/contact" className="bg-white/5 text-white border border-white/10 backdrop-blur-md px-8 py-4 rounded-xl text-lg font-bold hover:bg-white/10 transition-colors flex items-center justify-center">
              Book a Demo
            </Link>
          </motion.div>
        </div>
      </section>

      {/* 2. DASHBOARD MOCKUP PULL-UP */}
      <section className="relative z-20 px-6 max-w-7xl mx-auto -mt-32 mb-12">
        <motion.div 
          initial={{ opacity: 0, y: 40 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.5, duration: 0.8 }}
          className="w-full bg-[#1e293b] rounded-2xl md:rounded-[2rem] border border-slate-700/50 p-2 md:p-3 shadow-[0_0_60px_rgba(0,0,0,0.5)] overflow-hidden"
        >
          <img src="/dashboard.jpg" alt="Lekhva Dashboard" className="w-full h-auto rounded-xl md:rounded-[1.5rem] object-cover" />
        </motion.div>
      </section>

      {/* 3. STATS BAR */}
      <section className="border-b border-slate-200 bg-white py-12 px-6">
        <div className="max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8 divide-x divide-slate-100 text-center">
          <div><h4 className="text-4xl font-bold text-slate-900 mb-2">28</h4><p className="text-sm font-semibold text-slate-500 uppercase">Core Modules</p></div>
          <div><h4 className="text-4xl font-bold text-blue-600 mb-2">38</h4><p className="text-sm font-semibold text-slate-500 uppercase">State Codes Configured</p></div>
          <div><h4 className="text-4xl font-bold text-slate-900 mb-2">100%</h4><p className="text-sm font-semibold text-slate-500 uppercase">GSTN Compliant</p></div>
          <div><h4 className="text-4xl font-bold text-blue-600 mb-2">30+</h4><p className="text-sm font-semibold text-slate-500 uppercase">Print Templates</p></div>
        </div>
      </section>

      {/* 4. THE SCALE SECTION: SHOP TO MNC */}
      <section className="py-32 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">Built to scale with you.</h2>
          <p className="text-xl text-slate-600 max-w-2xl mx-auto">Never migrate software again. Turn features on and off as your business grows.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          
          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="bg-white rounded-3xl p-8 border border-slate-200 shadow-lg hover:shadow-xl transition-shadow relative overflow-hidden group">
            <div className="absolute top-0 right-0 w-24 h-24 bg-emerald-50 rounded-bl-full -z-10 group-hover:scale-150 transition-transform duration-500" />
            <Store className="w-10 h-10 text-emerald-600 mb-6" />
            <h3 className="text-2xl font-bold text-slate-900 mb-2">Small Retail Shop</h3>
            <p className="text-slate-500 font-medium mb-6">Day 1 Operations</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> 58mm/80mm thermal receipt printing</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Barcode scanning & basic inventory</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Fast POS interface with UPI QR</li>
            </ul>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }} className="bg-blue-600 rounded-3xl p-8 border border-blue-500 shadow-xl shadow-blue-600/20 relative overflow-hidden text-white transform md:-translate-y-4">
            <div className="absolute top-0 right-0 w-32 h-32 bg-blue-500/50 rounded-bl-full -z-10 blur-xl" />
            <Building className="w-10 h-10 text-blue-200 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Growing SME</h3>
            <p className="text-blue-200 font-medium mb-6">Expanding the Team</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Multi-warehouse Landed Costs</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Full HRMS, Payroll, and GPS Attendance</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Automated GSTR-1/3B filing</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Amazon & Shopify Sync</li>
            </ul>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.2 }} className="bg-slate-900 rounded-3xl p-8 border border-slate-800 shadow-xl relative overflow-hidden text-white group">
            <div className="absolute top-0 right-0 w-24 h-24 bg-indigo-500/20 rounded-bl-full -z-10 blur-xl group-hover:scale-150 transition-transform duration-500" />
            <Building2 className="w-10 h-10 text-indigo-400 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Big MNC</h3>
            <p className="text-slate-400 font-medium mb-6">Enterprise Scale</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Multi-company consolidation (Group P&L)</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Custom Approval Workflows</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Granular Role-Based Access (RBAC)</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Open API & Webhooks</li>
            </ul>
          </motion.div>
          
        </div>
      </section>

      {/* 5. INTERACTIVE TABS: INDUSTRY TEMPLATES */}
      <section className="py-32 px-6 bg-slate-100 border-y border-slate-200 overflow-hidden">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6">Designed for your exact industry.</h2>
            <p className="text-xl text-slate-600 max-w-2xl mx-auto">Lekhva adapts its fields, compliance rules, and invoice templates based on your specific sector.</p>
          </div>

          <div className="flex flex-col lg:flex-row gap-12 items-center">
            {/* Tabs */}
            <div className="flex flex-col gap-4 w-full lg:w-1/3">
              {industries.map((ind) => {
                const isActive = activeIndustry.id === ind.id;
                const Icon = ind.icon;
                return (
                  <button 
                    key={ind.id}
                    onClick={() => setActiveIndustry(ind)}
                    className={`flex items-center gap-4 p-6 rounded-2xl text-left transition-all duration-300 ${
                      isActive ? "bg-white shadow-lg border border-slate-200 scale-105" : "bg-transparent border border-transparent hover:bg-slate-200/50"
                    }`}
                  >
                    <div className={`w-12 h-12 rounded-xl flex items-center justify-center shrink-0 ${isActive ? "bg-blue-600 text-white" : "bg-slate-200 text-slate-600"}`}>
                      <Icon className="w-6 h-6" />
                    </div>
                    <div>
                      <h4 className={`text-lg font-bold ${isActive ? "text-slate-900" : "text-slate-600"}`}>{ind.name}</h4>
                    </div>
                  </button>
                )
              })}
            </div>

            {/* Content Display */}
            <div className="w-full lg:w-2/3">
              <AnimatePresence mode="wait">
                <motion.div
                  key={activeIndustry.id}
                  initial={{ opacity: 0, x: 20 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: -20 }}
                  transition={{ duration: 0.3 }}
                  className="bg-white rounded-3xl p-10 md:p-16 border border-slate-200 shadow-xl"
                >
                  <activeIndustry.icon className="w-16 h-16 text-blue-600 mb-8" />
                  <h3 className="text-3xl md:text-4xl font-bold text-slate-900 mb-6">{activeIndustry.name} Compliance</h3>
                  <p className="text-xl text-slate-600 leading-relaxed mb-8">{activeIndustry.desc}</p>
                  
                  {/* Mock Industry Data Visualization */}
                  <div className="bg-slate-50 p-6 rounded-xl border border-slate-100 flex gap-4 items-center">
                    <div className="w-3 h-3 rounded-full bg-emerald-500 animate-pulse" />
                    <span className="text-slate-700 font-medium">Auto-configured for {activeIndustry.name} sector</span>
                  </div>
                </motion.div>
              </AnimatePresence>
            </div>
          </div>
        </div>
      </section>

      {/* 6. M-CLASS AI OCR DEMO */}
      <section className="py-32 px-6 max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-16 items-center">
           <div>
              <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-purple-50 border border-purple-100 text-purple-700 text-sm font-semibold mb-8">
                Powered by Google Gemini
              </div>
              <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">M-Class AI Engine</h2>
              <p className="text-lg text-slate-600 mb-8 leading-relaxed">
                Stop manually entering purchase bills. Drop an invoice photo into Lekhva and our AI extracts the vendor, line items, amounts, and GST details instantly. 
              </p>
              <ul className="space-y-4 mb-8">
                <li className="flex items-center gap-3 text-slate-700 font-medium"><ScanSearch className="w-5 h-5 text-purple-600"/> Smart OCR Invoice Scanning</li>
                <li className="flex items-center gap-3 text-slate-700 font-medium"><Calculator className="w-5 h-5 text-purple-600"/> AI-assisted Bank Reconciliation</li>
                <li className="flex items-center gap-3 text-slate-700 font-medium"><LineChart className="w-5 h-5 text-purple-600"/> Predictive Cash Flow Modeling</li>
              </ul>
           </div>
           
           <div className="bg-white p-8 rounded-3xl border border-slate-200 shadow-xl relative overflow-hidden group">
              <div className="absolute inset-0 bg-gradient-to-tr from-purple-500/5 to-transparent pointer-events-none" />
              <div className="relative z-10 space-y-6">
                
                {/* Mock Upload Box */}
                <div className="w-full h-32 border-2 border-dashed border-slate-300 rounded-xl flex flex-col items-center justify-center bg-slate-50 relative overflow-hidden">
                  <div className="absolute top-0 left-0 h-full w-2 bg-purple-500 shadow-[0_0_20px_#a855f7] group-hover:translate-x-[400px] transition-transform duration-[2s] ease-linear repeat-infinite" />
                  <ScanSearch className="w-8 h-8 text-slate-400 mb-2" />
                  <span className="text-slate-500 font-medium">Scanning "vendor_bill.jpg"...</span>
                </div>

                {/* Mock Results */}
                <div className="space-y-3">
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Vendor Detected:</span>
                    <span>Acme Supplies Ltd.</span>
                  </div>
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">GSTIN Extracted:</span>
                    <span>27AADCB2230M1Z2</span>
                  </div>
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Taxable Amount:</span>
                    <span>₹45,000.00</span>
                  </div>
                </div>

              </div>
           </div>
        </div>
      </section>

      {/* 7. FINAL CTA */}
      <section className="py-32 px-6 text-center bg-[#0B1120] text-white">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-4xl md:text-6xl font-bold mb-6 tracking-tight">The last software migration you will ever do.</h2>
          <p className="text-xl text-slate-400 mb-12">
            Start on the Free tier for your retail shop, and seamlessly upgrade to Enterprise as you build your empire.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/pricing" className="bg-blue-600 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25">
              View Pricing & Plans
            </Link>
            <Link href="/contact" className="bg-white/5 border border-white/10 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-white/10 transition-colors">
              Talk to Sales
            </Link>
          </div>
        </div>
      </section>

    </div>
  );
}
'

New-Item -Path "apps/web/src/app/page.tsx" -ItemType File -Force -Value '
"use client";

import { motion, AnimatePresence } from "framer-motion";
import Link from "next/link";
import { useState, useEffect } from "react";
import { 
  ArrowRight, CheckCircle2, ShieldCheck, Zap, Store, Building, Building2, 
  Calculator, FileCheck2, Server, Pill, Gem, Factory, Utensils, ScanSearch, LineChart, Code2
} from "lucide-react";

const industries = [
  { id: "pharma", name: "Medical / Pharma", icon: Pill, desc: "Schedule H/H1 warnings, FEFO batch expiry tracking, and DPCO compliance built-in." },
  { id: "jewelry", name: "Jewelry / Bullion", icon: Gem, desc: "HUID per piece, Karat tracking, live making charges, wastage calculation, and AML mandate." },
  { id: "manufacturing", name: "Manufacturing", icon: Factory, desc: "Multi-level BOM, inventory mixing, job work (Rule 55), and automated ITC-04 filing." },
  { id: "restaurant", name: "Restaurant / POS", icon: Utensils, desc: "Table management, KOT/KDS routing, split billing, Zomato/Swiggy sync, and recipe costing." }
];

export default function Home() {
  const [activeIndustry, setActiveIndustry] = useState(industries[0]);
  
  // Terminal typing effect state
  const [terminalText, setTerminalText] = useState("");
  const fullText = "> initializing lekhva_erp...\n> loading multi_company_ledger [ok]\n> syncing gstin_api [ok]\n> starting ai_ocr_engine [ready]\n\nSystem Online. Awaiting commands.";

  useEffect(() => {
    let i = 0;
    const interval = setInterval(() => {
      setTerminalText(fullText.substring(0, i));
      i++;
      if (i > fullText.length) clearInterval(interval);
    }, 40);
    return () => clearInterval(interval);
  }, []);

  return (
    <div className="bg-slate-50 text-slate-900 font-sans overflow-hidden">
      
      {/* 1. HERO SECTION */}
      <section className="relative pt-32 pb-48 px-6 bg-[#0B1120] overflow-hidden">
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff05_1px,transparent_1px),linear-gradient(to_bottom,#ffffff05_1px,transparent_1px)] bg-[size:32px_32px]" />
        <div className="absolute top-[-20%] left-[-10%] w-[50%] h-[50%] rounded-full bg-blue-600/20 blur-[120px]" />
        <div className="absolute bottom-[-10%] right-[-10%] w-[40%] h-[40%] rounded-full bg-indigo-600/20 blur-[120px]" />

        <div className="max-w-7xl mx-auto relative z-10 flex flex-col items-center text-center">
          <motion.div 
            initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-blue-500/10 border border-blue-500/20 text-blue-300 text-sm font-semibold mb-8 backdrop-blur-md"
          >
            <Zap className="w-4 h-4 text-emerald-400" /> Lekhva v5 is now live
          </motion.div>
          
          <motion.h1 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }}
            className="text-5xl md:text-7xl lg:text-[5.5rem] font-bold tracking-tight text-white max-w-6xl mb-6 leading-[1.1]"
          >
            From a small retail shop.<br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-indigo-400">
              To a big MNC.
            </span>
          </motion.h1>
          
          <motion.p 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }}
            className="text-xl md:text-2xl text-slate-400 max-w-3xl mb-12 leading-relaxed"
          >
            We&apos;ve got it all covered. Lekhva unifies Tally-grade accounting, modern HRMS, automated GST filing, and E-commerce sync into one highly scalable cloud platform.
          </motion.p>
          
          <motion.div 
            initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }}
            className="flex flex-col sm:flex-row gap-4 w-full sm:w-auto"
          >
            <Link href="/pricing" className="bg-blue-600 text-white px-8 py-4 rounded-xl text-lg font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25 flex items-center justify-center gap-2">
              Start Free Trial <ArrowRight className="w-5 h-5" />
            </Link>
            <Link href="/contact" className="bg-white/5 text-white border border-white/10 backdrop-blur-md px-8 py-4 rounded-xl text-lg font-bold hover:bg-white/10 transition-colors flex items-center justify-center">
              Book a Demo
            </Link>
          </motion.div>
        </div>
      </section>

      {/* 2. TEXT/CODE PULL-UP (REPLACES THE IMAGE) */}
      <section className="relative z-20 px-6 max-w-7xl mx-auto -mt-32 mb-12">
        <motion.div 
          initial={{ opacity: 0, y: 40 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.5, duration: 0.8 }}
          className="w-full bg-[#050505] rounded-2xl md:rounded-[2rem] border border-slate-700/50 p-6 md:p-12 shadow-[0_0_60px_rgba(0,0,0,0.5)] flex flex-col md:flex-row gap-12 items-center"
        >
          {/* Left Side: Code Terminal Effect */}
          <div className="w-full md:w-1/2 font-mono text-sm md:text-base text-emerald-400 bg-black/50 p-6 rounded-xl border border-white/5 h-48 flex items-start justify-start text-left whitespace-pre-wrap">
            {terminalText}
            <span className="w-2 h-4 bg-emerald-400 inline-block animate-pulse ml-1" />
          </div>

          {/* Right Side: Text Highlights */}
          <div className="w-full md:w-1/2 space-y-6">
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 rounded-full bg-blue-500/20 flex items-center justify-center shrink-0 border border-blue-500/30">
                <ShieldCheck className="w-5 h-5 text-blue-400" />
              </div>
              <div>
                <h4 className="text-xl font-bold text-white mb-1">SOC2 & DPDP Compliant</h4>
                <p className="text-slate-400 text-sm">Your data is secured with bank-grade 256-bit AES encryption.</p>
              </div>
            </div>
            
            <div className="flex items-start gap-4">
              <div className="w-10 h-10 rounded-full bg-indigo-500/20 flex items-center justify-center shrink-0 border border-indigo-500/30">
                <Calculator className="w-5 h-5 text-indigo-400" />
              </div>
              <div>
                <h4 className="text-xl font-bold text-white mb-1">Tally XML Import</h4>
                <p className="text-slate-400 text-sm">Import 3 years of Tally history in 1-click with our smart parser.</p>
              </div>
            </div>

            <div className="flex items-start gap-4">
              <div className="w-10 h-10 rounded-full bg-emerald-500/20 flex items-center justify-center shrink-0 border border-emerald-500/30">
                <Code2 className="w-5 h-5 text-emerald-400" />
              </div>
              <div>
                <h4 className="text-xl font-bold text-white mb-1">Developer API</h4>
                <p className="text-slate-400 text-sm">Connect your own apps via REST API and Webhooks.</p>
              </div>
            </div>
          </div>
        </motion.div>
      </section>

      {/* 3. STATS BAR */}
      <section className="border-b border-slate-200 bg-white py-12 px-6">
        <div className="max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8 divide-x divide-slate-100 text-center">
          <div><h4 className="text-4xl font-bold text-slate-900 mb-2">28</h4><p className="text-sm font-semibold text-slate-500 uppercase">Core Modules</p></div>
          <div><h4 className="text-4xl font-bold text-blue-600 mb-2">38</h4><p className="text-sm font-semibold text-slate-500 uppercase">State Codes Configured</p></div>
          <div><h4 className="text-4xl font-bold text-slate-900 mb-2">100%</h4><p className="text-sm font-semibold text-slate-500 uppercase">GSTN Compliant</p></div>
          <div><h4 className="text-4xl font-bold text-blue-600 mb-2">30+</h4><p className="text-sm font-semibold text-slate-500 uppercase">Print Templates</p></div>
        </div>
      </section>

      {/* 4. THE SCALE SECTION: SHOP TO MNC */}
      <section className="py-32 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-20">
          <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">Built to scale with you.</h2>
          <p className="text-xl text-slate-600 max-w-2xl mx-auto">Never migrate software again. Turn features on and off as your business grows.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          
          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="bg-white rounded-3xl p-8 border border-slate-200 shadow-lg hover:shadow-xl transition-shadow relative overflow-hidden group">
            <div className="absolute top-0 right-0 w-24 h-24 bg-emerald-50 rounded-bl-full -z-10 group-hover:scale-150 transition-transform duration-500" />
            <Store className="w-10 h-10 text-emerald-600 mb-6" />
            <h3 className="text-2xl font-bold text-slate-900 mb-2">Small Retail Shop</h3>
            <p className="text-slate-500 font-medium mb-6">Day 1 Operations</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> 58mm/80mm thermal receipt printing</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Barcode scanning & basic inventory</li>
              <li className="flex items-start gap-3 text-slate-600"><CheckCircle2 className="w-5 h-5 text-emerald-500 shrink-0 mt-0.5" /> Fast POS interface with UPI QR</li>
            </ul>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }} className="bg-blue-600 rounded-3xl p-8 border border-blue-500 shadow-xl shadow-blue-600/20 relative overflow-hidden text-white transform md:-translate-y-4">
            <div className="absolute top-0 right-0 w-32 h-32 bg-blue-500/50 rounded-bl-full -z-10 blur-xl" />
            <Building className="w-10 h-10 text-blue-200 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Growing SME</h3>
            <p className="text-blue-200 font-medium mb-6">Expanding the Team</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Multi-warehouse Landed Costs</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Full HRMS, Payroll, and GPS Attendance</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Automated GSTR-1/3B filing</li>
              <li className="flex items-start gap-3 text-blue-50"><CheckCircle2 className="w-5 h-5 text-blue-300 shrink-0 mt-0.5" /> Amazon & Shopify Sync</li>
            </ul>
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.2 }} className="bg-slate-900 rounded-3xl p-8 border border-slate-800 shadow-xl relative overflow-hidden text-white group">
            <div className="absolute top-0 right-0 w-24 h-24 bg-indigo-500/20 rounded-bl-full -z-10 blur-xl group-hover:scale-150 transition-transform duration-500" />
            <Building2 className="w-10 h-10 text-indigo-400 mb-6" />
            <h3 className="text-2xl font-bold mb-2">Big MNC</h3>
            <p className="text-slate-400 font-medium mb-6">Enterprise Scale</p>
            <ul className="space-y-4">
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Multi-company consolidation (Group P&L)</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Custom Approval Workflows</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Granular Role-Based Access (RBAC)</li>
              <li className="flex items-start gap-3 text-slate-300"><CheckCircle2 className="w-5 h-5 text-indigo-500 shrink-0 mt-0.5" /> Open API & Webhooks</li>
            </ul>
          </motion.div>
          
        </div>
      </section>

      {/* 5. INTERACTIVE TABS: INDUSTRY TEMPLATES */}
      <section className="py-32 px-6 bg-slate-100 border-y border-slate-200 overflow-hidden">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6">Designed for your exact industry.</h2>
            <p className="text-xl text-slate-600 max-w-2xl mx-auto">Lekhva adapts its fields, compliance rules, and invoice templates based on your specific sector.</p>
          </div>

          <div className="flex flex-col lg:flex-row gap-12 items-center">
            {/* Tabs */}
            <div className="flex flex-col gap-4 w-full lg:w-1/3">
              {industries.map((ind) => {
                const isActive = activeIndustry.id === ind.id;
                const Icon = ind.icon;
                return (
                  <button 
                    key={ind.id}
                    onClick={() => setActiveIndustry(ind)}
                    className={`flex items-center gap-4 p-6 rounded-2xl text-left transition-all duration-300 ${
                      isActive ? "bg-white shadow-lg border border-slate-200 scale-105" : "bg-transparent border border-transparent hover:bg-slate-200/50"
                    }`}
                  >
                    <div className={`w-12 h-12 rounded-xl flex items-center justify-center shrink-0 ${isActive ? "bg-blue-600 text-white" : "bg-slate-200 text-slate-600"}`}>
                      <Icon className="w-6 h-6" />
                    </div>
                    <div>
                      <h4 className={`text-lg font-bold ${isActive ? "text-slate-900" : "text-slate-600"}`}>{ind.name}</h4>
                    </div>
                  </button>
                )
              })}
            </div>

            {/* Content Display */}
            <div className="w-full lg:w-2/3">
              <AnimatePresence mode="wait">
                <motion.div
                  key={activeIndustry.id}
                  initial={{ opacity: 0, x: 20 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: -20 }}
                  transition={{ duration: 0.3 }}
                  className="bg-white rounded-3xl p-10 md:p-16 border border-slate-200 shadow-xl"
                >
                  <activeIndustry.icon className="w-16 h-16 text-blue-600 mb-8" />
                  <h3 className="text-3xl md:text-4xl font-bold text-slate-900 mb-6">{activeIndustry.name} Compliance</h3>
                  <p className="text-xl text-slate-600 leading-relaxed mb-8">{activeIndustry.desc}</p>
                  
                  {/* Mock Industry Data Visualization */}
                  <div className="bg-slate-50 p-6 rounded-xl border border-slate-100 flex gap-4 items-center">
                    <div className="w-3 h-3 rounded-full bg-emerald-500 animate-pulse" />
                    <span className="text-slate-700 font-medium">Auto-configured for {activeIndustry.name} sector</span>
                  </div>
                </motion.div>
              </AnimatePresence>
            </div>
          </div>
        </div>
      </section>

      {/* 6. M-CLASS AI OCR DEMO */}
      <section className="py-32 px-6 max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-16 items-center">
           <div>
              <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-purple-50 border border-purple-100 text-purple-700 text-sm font-semibold mb-8">
                Powered by Google Gemini
              </div>
              <h2 className="text-4xl md:text-5xl font-bold text-slate-900 mb-6 tracking-tight">M-Class AI Engine</h2>
              <p className="text-lg text-slate-600 mb-8 leading-relaxed">
                Stop manually entering purchase bills. Drop an invoice photo into Lekhva and our AI extracts the vendor, line items, amounts, and GST details instantly. 
              </p>
              <ul className="space-y-4 mb-8">
                <li className="flex items-center gap-3 text-slate-700 font-medium"><ScanSearch className="w-5 h-5 text-purple-600"/> Smart OCR Invoice Scanning</li>
                <li className="flex items-center gap-3 text-slate-700 font-medium"><Calculator className="w-5 h-5 text-purple-600"/> AI-assisted Bank Reconciliation</li>
                <li className="flex items-center gap-3 text-slate-700 font-medium"><LineChart className="w-5 h-5 text-purple-600"/> Predictive Cash Flow Modeling</li>
              </ul>
           </div>
           
           <div className="bg-white p-8 rounded-3xl border border-slate-200 shadow-xl relative overflow-hidden group">
              <div className="absolute inset-0 bg-gradient-to-tr from-purple-500/5 to-transparent pointer-events-none" />
              <div className="relative z-10 space-y-6">
                
                {/* Mock Upload Box */}
                <div className="w-full h-32 border-2 border-dashed border-slate-300 rounded-xl flex flex-col items-center justify-center bg-slate-50 relative overflow-hidden">
                  <div className="absolute top-0 left-0 h-full w-2 bg-purple-500 shadow-[0_0_20px_#a855f7] group-hover:translate-x-[400px] transition-transform duration-[2s] ease-linear repeat-infinite" />
                  <ScanSearch className="w-8 h-8 text-slate-400 mb-2" />
                  <span className="text-slate-500 font-medium">Scanning "vendor_bill.jpg"...</span>
                </div>

                {/* Mock Results */}
                <div className="space-y-3">
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Vendor Detected:</span>
                    <span>Acme Supplies Ltd.</span>
                  </div>
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">GSTIN Extracted:</span>
                    <span>27AADCB2230M1Z2</span>
                  </div>
                  <div className="flex justify-between items-center p-3 bg-emerald-50 text-emerald-700 rounded-lg border border-emerald-100">
                    <span className="font-semibold text-sm">Taxable Amount:</span>
                    <span>₹45,000.00</span>
                  </div>
                </div>

              </div>
           </div>
        </div>
      </section>

      {/* 7. FINAL CTA */}
      <section className="py-32 px-6 text-center bg-[#0B1120] text-white">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-4xl md:text-6xl font-bold mb-6 tracking-tight">The last software migration you will ever do.</h2>
          <p className="text-xl text-slate-400 mb-12">
            Start on the Free tier for your retail shop, and seamlessly upgrade to Enterprise as you build your empire.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="/pricing" className="bg-blue-600 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-blue-500 hover:-translate-y-1 transition-all shadow-lg shadow-blue-600/25">
              View Pricing & Plans
            </Link>
            <Link href="/contact" className="bg-white/5 border border-white/10 text-white px-10 py-5 rounded-xl text-xl font-bold hover:bg-white/10 transition-colors">
              Talk to Sales
            </Link>
          </div>
        </div>
      </section>

    </div>
  );
}
'

New-Item -Path "apps/web/package.json" -ItemType File -Force -Value '{
  "name": "@lekhva/web",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "^14.2.5",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "framer-motion": "^11.3.19",
    "lucide-react": "^0.417.0"
  },
  "devDependencies": {
    "@types/node": "^20",
    "@types/react": "^18",
    "@types/react-dom": "^18",
    "postcss": "^8",
    "tailwindcss": "^3.4.1",
    "typescript": "^5"
  }
}'

