import { isProduction } from "./utils";

interface GTagEvent {
  action: string;
  category: string;
  label: string;
  value: number;
}

export const GA_TRACKING_ID = "G-4KCXQGTZYV";

export const pageview = (url: URL): void => {
  if (isProduction()) {
    window.gtag("config", GA_TRACKING_ID, {
      page_path: url,
    });
  }
};

export const event = ({ action, category, label, value }: GTagEvent): void => {
  if (isProduction()) {
    window.gtag("event", action, {
      event_category: category,
      event_label: label,
      value,
    });
  }
};
