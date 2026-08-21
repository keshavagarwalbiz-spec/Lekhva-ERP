
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
