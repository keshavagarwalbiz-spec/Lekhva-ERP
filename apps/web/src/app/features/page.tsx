
import { 
  Building2, Receipt, Users, ShieldCheck, Globe, Cpu, 
  Workflow, Lock, Smartphone, Scale, Link2, BookOpen,
  LineChart, FileText, LayoutDashboard, Truck, Briefcase
} from "lucide-react";

export default function FeaturesPage() {
  return (
    <div className="bg-white text-slate-900 font-sans pt-20">
      
      {/* HEADER */}
      <section className="bg-slate-50 py-24 px-6 border-b border-slate-200 text-center">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-5xl md:text-7xl font-bold tracking-tight text-slate-900 mb-6">
            The Complete Platform.
          </h1>
          <p className="text-xl md:text-2xl text-slate-600 leading-relaxed">
            28 Modules. 75+ Database Tables. One Unified Engine. Discover why Lekhva is the most powerful ERP ever built for the Indian market.
          </p>
        </div>
      </section>

      {/* 1. FOUNDATION & SECURITY */}
      <FeatureSection 
        title="Foundation & Security" 
        subtitle="Enterprise-grade infrastructure securing your financial data."
        icon={Lock}
        features={[
          { title: "DPDP Act 2023 Compliant", desc: "Explicit consent management, data principal rights panel, processing logs, and automated privacy notice generator." },
          { title: "Bank-Grade Encryption", desc: "AES-256-GCM encryption for sensitive columns (Aadhaar, PAN, Bank Accounts) with UI masking (XXXX-1234)." },
          { title: "Granular RBAC", desc: "Preset roles (Admin, HR, Warehouse, POS Cashier) plus a custom role builder with field-level security." },
          { title: "Universal Workflow Engine", desc: "Drag-and-drop approval chains (Sequential, Parallel, Auto-approve) for POs, expenses, and journal entries." }
        ]}
      />

      {/* 2. CORE ERP & LEDGER */}
      <FeatureSection 
        title="Core ERP & Ledger" 
        subtitle="A multi-company accounting engine that handles complex group structures."
        icon={Building2}
        reverse
        features={[
          { title: "Multi-Company Architecture", desc: "Switch between companies instantly (⌘+Shift+C). Run inter-company transactions and generate consolidated group financials." },
          { title: "Double-Entry Bookkeeping", desc: "Hierarchical COA with 5 root types, immutable auto-numbered journal entries, and automated sub-ledgers (AR, AP, Cash)." },
          { title: "Multi-Warehouse Inventory", desc: "Zone and bin hierarchy. FIFO & Weighted Average valuation. Batch, serial, and expiry tracking." },
          { title: "Landed Cost Calculation", desc: "Allocate purchase, freight, duty, and handling costs accurately across inventory by value, weight, or volume." }
        ]}
      />

      {/* 3. INVOICING & COMMERCE */}
      <FeatureSection 
        title="Invoicing & Commerce" 
        subtitle="Premium templates and omni-channel sales syncing."
        icon={Receipt}
        features={[
          { title: "Visual Template Designer", desc: "Drag-and-drop builder with 30+ premium templates (Modern, Classic, Thermal). Dynamic watermarks, digital signatures, and custom fields." },
          { title: "GST-Compliant Invoicing", desc: "Auto tax determination (CGST/SGST vs IGST), E-Invoicing (Schema v1.04), and E-Way Bill generation." },
          { title: "E-Commerce Sync Engine", desc: "Native adapters for Amazon SP-API, Flipkart, Shopify, and WooCommerce with distributed Redis locking for inventory sync." },
          { title: "Shipping & Logistics", desc: "Shiprocket and Delhivery API integration. Auto-generate AWBs, schedule pickups, and track COD remittances." }
        ]}
      />

      {/* 4. HRMS & PAYROLL */}
      <FeatureSection 
        title="People & Payroll" 
        subtitle="From recruitment to full & final settlement."
        icon={Users}
        reverse
        features={[
          { title: "Statutory Payroll", desc: "Configurable salary structures with automated EPF, ESI, Professional Tax, LWF, and TDS (Sec 192) computations." },
          { title: "Attendance & Leave", desc: "Web/Mobile GPS clock-in, biometric API integration, roster planning, and automated leave accruals." },
          { title: "Employee Self-Service", desc: "Dedicated portal for Form 12BB tax declarations, expense claims, payslip downloads, and performance reviews." },
          { title: "Project & Job Costing", desc: "Log hours per project. Allocate employee payroll costs + inventory materials to determine true project margins." }
        ]}
      />

      {/* 5. TAX FILING & COMPLIANCE */}
      <FeatureSection 
        title="Tax Filing & Compliance" 
        subtitle="Direct integration with GSTN and CBDT."
        icon={ShieldCheck}
        features={[
          { title: "GST Filing Engine", desc: "Auto-extract B2B/B2C data for GSTR-1, auto-compute GSTR-3B liability, and run 3-way matching for GSTR-2B reconciliation." },
          { title: "ITR Filing (1-7)", desc: "Auto-populate schedules (BS, P&L, BP, DPM) from the General Ledger, generate CBDT JSON, and e-file via ERI." },
          { title: "TDS Returns", desc: "Generate 24Q, 26Q, 27Q, and 27EQ returns with automated challan mapping and FVU file generation." },
          { title: "Advance Tax Planning", desc: "Old vs New regime comparators, 80C/80D optimizers, and quarterly liability projection with 234B/C interest calculation." }
        ]}
      />

      {/* 6. AI & INTELLIGENCE */}
      <FeatureSection 
        title="Financial AI Engine" 
        subtitle="Machine learning that actually saves you time."
        icon={Cpu}
        reverse
        features={[
          { title: "Invoice OCR Scanning", desc: "Drop an image and let Google Vision + Gemini extract the vendor name, line items, amounts, and GST details." },
          { title: "Smart Bank Reconciliation", desc: "AI-assisted matching (MT940/CSV) that learns from your manual categorization patterns over time." },
          { title: "Predictive Cash Flow", desc: "ML-based payment date prediction analyzing historical customer payment behavior." },
          { title: "NLP Queries", desc: "Ask \"Show top 10 customers by revenue this quarter\" in plain English and instantly receive generated charts." }
        ]}
      />

    </div>
  );
}

function FeatureSection({ title, subtitle, icon: Icon, features, reverse = false }: any) {
  return (
    <section className={`py-24 px-6 ${reverse ? "bg-slate-50 border-y border-slate-200" : "bg-white"}`}>
      <div className="max-w-7xl mx-auto flex flex-col lg:flex-row gap-16 items-start">
        
        {/* Text Area */}
        <div className={`lg:w-1/3 sticky top-32 ${reverse ? "lg:order-2" : ""}`}>
          <div className="w-16 h-16 bg-blue-100 rounded-2xl flex items-center justify-center mb-8">
            <Icon className="w-8 h-8 text-blue-600" />
          </div>
          <h2 className="text-4xl font-bold text-slate-900 mb-4">{title}</h2>
          <p className="text-lg text-slate-600">{subtitle}</p>
        </div>

        {/* Feature Grid */}
        <div className={`lg:w-2/3 grid grid-cols-1 md:grid-cols-2 gap-8 ${reverse ? "lg:order-1" : ""}`}>
          {features.map((f: any, idx: number) => (
            <div key={idx} className="bg-white p-8 rounded-2xl border border-slate-200 shadow-sm hover:shadow-md transition-shadow">
              <h3 className="text-xl font-bold text-slate-900 mb-3">{f.title}</h3>
              <p className="text-slate-600 leading-relaxed">{f.desc}</p>
            </div>
          ))}
        </div>

      </div>
    </section>
  );
}
