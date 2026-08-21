
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
