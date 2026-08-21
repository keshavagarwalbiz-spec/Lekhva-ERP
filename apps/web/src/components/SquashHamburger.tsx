'use client';

import { motion } from 'framer-motion';

interface SquashHamburgerProps {
  isOpen: boolean;
  onClick: () => void;
  className?: string;
}

const spring = { type: 'spring' as const, stiffness: 300, damping: 20 };

export default function SquashHamburger({ isOpen, onClick, className = '' }: SquashHamburgerProps) {
  return (
    <button
      onClick={onClick}
      className={`relative cursor-pointer w-[15px] h-[10px] sm:w-[18px] sm:h-[12px] flex items-center justify-center ${className}`}
      aria-label="Toggle menu"
    >
      <motion.span
        className="absolute left-0 w-full bg-white h-[1.2px] sm:h-[1.5px]"
        animate={{
          top: isOpen ? '50%' : '0%',
          rotate: isOpen ? 45 : 0,
          translateY: isOpen ? '-50%' : '0%',
        }}
        transition={spring}
        style={{ transformOrigin: 'center' }}
      />
      <motion.span
        className="absolute left-0 top-1/2 -translate-y-1/2 w-full bg-white h-[1.2px] sm:h-[1.5px]"
        animate={{
          opacity: isOpen ? 0 : 1,
          scaleX: isOpen ? 0 : 1,
        }}
        transition={spring}
      />
      <motion.span
        className="absolute left-0 w-full bg-white h-[1.2px] sm:h-[1.5px]"
        animate={{
          bottom: isOpen ? '50%' : '0%',
          top: isOpen ? '50%' : 'auto',
          rotate: isOpen ? -45 : 0,
          translateY: isOpen ? '-50%' : '0%',
        }}
        transition={spring}
        style={{ transformOrigin: 'center' }}
      />
    </button>
  );
}
