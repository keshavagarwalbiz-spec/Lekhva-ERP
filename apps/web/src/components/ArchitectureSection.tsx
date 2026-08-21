'use client';

import { motion } from 'framer-motion';

const LAYERS = [
  { id: 'Layer 1', label: 'Capture' },
  { id: 'Layer 2', label: 'Process' },
  { id: 'Layer 3', label: 'Interface' },
];

export default function ArchitectureSection() {
  return (
    <section className="min-h-screen bg-black flex items-center justify-center">
      <div className="max-w-3xl mx-auto px-6 py-32 text-center">
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, amount: 0.4 }}
          transition={{ duration: 1.0 }}
        >
          <p className="text-white/40 text-[13px] sm:text-[14px] tracking-[0.2em] uppercase mb-8">
            Architecture
          </p>
          <h2
            className="text-white font-light leading-[1.15] tracking-[-0.02em] mb-10"
            style={{ fontSize: 'clamp(28px,6vw,56px)' }}
          >
            Three layers. Zero friction.
          </h2>
          <p className="text-white/45 text-[15px] sm:text-[17px] leading-relaxed max-w-xl mx-auto">
            Sensor layer captures raw bioelectric signals. Processing layer isolates intent.
            Interface layer delivers structured output to any connected system.
          </p>
        </motion.div>

        <motion.div
          className="mt-20 flex flex-col items-center gap-4"
          initial={{ opacity: 0 }}
          whileInView={{ opacity: 1 }}
          viewport={{ once: true, amount: 0.4 }}
          transition={{ duration: 1.2, delay: 0.4 }}
        >
          {LAYERS.map((layer) => (
            <div
              key={layer.id}
              className="w-full max-w-md h-[72px] border border-white/10 rounded-lg flex items-center justify-between px-6"
            >
              <span className="text-white/30 text-[12px] tracking-[0.15em] uppercase">
                {layer.id}
              </span>
              <span className="text-white text-[16px] sm:text-[18px] font-light">
                {layer.label}
              </span>
            </div>
          ))}
        </motion.div>
      </div>
    </section>
  );
}
