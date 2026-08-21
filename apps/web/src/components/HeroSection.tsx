'use client';

import { useRef, useEffect } from 'react';
import { motion } from 'framer-motion';
import ScrambleIn from '@/components/ScrambleIn';

export default function HeroSection({ entranceComplete }: { entranceComplete: boolean }) {
  const videoRef = useRef<HTMLVideoElement>(null);
  const targetTimeRef = useRef(0);
  const seekingRef = useRef(false);

  useEffect(() => {
    const video = videoRef.current;
    if (!video) return;

    const handleSeeked = () => {
      seekingRef.current = false;
      if (Math.abs(video.currentTime - targetTimeRef.current) > 0.01) {
        seekingRef.current = true;
        video.currentTime = targetTimeRef.current;
      }
    };

    const handleMouseMove = (e: MouseEvent) => {
      if (!video.duration) return;
      const delta = e.movementX * 0.8;
      targetTimeRef.current += (delta / window.innerWidth) * video.duration;
      targetTimeRef.current = Math.max(0, Math.min(video.duration, targetTimeRef.current));

      if (!seekingRef.current) {
        seekingRef.current = true;
        video.currentTime = targetTimeRef.current;
      }
    };

    video.addEventListener('seeked', handleSeeked);
    window.addEventListener('mousemove', handleMouseMove);

    return () => {
      video.removeEventListener('seeked', handleSeeked);
      window.removeEventListener('mousemove', handleMouseMove);
    };
  }, []);

  return (
    <section className="relative h-screen h-[100dvh] flex flex-col overflow-hidden">
      {/* Background Video */}
      <video
        ref={videoRef}
        className="absolute inset-0 w-full h-full object-cover"
        muted
        playsInline
        preload="auto"
        src="https://d8j0ntlcm91z4.cloudfront.net/user_38xzZboKViGWJOttwIXH07lWA1P/hf_20260622_083515_290e5a10-0b95-41af-a5e2-32b6389baa4d.mp4"
      />

      {/* Dot grid overlay */}
      <div
        className="absolute inset-0 pointer-events-none"
        style={{
          backgroundImage: 'radial-gradient(#ffffff 1px, transparent 1px)',
          backgroundSize: '24px 24px',
          opacity: 0.05,
        }}
      />

      {/* Background watermark text */}
      <div
        className="absolute top-1/2 left-0 w-full text-center pointer-events-none select-none"
        style={{
          transform: 'translateY(calc(-50% + 50px))',
          fontFamily: '"Anton SC", sans-serif',
          fontSize: 'clamp(120px, 30vw, 521px)',
          letterSpacing: '-4px',
          textTransform: 'uppercase',
          opacity: 0.10,
          background: 'radial-gradient(circle, rgba(142,127,148,0) 0%, #8E7F94 70%)',
          WebkitBackgroundClip: 'text',
          WebkitTextFillColor: 'transparent',
          backgroundClip: 'text',
          lineHeight: 1,
        }}
      >
        TRANSCENDENCE
      </div>

      <motion.div
        className="relative z-20 flex-1 flex flex-col px-4 sm:px-6 md:px-8 pt-20 sm:pt-24 pb-8 sm:pb-12"
        animate={{ opacity: entranceComplete ? 1 : 0 }}
        transition={{ duration: 1 }}
      >
        <div className="flex-1" /> {/* Spacer */}

        {/* Bottom row */}
        <div className="flex flex-col gap-6 md:flex-row md:items-end md:justify-between relative z-20">
          
          {/* Left column */}
          <div className="flex flex-col gap-4">
            <h1
              className="text-white font-light leading-[0.95] tracking-[-0.03em]"
              style={{ fontSize: 'clamp(40px,10vw,100px)' }}
            >
              <ScrambleIn text="Brain" delay={200} triggered={entranceComplete} />
              <br />
              <ScrambleIn text="And Body" delay={500} triggered={entranceComplete} />
            </h1>
            
            <motion.p
              className="max-w-sm text-[13px] sm:text-[15px] text-white/60 leading-relaxed"
              initial={{ opacity: 0, y: 25 }}
              animate={{ opacity: entranceComplete ? 1 : 0, y: entranceComplete ? 0 : 25 }}
              transition={{ duration: 0.9, ease: [0.215, 0.610, 0.355, 1.000], delay: 0.2 }}
            >
              Built at the intersection of neuroscience and artificial intelligence. SynapseX continuously maps neural pathways, cognitive load, and physiological states into a single adaptive intelligence layer.
            </motion.p>
          </div>

          {/* Right column */}
          <div className="flex flex-col gap-4 text-left md:text-right">
            <h1
              className="text-white font-light leading-[0.95] tracking-[-0.03em]"
              style={{ fontSize: 'clamp(40px,10vw,100px)' }}
            >
              <ScrambleIn text="One" delay={700} triggered={entranceComplete} />
              <br />
              <ScrambleIn text="Network" delay={1000} triggered={entranceComplete} />
            </h1>
          </div>
          
        </div>
      </motion.div>
    </section>
  );
}
