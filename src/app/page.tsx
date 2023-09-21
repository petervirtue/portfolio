"use client";

import { useEffect } from "react";
import * as gtag from "../lib/gtag";

const isProduction = process.env.NODE_ENV === "production";

export default function Home() {
  useEffect(() => {
    if (isProduction) gtag.pageview(new URL("petervirtue.com"));

    const handleRouteChange = (url: URL) => {
      /* invoke analytics function only for production */
    };
  });

  return (
    <main className="grid bg-white min-h-screen place-items-center px-6 py-24">
      <div className="text-center">
        <p className="text-base font-semibold text-gray-700">
          🚧 Apologies for the appearance 🚧
        </p>
        <h1 className="mt-4 text-3xl font-bold tracking-tight text-gray-900 sm:text-5xl">
          A new site is in the works!
        </h1>
        <p className="text-base font-semibold text-gray-700 mt-5">
          In the meantime, feel free to{" "}
          <a className="underline" href="mailto:petervirtue18@gmail.com">
            shoot me an email
          </a>
        </p>
      </div>
    </main>
  );
}
