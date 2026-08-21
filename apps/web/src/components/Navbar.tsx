'use client';

import { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import ScrambleText from '@/components/ScrambleText';
import SynapseXLogo from '@/components/SynapseXLogo';
import SquashHamburger from '@/components/SquashHamburger';

function NavLink({ text, onClick, className }: { text: string; onClick: () => void; className?: string }) {
  const [hovered, setHovered] = useState(false);
  return (
    <span
      className={`cursor-pointer transition-colors ${className}`}
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
      onClick={onClick}
    >
      <ScrambleText text={text} isHovered={hovered} />
    </span>
  );
}

export default function Navbar({ entranceComplete }: { entranceComplete: boolean }) {
  const [menuOpen, setMenuOpen] = useState(false);
  const [downloadHovered, setDownloadHovered] = useState(false);

  return (
    <motion.nav
      className="fixed top-0 left-0 right-0 z-50 w-full bg-transparent"
      animate={{ opacity: entranceComplete ? 1 : 0 }}
      transition={{ duration: 0.8 }}
    >
      {/* Desktop Layout */}
      <div className="hidden sm:flex h-20 items-center justify-between px-4 sm:px-6 md:px-8">
        <div className="flex items-center gap-2">
          <motion.a
            className={`h-12 px-5 bg-white/15 backdrop-blur-md rounded-[14px] flex items-center gap-2.5 cursor-pointer ${menuOpen ? 'hidden md:flex' : ''}`}
            whileHover={{ scale: 1.02, backgroundColor: 'rgba(255,255,255,0.22)' }}
            whileTap={{ scale: 0.98 }}
          >
            <SynapseXLogo size={18} className="text-white" />
            <span className="text-[16px] font-medium tracking-tight text-white">SynapseX</span>
          </motion.a>

          <motion.div
            className="h-12 rounded-[14px] bg-white/15 backdrop-blur-md flex items-center overflow-hidden"
            animate={{ width: menuOpen ? 290 : 48 }}
            transition={{ type: 'spring', stiffness: 350, damping: 28 }}
          >
            <div
              className={menuOpen ? 'w-9 h-9 rounded-[11px] bg-white/10 hover:bg-white/20 flex items-center justify-center cursor-pointer ml-1.5' : 'w-12 h-12 rounded-[14px] flex items-center justify-center cursor-pointer'}
              onClick={() => setMenuOpen(!menuOpen)}
            >
              <SquashHamburger isOpen={menuOpen} onClick={() => setMenuOpen(!menuOpen)} />
            </div>

            <AnimatePresence>
              {menuOpen && (
                <motion.div
                  className="flex items-center gap-6 ml-4 shrink-0"
                  initial={{ opacity: 0, x: 15 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: 15 }}
                  transition={{ duration: 0.25 }}
                >
                  <NavLink
                    text="About"
                    onClick={() => window.scrollTo({ top: window.innerHeight, behavior: 'smooth' })}
                    className="text-[16px] font-normal text-white/85 hover:text-white"
                  />
                  <NavLink
                    text="Metrics"
                    onClick={() => window.scrollTo({ top: window.innerHeight * 2, behavior: 'smooth' })}
                    className="text-[16px] font-normal text-white/85 hover:text-white"
                  />
                </motion.div>
              )}
            </AnimatePresence>
          </motion.div>
        </div>

        <motion.button
          className="h-12 px-6 bg-white rounded-full flex items-center gap-2 cursor-pointer"
          onMouseEnter={() => setDownloadHovered(true)}
          onMouseLeave={() => setDownloadHovered(false)}
          whileHover={{ scale: 1.03, backgroundColor: '#e2e2e6' }}
          whileTap={{ scale: 0.97 }}
        >
          <i className="bi bi-apple text-[16px] text-black" />
          <ScrambleText text="Download" isHovered={downloadHovered} className="text-[16px] font-normal text-black" />
        </motion.button>
      </div>

      {/* Mobile Layout */}
      <div className="flex sm:hidden h-20 items-center justify-between px-4">
        <div className="flex items-center gap-2 flex-1">
          <motion.a
            className="h-9 px-3.5 bg-white/15 backdrop-blur-md rounded-[10px] flex items-center gap-2 cursor-pointer overflow-hidden whitespace-nowrap"
            animate={{ width: menuOpen ? 0 : 'auto', opacity: menuOpen ? 0 : 1, paddingLeft: menuOpen ? 0 : undefined, paddingRight: menuOpen ? 0 : undefined }}
            transition={{ type: 'spring', stiffness: 350, damping: 28 }}
          >
            <SynapseXLogo size={14} className="text-white" />
            <span className="text-[13px] font-medium tracking-tight text-white">SynapseX</span>
          </motion.a>

          <motion.div
            className="h-9 rounded-[10px] bg-white/15 backdrop-blur-md flex items-center overflow-hidden"
            animate={{ width: menuOpen ? '100%' : 36 }}
            transition={{ type: 'spring', stiffness: 350, damping: 28 }}
          >
            <div
              className={menuOpen ? 'w-7 h-7 rounded-[8px] bg-white/10 hover:bg-white/20 flex items-center justify-center cursor-pointer ml-1 shrink-0' : 'w-9 h-9 rounded-[10px] flex items-center justify-center cursor-pointer shrink-0'}
              onClick={() => setMenuOpen(!menuOpen)}
            >
              <SquashHamburger isOpen={menuOpen} onClick={() => setMenuOpen(!menuOpen)} />
            </div>

            <AnimatePresence>
              {menuOpen && (
                <motion.div
                  className="flex items-center gap-4 ml-3 shrink-0"
                  initial={{ opacity: 0, x: 15 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: 15 }}
                  transition={{ duration: 0.25 }}
                >
                  <NavLink
                    text="About"
                    onClick={() => window.scrollTo({ top: window.innerHeight, behavior: 'smooth' })}
                    className="text-[13px] font-normal text-white/85 hover:text-white"
                  />
                  <NavLink
                    text="Metrics"
                    onClick={() => window.scrollTo({ top: window.innerHeight * 2, behavior: 'smooth' })}
                    className="text-[13px] font-normal text-white/85 hover:text-white"
                  />
                </motion.div>
              )}
            </AnimatePresence>
          </motion.div>
        </div>

        {!menuOpen && (
          <motion.button
            className="h-9 px-3.5 bg-white rounded-full flex items-center gap-2 cursor-pointer shrink-0 ml-2"
            onMouseEnter={() => setDownloadHovered(true)}
            onMouseLeave={() => setDownloadHovered(false)}
            whileHover={{ scale: 1.03, backgroundColor: '#e2e2e6' }}
            whileTap={{ scale: 0.97 }}
          >
            <i className="bi bi-apple text-[13px] text-black" />
            <ScrambleText text="Download" isHovered={downloadHovered} className="text-[13px] font-normal text-black" />
          </motion.button>
        )}
      </div>
    </motion.nav>
  );
}
