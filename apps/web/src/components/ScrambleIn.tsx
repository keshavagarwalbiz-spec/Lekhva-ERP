'use client';

import { useState, useEffect, useCallback } from 'react';

const CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+~|}{[]:;?><';

interface ScrambleInProps {
  text: string;
  delay: number;
  triggered: boolean;
  className?: string;
}

export default function ScrambleIn({ text, delay, triggered, className }: ScrambleInProps) {
  const [displayText, setDisplayText] = useState('');
  const [started, setStarted] = useState(false);

  const getRandomChar = useCallback(() => {
    return CHARS[Math.floor(Math.random() * CHARS.length)];
  }, []);

  useEffect(() => {
    if (!triggered) return;
    const timeout = setTimeout(() => setStarted(true), delay);
    return () => clearTimeout(timeout);
  }, [triggered, delay]);

  useEffect(() => {
    if (!started) return;

    let revealIndex = 0;
    const interval = setInterval(() => {
      revealIndex += 0.5;
      const currentIndex = Math.floor(revealIndex);

      if (currentIndex >= text.length) {
        setDisplayText(text);
        clearInterval(interval);
        return;
      }

      let result = '';
      for (let i = 0; i < text.length; i++) {
        if (text[i] === ' ') {
          result += ' ';
        } else if (i < currentIndex) {
          result += text[i];
        } else if (i < currentIndex + 3) {
          result += getRandomChar();
        } else {
          result += '';
        }
      }
      setDisplayText(result);
    }, 25);

    return () => clearInterval(interval);
  }, [started, text, getRandomChar]);

  if (!triggered || !started) {
    return <span className={className}>{"\u00A0"}</span>;
  }

  return <span className={className}>{displayText || '\u00A0'}</span>;
}
