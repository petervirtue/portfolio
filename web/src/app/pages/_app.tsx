import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import type { AppProps } from "next/app";

library.add(fas);

export default function MyApp({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />;
}
