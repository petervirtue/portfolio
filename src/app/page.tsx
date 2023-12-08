"use client";

import { useEffect } from "react";
import * as gtag from "../lib/gtag";
import { Navigation } from "./components/nav";
import { About } from "./components/about";
import { Socials } from "./components/socials";

const isProduction = process.env.NODE_ENV === "production";

export default function Home() {
  useEffect(() => {
    if (isProduction) gtag.pageview(new URL("/", "https://petervirtue.com"));
  });

  return (
    <div className="flex flex-col items-start justify-center w-screen h-screen overflow-hidden p-5 md:p-0">
      <Navigation />
      <About />
      <Socials />
    </div>
  );
}
