'use client';
import { useRef } from 'react';
import { motion, useScroll, useTransform } from 'framer-motion';

interface AnimatedTextProps {
  text: string;
  className?: string;
}

export default function AnimatedText({ text, className = '' }: AnimatedTextProps) {
  const ref = useRef<HTMLParagraphElement>(null);
  const { scrollYProgress } = useScroll({
    target: ref,
    offset: ['start 0.8', 'end 0.2'],
  });

  const characters = text.split('');

  return (
    <p ref={ref} className={`${className} relative`}>
      {characters.map((char, i) => (
        <CharSpan key={i} char={char} index={i} total={characters.length} progress={scrollYProgress} />
      ))}
    </p>
  );
}

function CharSpan({ char, index, total, progress }: { char: string; index: number; total: number; progress: any }) {
  const opacity = useTransform(progress, [index / total, (index + 1) / total], [0.2, 1]);

  return (
    <span className="relative inline">
      <span className="invisible">{char === ' ' ? '\u00A0' : char}</span>
      <motion.span className="absolute left-0 top-0" style={{ opacity }}>
        {char === ' ' ? '\u00A0' : char}
      </motion.span>
    </span>
  );
}
