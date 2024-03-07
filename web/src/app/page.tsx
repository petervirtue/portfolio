"use client";

import { useEffect } from "react";
import * as gtag from "../lib/gtag";
import { Navigation } from "./components/Navigation";
import { SocialNavigation } from "./components/SocialNavigation";
import { About } from "./components/About";

export default function Home() {
  useEffect(() => {
    gtag.pageview(new URL("/", "https://petervirtue.com"));
  });

  return (
    <div className="flex flex-col items-start justify-center w-screen h-screen overflow-hidden p-5 md:p-0">
      <Navigation />
      <About />
      <SocialNavigation />
    </div>
  );
}
