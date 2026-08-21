
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
