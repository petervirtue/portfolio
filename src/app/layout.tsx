import "./globals.css";
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import { NextFont } from "next/dist/compiled/@next/font";
import { GoogleAnalytics } from "./components/googleAnalytics";

const isProduction: boolean = process.env.NODE_ENV === "production";

const inter: NextFont = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  title: "Peter Virtue",
  description: "Peter Virtue - Software Engineer",
  themeColor: "#ffffff",
  icons: [
    {
      url: "/favicon.ico",
      rel: "icon",
      sizes: "any",
      type: "image/svg+xml",
    },
  ],
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <head>{isProduction && <GoogleAnalytics />}</head>
      <body
        className={
          inter.className +
          " bg-slate-900 antialiased max-w-2xl flex flex-col md:flex-row mx-4 lg:mx-auto"
        }
      >
        {children}
      </body>
    </html>
  );
}
