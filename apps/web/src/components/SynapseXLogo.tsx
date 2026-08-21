interface SynapseXLogoProps {
  className?: string;
  size?: number;
}

export default function SynapseXLogo({ className = '', size = 18 }: SynapseXLogoProps) {
  const d = 'M 1.5,23 L 1.5,33 C 1.5,38.5 6,43 11.5,43 L 16.5,43 C 22,43 26.5,38.5 26.5,33 Q 28,28 33,26.5 C 38.5,26.5 43,22 43,16.5 L 43,11.5 C 43,6 38.5,1.5 33,1.5 L 23,1.5 Q 12,12 1.5,23 Z';

  return (
    <svg
      className={className}
      width={size}
      height={size}
      viewBox="-50 -50 100 100"
      fill="currentColor"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d={d} transform="rotate(0)" />
      <path d={d} transform="rotate(90)" />
      <path d={d} transform="rotate(180)" />
      <path d={d} transform="rotate(270)" />
    </svg>
  );
}
